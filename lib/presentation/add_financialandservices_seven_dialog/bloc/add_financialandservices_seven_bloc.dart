import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/extensionaccess.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/extensionsources.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/financial_services.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/extensionaccess.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_seven_dialog/models/add_financialandservices_seven_model.dart';
part 'add_financialandservices_seven_event.dart';
part 'add_financialandservices_seven_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesSeven according to the event that is dispatched to it.
class AddFinancialandservicesSevenBloc extends Bloc<
    AddFinancialandservicesSevenEvent, AddFinancialandservicesSevenState> {
  AddFinancialandservicesSevenBloc(
      AddFinancialandservicesSevenState initialState)
      : super(initialState) {
    on<AddFinancialandservicesSevenInitialEvent>(_onInitialize);
    on<ChangeAgeGroupCheckbox>(_changeAgeGroupCB);
    on<ResetCBs>(_resetCBs);

    on<AddCBs>(_addAgeGroups);
  }

  _changeAgeGroupCB(
    ChangeAgeGroupCheckbox event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addFinancialandservicesSevenModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addFinancialandservicesSevenModelObj:
            state.addFinancialandservicesSevenModelObj?.copyWith(
      models: newModels,
      count: state.addFinancialandservicesSevenModelObj!.count + 1,
    )));
  }

  Future<List<CheckBoxList>> fetchEService() async {
    List<CheckBoxList> list = [];
    ExtensionSourceDB farmStructureDB = ExtensionSourceDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].sourceType,
          id: value[i].extensionSourceId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) async {
    emit(state.copyWith(
        addFinancialandservicesSevenModelObj:
            state.addFinancialandservicesSevenModelObj?.copyWith(
      models: await fetchEService(),
      count: 0,
    )));
  }

  List<CheckBoxList> _access(
      List<CheckBoxList> feedmodelss, List<FarmerExtensionAccess> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerExtensionAccess> feeds = feedss;

    for (var ent in feeds) {
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.extensionSourceId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) {
    FarmerExtensionAccessDB farmerFishInputDB = FarmerExtensionAccessDB();
    List<FarmerExtensionAccess>? categs = [];
    List<FarmerExtensionAccess>? notit = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        notit.add(
          FarmerExtensionAccess(
            farmerExtensionAccessId: 0,
            farmerId: PrefUtils().getFarmerId(),
            farmerFarmId: PrefUtils().getFarmId(),
            extensionSourceId: model.id!,
            createdBy: userId,
            dateCreated: DateTime.now(),
          ),
        );
        if (model.isSelected) {
          categs.add(
            FarmerExtensionAccess(
              farmerExtensionAccessId: 0,
              farmerId: PrefUtils().getFarmerId(),
              farmerFarmId: PrefUtils().getFarmId(),
              extensionSourceId: model.id!,
              createdBy: userId,
              dateCreated: DateTime.now(),
            ),
          );
        }
      }
      if (state.addFinancialandservicesSevenModelObj!.access!.isEmpty) {
        farmerFishInputDB.insertExtensionAccess(notit).then((value) {
          print("inserted: $value");
        });
      }
      farmerFishInputDB
          .delete(PrefUtils().getFarmerId())
          .then((value) => print("deleted: $value"));

      farmerFishInputDB.reinsertExtensionAccess(categs).then((value) {
        print("inserted: $value");
      });

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  Future<List<FarmerExtensionAccess>?> getEAccess() async {
    int id = PrefUtils().getFarmId();
    FarmerExtensionAccessDB farmerLivestockAgeGroupsDB =
        FarmerExtensionAccessDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<List<FarmerExtensionAccess>?> getallEAccess() async {
    int id = PrefUtils().getFarmId();
    FarmerExtensionAccessDB farmerLivestockAgeGroupsDB =
        FarmerExtensionAccessDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmAll(id);
  }

  Future<FSProgress?> getProgress() async {
    int id = PrefUtils().getFarmId();
    FSProgressDB pfProgressDB = FSProgressDB();
    return await pfProgressDB.fetchByFarm(id);
  }

  _onInitialize(
    AddFinancialandservicesSevenInitialEvent event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) async {
    FSProgress pfProgress = await getProgress() ??
        FSProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );

    List<CheckBoxList>? accessmodels = await fetchEService();

    //if (pfProgress.pageTwo == 1) {
    List<FarmerExtensionAccess>? access = await getEAccess() ?? [];
    List<FarmerExtensionAccess>? allaccess = await getallEAccess() ?? [];
    accessmodels = access.isNotEmpty
        ? accessmodels = _access(accessmodels, access)
        : accessmodels;
    //   }
    emit(state.copyWith(
        addFinancialandservicesSevenModelObj:
            state.addFinancialandservicesSevenModelObj?.copyWith(
      models: accessmodels,
      fsProgress: pfProgress,
      access: allaccess,
    )));
  }
}

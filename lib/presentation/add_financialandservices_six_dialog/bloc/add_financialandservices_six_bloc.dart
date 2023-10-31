import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/agriinfosource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/agriculturalinfosource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/financial_services.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/agriinfosource.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_six_dialog/models/add_financialandservices_six_model.dart';
part 'add_financialandservices_six_event.dart';
part 'add_financialandservices_six_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesSix according to the event that is dispatched to it.
class AddFinancialandservicesSixBloc extends Bloc<
    AddFinancialandservicesSixEvent, AddFinancialandservicesSixState> {
  AddFinancialandservicesSixBloc(AddFinancialandservicesSixState initialState)
      : super(initialState) {
    on<AddFinancialandservicesSixInitialEvent>(_onInitialize);
    on<ChangeCheckbox>(_changeAgeGroupCB);
    on<ResetCBs>(_resetCBs);

    on<AddCBs>(_addAgeGroups);
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddFinancialandservicesSixState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addFinancialandservicesSixModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addFinancialandservicesSixModelObj:
            state.addFinancialandservicesSixModelObj?.copyWith(
      models: newModels,
      count: state.addFinancialandservicesSixModelObj!.count + 1,
    )));
  }

  Future<List<CheckBoxList>> fetchInfo() async {
    List<CheckBoxList> list = [];
    AgriInfoSourceDB farmStructureDB = AgriInfoSourceDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].agriInfoSource,
          id: value[i].agriInfoSourceId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddFinancialandservicesSixState> emit,
  ) async {
    emit(state.copyWith(
        addFinancialandservicesSixModelObj:
            state.addFinancialandservicesSixModelObj?.copyWith(
      models: await fetchInfo(),
      count: 0,
    )));
  }

  List<CheckBoxList> _infos(
      List<CheckBoxList> feedmodelss, List<FarmerAgriInfoSource> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerAgriInfoSource> feeds = feedss;

    for (var ent in feeds) {
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.agriInfoSourceId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddFinancialandservicesSixState> emit,
  ) {
    FarmerAgriInfoSourceDB farmerFishInputDB = FarmerAgriInfoSourceDB();
    List<FarmerAgriInfoSource>? categs = [];
    List<FarmerAgriInfoSource>? notit = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        notit.add(
          FarmerAgriInfoSource(
            farmerAgriInfoSourceId: 0,
            farmerId: PrefUtils().getFarmerId(),
            agriInfoSourceId: model.id!,
            enumeratorId: userId,
          ),
        );
        if (model.isSelected) {
          categs.add(
            FarmerAgriInfoSource(
              farmerAgriInfoSourceId: 0,
              farmerId: PrefUtils().getFarmerId(),
              agriInfoSourceId: model.id!,
              enumeratorId: userId,
            ),
          );
        }
      }
      if (state.addFinancialandservicesSixModelObj!.info!.isEmpty) {
        farmerFishInputDB.insertAgriInfoSources(notit).then((value) {
          print("inserted: $value");
        });
      }
      farmerFishInputDB
          .delete(PrefUtils().getFarmerId())
          .then((value) => print("deleted: $value"));

      farmerFishInputDB.reinsertAgriInfoSources(categs).then((value) {
        print("inserted: $value");
      });

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  Future<List<FarmerAgriInfoSource>?> getInfo() async {
    int id = PrefUtils().getFarmerId();
    FarmerAgriInfoSourceDB farmerLivestockAgeGroupsDB =
        FarmerAgriInfoSourceDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmerId(id);
  }

  Future<FSProgress?> getProgress() async {
    int farmerid = PrefUtils().getFarmId();
    FSProgressDB pfProgressDB = FSProgressDB();
    return await pfProgressDB.fetchByFarm(farmerid);
  }

  _onInitialize(
    AddFinancialandservicesSixInitialEvent event,
    Emitter<AddFinancialandservicesSixState> emit,
  ) async {
    FSProgress pfProgress = await getProgress() ??
        FSProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );

    List<CheckBoxList>? infomodels = await fetchInfo();

    //  if (pfProgress.pageTwo == 1) {
    List<FarmerAgriInfoSource>? info = await getInfo() ?? [];
    infomodels =
        info.isNotEmpty ? infomodels = _infos(infomodels, info) : infomodels;

    ///   }
    emit(state.copyWith(
        addFinancialandservicesSixModelObj:
            state.addFinancialandservicesSixModelObj?.copyWith(
      models: infomodels,
      fsProgress: pfProgress,
      info: info,
    )));
  }
}

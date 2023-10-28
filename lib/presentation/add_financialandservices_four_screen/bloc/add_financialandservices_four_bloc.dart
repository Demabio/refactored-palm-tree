import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/cooperativegroup.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/cooperativegroups.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/financial_services.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/cooperativegroups.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_four_screen/models/add_financialandservices_four_model.dart';
part 'add_financialandservices_four_event.dart';
part 'add_financialandservices_four_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesFour according to the event that is dispatched to it.
class AddFinancialandservicesFourBloc extends Bloc<
    AddFinancialandservicesFourEvent, AddFinancialandservicesFourState> {
  AddFinancialandservicesFourBloc(AddFinancialandservicesFourState initialState)
      : super(initialState) {
    on<AddFinancialandservicesFourInitialEvent>(_onInitialize);

    on<ChangeAgeGroupCheckbox>(_changeAgeGroupCB);
    on<ResetCBs>(_resetCBs);

    on<AddCBs>(_addAgeGroups);
  }
  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  _changeAgeGroupCB(
    ChangeAgeGroupCheckbox event,
    Emitter<AddFinancialandservicesFourState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addFinancialandservicesFourModelObj!.ageGroupmModels;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addFinancialandservicesFourModelObj:
            state.addFinancialandservicesFourModelObj?.copyWith(
      ageGroupmModels: newModels,
      count: state.addFinancialandservicesFourModelObj!.count + 1,
    )));
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddFinancialandservicesFourState> emit,
  ) async {
    emit(state.copyWith(
        addFinancialandservicesFourModelObj:
            state.addFinancialandservicesFourModelObj?.copyWith(
      ageGroupmModels: await fetchCoops(),
      count: 0,
    )));
  }

  List<CheckBoxList> _coops(
      List<CheckBoxList> feedmodelss, List<FarmerCooperativeGroup> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerCooperativeGroup> feeds = feedss;

    for (var ent in feeds) {
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.cooperateiveGroupId);

      feedmodels[index].isSelected = true;
      feedmodels[index].male =
          TextEditingController(text: ent.cooperateiveGroupName ?? "N/A");
    }

    return feedmodels;
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddFinancialandservicesFourState> emit,
  ) {
    FarmerCooperativeGroupDB farmerFishInputDB = FarmerCooperativeGroupDB();
    List<FarmerCooperativeGroup>? categs = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        if (model.isSelected) {
          categs.add(
            FarmerCooperativeGroup(
                farmerCooperativeGroupId: 0,
                farmerId: PrefUtils().getFarmerId(),
                farmerFarmId: PrefUtils().getFarmId(),
                cooperateiveGroupName: model.male?.text,
                cooperateiveGroupId: model.id!,
                createdBy: userId,
                dateCreated: DateTime.now()),
          );
        }
      }
      if (state.addFinancialandservicesFourModelObj!.fsProgress?.pageOne == 0) {
        farmerFishInputDB.insertCooperativeGroups(categs).then((value) {
          print("inserted: $value");
        });
      } else {
        farmerFishInputDB
            .delete(PrefUtils().getFarmerId())
            .then((value) => print("deleted: $value"));
        farmerFishInputDB.insertCooperativeGroups(categs).then((value) {
          print("inserted: $value");
        });
      }

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  Future<List<CheckBoxList>> fetchCoops() async {
    List<CheckBoxList> list = [];

    List<SelectionPopupModel> dpds = [
      SelectionPopupModel(title: "Full Member", id: 1),
      SelectionPopupModel(title: "Out Grower Member", id: 0),
    ];

    CooperativeGroupDB livestockAgeGroupDB = CooperativeGroupDB();
    await livestockAgeGroupDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].group,
          id: value[i].cooperativeGroupId,
          female: TextEditingController(),
          male: TextEditingController(),
          focusNode: FocusNode(),
          femalefocusNode: FocusNode(),
          model: dpds,
        ));
      }
    });
    return list;
  }

  Future<List<FarmerCooperativeGroup>?> getCoops() async {
    int id = PrefUtils().getFarmerId();
    FarmerCooperativeGroupDB farmerLivestockAgeGroupsDB =
        FarmerCooperativeGroupDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmerId(id);
  }

  Future<FSProgress?> getProgress() async {
    int id = PrefUtils().getFarmId();
    FSProgressDB pfProgressDB = FSProgressDB();
    return await pfProgressDB.fetchByFarm(id);
  }

  _onInitialize(
    AddFinancialandservicesFourInitialEvent event,
    Emitter<AddFinancialandservicesFourState> emit,
  ) async {
    FSProgress pfProgress = await getProgress() ??
        FSProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );

    List<CheckBoxList>? coopmodels = await fetchCoops();

    //if (pfProgress.pageOne == 1) {
    List<FarmerCooperativeGroup>? groups = await getCoops();
    if (groups != null) {
      coopmodels = _coops(coopmodels, groups);
    } // }
    emit(state.copyWith(
        addFinancialandservicesFourModelObj:
            state.addFinancialandservicesFourModelObj?.copyWith(
      ageGroupmModels: coopmodels,
    )));
  }
}

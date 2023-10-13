import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/cooperativegroup.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/creditservice.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/incomesource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/cooperativegroups.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/creditsource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/incomesource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/financial_services.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/cooperativegroups.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/creditservice.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/incomesource.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_one_screen/models/add_financialandservices_one_model.dart';
part 'add_financialandservices_one_event.dart';
part 'add_financialandservices_one_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesOne according to the event that is dispatched to it.
class AddFinancialandservicesOneBloc extends Bloc<
    AddFinancialandservicesOneEvent, AddFinancialandservicesOneState> {
  AddFinancialandservicesOneBloc(AddFinancialandservicesOneState initialState)
      : super(initialState) {
    on<AddFinancialandservicesOneInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<SaveTapEvent>(_saveTap);
    on<NextTapEvent>(_nextTap);

    on<CheckThreeEvent>(_checkpowers);
    on<CheckTwoEvent>(_checkAssets);
    on<CheckOneEvent>(_checkIncomes);

    on<ClearEvent>(_clear);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue: event.value,
        addFinancialandservicesOneModelObj:
            state.addFinancialandservicesOneModelObj?.copyWith(
          selectedDropDownValue:
              state.addFinancialandservicesOneModelObj?.selectedDropDownValue,
        )));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Yes",
      ),
      SelectionPopupModel(
        id: 0,
        title: "No",
      ),
    ];
  }

  _saveTap(
    SaveTapEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) async {
    int farmerid = PrefUtils().getFarmerId();
    int selectedCount =
        state.c.where((enterprise) => enterprise.isSelected).length;

    int selectedCount2 =
        state.s.where((enterprise) => enterprise.isSelected).length;
    FarmerDB farmerDB = FarmerDB();
    try {
      FSProgressDB atProgressDB = FSProgressDB();
      if (state.addFinancialandservicesOneModelObj!.fsProgress!.pageOne == 0 &&
          selectedCount != 0 &&
          (selectedCount2 != 0 ||
              state.addFinancialandservicesOneModelObj?.selectedDropDownValue!
                      .id ==
                  0)) {
        int id = await farmerDB.updateFromFinancial(Farmer(
          farmerId: farmerid,
          farmerName: "NA",
          cooperativeGroup: state.addFinancialandservicesOneModelObj!
                  .selectedDropDownValue?.id ==
              1,
        ));
        //REMEMBER!!!!!!!!
        //   if (id > 0) {
        atProgressDB
            .insert(FSProgress(
              farmerId: farmerid,
              pageTwo:
                  state.addFinancialandservicesOneModelObj!.fsProgress!.pageTwo,
              pageOne: 1,
            ))
            .then((value) => print("Scope FI" + value.toString()));
        event.createSuccessful!.call();
        //}
      } else if (selectedCount != 0 &&
          (selectedCount2 != 0 ||
              state.addFinancialandservicesOneModelObj?.selectedDropDownValue!
                      .id ==
                  0)) {
        int updatedid = await farmerDB.updateFromFarmAsset(Farmer(
          farmerId: farmerid,
          farmerName: "NA",
          cooperativeGroup: state.addFinancialandservicesOneModelObj!
                  .selectedDropDownValue?.id ==
              1,
        ));
        //  if (id > 0) {
        atProgressDB
            .update(FSProgress(
              farmerId: farmerid,
              pageTwo:
                  state.addFinancialandservicesOneModelObj!.fsProgress!.pageTwo,
              pageOne: 1,
            ))
            .then((value) => print("Scope FI" + value.toString()));
        event.createSuccessful!.call();
        //   }
      } else {
        //   event.createFailed!.call();
        int selectedCount =
            state.c.where((enterprise) => enterprise.isSelected).length;

        int selectedCount2 =
            state.s.where((enterprise) => enterprise.isSelected).length;

        emit(state.copyWith(
          checka: selectedCount == 0,
          checkb: (selectedCount2 == 0 &&
              state.addFinancialandservicesOneModelObj?.selectedDropDownValue!
                      .id !=
                  0),
        ));
      }
    } catch (e) {
      event.createFailed!.call();
    }
  }

  _nextTap(
    NextTapEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) async {
    int farmerid = PrefUtils().getFarmerId();
    int selectedCount =
        state.c.where((enterprise) => enterprise.isSelected).length;

    int selectedCount2 =
        state.s.where((enterprise) => enterprise.isSelected).length;
    FarmerDB farmerDB = FarmerDB();
    try {
      FSProgressDB atProgressDB = FSProgressDB();
      if (state.addFinancialandservicesOneModelObj!.fsProgress!.pageOne == 0 &&
          selectedCount != 0 &&
          (selectedCount2 != 0 ||
              state.addFinancialandservicesOneModelObj?.selectedDropDownValue!
                      .id ==
                  0)) {
        int id = await farmerDB.updateFromFinancial(Farmer(
          farmerId: farmerid,
          farmerName: "NA",
          cooperativeGroup: state.addFinancialandservicesOneModelObj!
                  .selectedDropDownValue?.id ==
              1,
        ));
        //REMEMBER!!!!!!!!
        //   if (id > 0) {
        atProgressDB
            .insert(FSProgress(
              farmerId: farmerid,
              pageTwo:
                  state.addFinancialandservicesOneModelObj!.fsProgress!.pageTwo,
              pageOne: 1,
            ))
            .then((value) => print("Scope FI" + value.toString()));
        event.createSuccessful!.call();
        //}
      } else if (selectedCount != 0 &&
          (selectedCount2 != 0 ||
              state.addFinancialandservicesOneModelObj?.selectedDropDownValue!
                      .id ==
                  0)) {
        int updatedid = await farmerDB.updateFromFarmAsset(Farmer(
          farmerId: farmerid,
          farmerName: "NA",
          cooperativeGroup: state.addFinancialandservicesOneModelObj!
                  .selectedDropDownValue?.id ==
              1,
        ));
        //  if (id > 0) {
        atProgressDB
            .update(FSProgress(
              farmerId: farmerid,
              pageTwo:
                  state.addFinancialandservicesOneModelObj!.fsProgress!.pageTwo,
              pageOne: 1,
            ))
            .then((value) => print("Scope FI" + value.toString()));
        event.createSuccessful!.call();
        //   }
      } else {
        //   event.createFailed!.call();
        int selectedCount =
            state.c.where((enterprise) => enterprise.isSelected).length;

        int selectedCount2 =
            state.s.where((enterprise) => enterprise.isSelected).length;

        emit(state.copyWith(
          checka: selectedCount == 0,
          checkb: (selectedCount2 == 0 &&
              state.addFinancialandservicesOneModelObj?.selectedDropDownValue!
                      .id !=
                  0),
        ));
      }
    } catch (e) {
      event.createFailed!.call();
    }
  }

  _checkpowers(
    CheckThreeEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) async {
    List<FarmerCreditService>? fishes = await getCredits();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchFinancialServ();

    feedmodels = _credits(feedmodels, fishes!);

    if (fishes.isNotEmpty) {
      emit(state.copyWith(s: feedmodels, checkb: false));
    } else {
      emit(state.copyWith(checkb: true));
    }
  }

  _checkAssets(
    CheckTwoEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) async {
    List<FarmerCooperativeGroup>? fishes = await getCoops();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchCoops();

    feedmodels = _coops(feedmodels, fishes!);

    if (fishes.isNotEmpty) {
      emit(state.copyWith(c: feedmodels, checka: false));
    } else {
      emit(state.copyWith(checka: true));
    }
  }

  _checkIncomes(
    CheckOneEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) async {
    List<FarmerIncomeSource>? fishes = await getIncomes();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchIncomes();

    feedmodels = _incomes(feedmodels, fishes!);

    if (fishes.isNotEmpty) {
      emit(state.copyWith(
        i: feedmodels,
      ));
    }
  }

  _clear(
    ClearEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) async {
    if (state.addFinancialandservicesOneModelObj?.fsProgress!.pageOne == 0) {
      int farmerid = PrefUtils().getFarmerId();
      FarmerCreditServiceDB farmerCreditServiceDB = FarmerCreditServiceDB();
      FarmerIncomeSourceDB farmerIncomeSourceDB = FarmerIncomeSourceDB();
      FarmerCooperativeGroupDB farmerCooperativeGroupDB =
          FarmerCooperativeGroupDB();
      farmerCreditServiceDB
          .delete(farmerid)
          .then((value) => print("Deleted: $value"));
      farmerIncomeSourceDB
          .delete(farmerid)
          .then((value) => print("Deleted: $value"));
      farmerCooperativeGroupDB
          .delete(farmerid)
          .then((value) => print("Deleted: $value"));
    }
  }

  Future<List<CheckBoxList>> fetchIncomes() async {
    List<CheckBoxList> list = [];
    IncomeSourceDB farmStructureDB = IncomeSourceDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].incomeSource,
          id: value[i].incomeSourceId,
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fetchFinancialServ() async {
    List<CheckBoxList> list = [];
    CreditSourceDB farmStructureDB = CreditSourceDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].creditSource,
          id: value[i].creditSourceId,
        ));
      }
    });
    return list;
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

  List<CheckBoxList> _credits(
      List<CheckBoxList> feedmodelss, List<FarmerCreditService> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerCreditService> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.creditSourceId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  List<CheckBoxList> _coops(
      List<CheckBoxList> feedmodelss, List<FarmerCooperativeGroup> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerCooperativeGroup> feeds = feedss;

    for (var ent in feeds) {
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.cooperateiveGroupId);

      feedmodels[index].isSelected = true;
      feedmodels[index].var1 = ent.cooperateiveGroupName ?? "N/A";
    }

    return feedmodels;
  }

  List<CheckBoxList> _incomes(
      List<CheckBoxList> feedmodelss, List<FarmerIncomeSource> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerIncomeSource> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.incomeSourceId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  Future<List<FarmerCooperativeGroup>?> getCoops() async {
    int id = PrefUtils().getFarmerId();
    FarmerCooperativeGroupDB farmerLivestockAgeGroupsDB =
        FarmerCooperativeGroupDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmerId(id);
  }

  Future<List<FarmerIncomeSource>?> getIncomes() async {
    int id = PrefUtils().getFarmerId();
    FarmerIncomeSourceDB farmerLivestockAgeGroupsDB = FarmerIncomeSourceDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmerId(id);
  }

  Future<Farmer?> getFarmer() async {
    int farmerid = PrefUtils().getFarmerId();
    FarmerDB farmerFishProductionLevelsDB = FarmerDB();
    return await farmerFishProductionLevelsDB.fetchByFarmerId(farmerid);
  }

  Future<FSProgress?> getProgress() async {
    int farmerid = PrefUtils().getFarmerId();
    FSProgressDB pfProgressDB = FSProgressDB();
    return await pfProgressDB.fetchByFarmerId(farmerid);
  }

  Future<List<FarmerCreditService>?> getCredits() async {
    int id = PrefUtils().getFarmerId();
    FarmerCreditServiceDB farmerLivestockAgeGroupsDB = FarmerCreditServiceDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmerId(id);
  }

  _onInitialize(
    AddFinancialandservicesOneInitialEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) async {
    FSProgress pfProgress = await getProgress() ??
        FSProgress(
          farmerId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    Farmer farmer = await getFarmer() ??
        Farmer(
          farmerId: 0,
          farmerName: "farmerName",
          labourSourceId: 0,
          cooperativeGroup: false,
        );
    List<CheckBoxList>? coopmodels = await fetchCoops();
    List<CheckBoxList>? incomemodels = await fetchIncomes();
    List<CheckBoxList>? creditmodels = await fetchFinancialServ();

    TextEditingController at = TextEditingController();
    List<SelectionPopupModel>? a = await fillDropdownItemList();
    SelectionPopupModel? aa;

    if (pfProgress.pageOne == 1) {
      List<FarmerCooperativeGroup>? groups = await getCoops();
      coopmodels = _coops(coopmodels, groups!);
      List<FarmerIncomeSource>? incomes = await getIncomes();
      incomemodels = _incomes(incomemodels, incomes!);
      List<FarmerCreditService>? categs = await getCredits();
      creditmodels = _credits(creditmodels, categs!);

      if (farmer.cooperativeGroup!) {
        aa = a.firstWhere(
          (model) => model.id == (farmer.cooperativeGroup! ? 1 : 0),
        );
      }

      if (farmer.farmingIncomePercent != null) {
        at =
            TextEditingController(text: farmer.farmingIncomePercent.toString());
      }
    }

    int stepped = 0;
    if (pfProgress.pageTwo == 1) {
      stepped = 2;
    } else if (pfProgress.pageOne == 1) {
      stepped = 1;
    }
    emit(state.copyWith(
        selectvalueoneController: at,
        i: incomemodels,
        c: coopmodels,
        s: creditmodels,
        addFinancialandservicesOneModelObj:
            state.addFinancialandservicesOneModelObj?.copyWith(
          dropdownItemList: a,
          fsProgress: pfProgress,
          selectedDropDownValue: aa,
          stepped2: stepped,
        )));
  }
}

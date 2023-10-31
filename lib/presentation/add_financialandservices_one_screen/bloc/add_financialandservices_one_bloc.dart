import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/agriinfosource.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/cooperativegroup.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/creditservice.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/incomesource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/agriculturalinfosource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/cooperativegroups.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/creditsource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/incomesource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/financial_services.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/agriinfosource.dart';
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
    on<CheckFourEvent>(_checkinfopowers);
    on<GoBackEvent>(_goback);

    on<ClearEvent>(_clear);
  }
  _goback(
    GoBackEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) async {
    if ((state.checka || state.checkb || state.checkp) &&
        state.addFinancialandservicesOneModelObj?.fsProgress!.pageOne == 1) {
      event.createFailed?.call();
    } else {
      event.createSuccessful?.call();
    }
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue: event.value,
        addFinancialandservicesOneModelObj:
            state.addFinancialandservicesOneModelObj?.copyWith(
          selectedDropDownValue: event.value,
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
    if (PrefUtils().getYesNo()) {
      int farmerid = PrefUtils().getFarmerId();
      int farmid = PrefUtils().getFarmId();
      int selectedCount =
          state.c.where((enterprise) => enterprise.isSelected).length;

      int selectedCount2 =
          state.s.where((enterprise) => enterprise.isSelected).length;
      int selectedCount3 =
          state.p.where((enterprise) => enterprise.isSelected).length;
      FarmerDB farmerDB = FarmerDB();
      try {
        FSProgressDB atProgressDB = FSProgressDB();
        if ((!state.credit && !state.income && !state.group) &&
            selectedCount2 != 0 &&
            selectedCount3 != 0 &&
            (selectedCount != 0 ||
                state.addFinancialandservicesOneModelObj?.selectedDropDownValue!
                        .id ==
                    0)) {
          int id = await farmerDB.updateFromFinancial(Farmer(
            farmerId: farmerid,
            farmerName: "NA",
            cooperativeGroup: state.addFinancialandservicesOneModelObj!
                    .selectedDropDownValue?.id ==
                1,
            farmingIncomePercent: double.parse(
                state.selectvalueoneController!.text == ""
                    ? "0"
                    : state.selectvalueoneController!.text),
          ));
          //REMEMBER!!!!!!!!
          if (id > 0) {
            atProgressDB
                .insert(FSProgress(
                  farmId: farmid,
                  pageTwo: state
                      .addFinancialandservicesOneModelObj!.fsProgress!.pageTwo,
                  pageOne: 1,
                ))
                .then((value) => print("Scope FI" + value.toString()));
            event.createSuccessful!.call();
          }
        } else if (selectedCount2 != 0 &&
            selectedCount3 != 0 &&
            (selectedCount != 0 ||
                state.addFinancialandservicesOneModelObj?.selectedDropDownValue!
                        .id ==
                    0)) {
          int updatedid = await farmerDB.updateFromFinancial(Farmer(
            farmerId: farmerid,
            farmerName: "NA",
            cooperativeGroup: state.addFinancialandservicesOneModelObj!
                    .selectedDropDownValue?.id ==
                1,
            farmingIncomePercent: double.parse(
                state.selectvalueoneController!.text == ""
                    ? "0"
                    : state.selectvalueoneController!.text),
          ));
          if (updatedid > 0) {
            atProgressDB
                .update(FSProgress(
                  farmId: farmid,
                  pageTwo: state
                      .addFinancialandservicesOneModelObj!.fsProgress!.pageTwo,
                  pageOne: 1,
                ))
                .then((value) => print("Scope FI" + value.toString()));
            event.createSuccessful!.call();
          }
        } else {
          //   event.createFailed!.call();
          int selectedCount =
              state.c.where((enterprise) => enterprise.isSelected).length;

          int selectedCount2 =
              state.s.where((enterprise) => enterprise.isSelected).length;
          int selectedCount3 =
              state.p.where((enterprise) => enterprise.isSelected).length;
          emit(state.copyWith(
            checka: selectedCount == 0,
            checkp: selectedCount3 == 0,
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
  }

  _nextTap(
    NextTapEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) async {
    int farmerid = PrefUtils().getFarmerId();
    int farmid = PrefUtils().getFarmId();
    int selectedCount =
        state.c.where((enterprise) => enterprise.isSelected).length;

    int selectedCount2 =
        state.s.where((enterprise) => enterprise.isSelected).length;
    int selectedCount3 =
        state.p.where((enterprise) => enterprise.isSelected).length;
    FarmerDB farmerDB = FarmerDB();
    try {
      FSProgressDB atProgressDB = FSProgressDB();
      if ((!state.credit && !state.income && !state.group) &&
          selectedCount2 != 0 &&
          selectedCount3 != 0 &&
          (selectedCount != 0 ||
              state.addFinancialandservicesOneModelObj?.selectedDropDownValue!
                      .id ==
                  0)) {
        int id = await farmerDB.updateFromFinancial(Farmer(
          farmerId: farmerid,
          farmerName: "NA",
          cooperativeGroup: state.addFinancialandservicesOneModelObj!
                  .selectedDropDownValue?.id ==
              1,
          farmingIncomePercent: double.parse(
              state.selectvalueoneController!.text == ""
                  ? "0"
                  : state.selectvalueoneController!.text),
        ));
        //REMEMBER!!!!!!!!
        if (id > 0) {
          atProgressDB
              .insert(FSProgress(
                farmId: farmid,
                pageTwo: state
                    .addFinancialandservicesOneModelObj!.fsProgress!.pageTwo,
                pageOne: 1,
              ))
              .then((value) => print("Scope FI" + value.toString()));
          event.createSuccessful!.call();
        }
      } else if (selectedCount2 != 0 &&
          selectedCount3 != 0 &&
          (selectedCount != 0 ||
              state.addFinancialandservicesOneModelObj?.selectedDropDownValue!
                      .id ==
                  0)) {
        int updatedid = await farmerDB.updateFromFinancial(Farmer(
          farmerId: farmerid,
          farmerName: "NA",
          cooperativeGroup: state.addFinancialandservicesOneModelObj!
                  .selectedDropDownValue?.id ==
              1,
          farmingIncomePercent: double.parse(
              state.selectvalueoneController!.text == ""
                  ? "0"
                  : state.selectvalueoneController!.text),
        ));
        if (updatedid > 0) {
          atProgressDB
              .update(FSProgress(
                farmId: farmid,
                pageTwo: state
                    .addFinancialandservicesOneModelObj!.fsProgress!.pageTwo,
                pageOne: 1,
              ))
              .then((value) => print("Scope FI" + value.toString()));
          event.createSuccessful!.call();
        }
      } else {
        //   event.createFailed!.call();
        int selectedCount =
            state.c.where((enterprise) => enterprise.isSelected).length;

        int selectedCount2 =
            state.s.where((enterprise) => enterprise.isSelected).length;
        int selectedCount3 =
            state.p.where((enterprise) => enterprise.isSelected).length;
        emit(state.copyWith(
          checka: selectedCount == 0,
          checkp: selectedCount3 == 0,
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

    feedmodels =
        fishes != null ? feedmodels = _credits(feedmodels, fishes) : feedmodels;

    fishes != null
        ? emit(state.copyWith(s: feedmodels, checkb: false))
        : emit(state.copyWith(
            s: feedmodels,
          ));
  }

  _checkAssets(
    CheckTwoEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) async {
    List<FarmerCooperativeGroup>? fishes = await getCoops();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchCoops();

    feedmodels = fishes != null ? _coops(feedmodels, fishes) : feedmodels;
    fishes != null
        ? emit(state.copyWith(c: feedmodels, checka: false))
        : emit(state.copyWith(
            checka: true,
            c: feedmodels,
          ));

    // if (fishes.isNotEmpty) {
    // } else {
    // }
  }

  _checkIncomes(
    CheckOneEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) async {
    List<FarmerIncomeSource>? fishes = await getIncomes();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchIncomes();

    feedmodels =
        fishes != null ? feedmodels = _incomes(feedmodels, fishes) : feedmodels;

    fishes != null
        ? emit(state.copyWith(i: feedmodels))
        : emit(state.copyWith(i: feedmodels));
  }

  _checkinfopowers(
    CheckFourEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) async {
    List<FarmerAgriInfoSource>? fishes = await getInfo();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchInfo();

    feedmodels =
        fishes != null ? feedmodels = _infos(feedmodels, fishes) : feedmodels;

    fishes != null
        ? emit(state.copyWith(p: feedmodels, checkp: false))
        : emit(state.copyWith(checkp: true, p: feedmodels));
  }

  _clear(
    ClearEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) async {
    if (!state.credit && !state.income && !state.group) {
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
    await livestockAgeGroupDB.fetchAll().then((value) {
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

  Future<List<FarmerAgriInfoSource>?> getInfo() async {
    int id = PrefUtils().getFarmerId();
    FarmerAgriInfoSourceDB farmerLivestockAgeGroupsDB =
        FarmerAgriInfoSourceDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmerId(id);
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
    int id = PrefUtils().getFarmId();
    FSProgressDB pfProgressDB = FSProgressDB();
    return await pfProgressDB.fetchByFarm(id);
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
          farmId: 0,
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
    List<CheckBoxList>? infomodels = await fetchInfo();

    bool group = false;
    bool income = false;
    bool credit = false;
    TextEditingController at = TextEditingController();
    List<SelectionPopupModel>? a = fillDropdownItemList();
    SelectionPopupModel? aa;

    List<FarmerCooperativeGroup>? groups = await getCoops();
    if (groups != null) {
      coopmodels = _coops(coopmodels, groups);
      group = true;
    }

    List<FarmerAgriInfoSource>? info = await getInfo();
    if (info != null) {
      infomodels = _infos(infomodels, info);
    }
    List<FarmerIncomeSource>? incomes = await getIncomes();
    if (incomes != null) {
      incomemodels = _incomes(incomemodels, incomes);
      income = true;
    }
    List<FarmerCreditService>? categs = await getCredits();
    if (categs != null) {
      creditmodels = _credits(creditmodels, categs);
      group = true;
    }
    if (farmer.cooperativeGroup != null) {
      aa = a.firstWhere(
        (model) => model.id == (farmer.cooperativeGroup! ? 1 : 0),
      );
    }
    if (farmer.farmingIncomePercent != null) {
      at = TextEditingController(text: farmer.farmingIncomePercent.toString());
    }

    int stepped = 0;
    if (pfProgress.pageTwo == 1) {
      stepped = 2;
      pfProgress = FSProgress(
        farmId: PrefUtils().getFarmId(),
        pageOne: 1,
        pageTwo: 1,
      );
    } else if (credit || income || group) {
      stepped = 1;
      pfProgress = FSProgress(
        farmId: PrefUtils().getFarmId(),
        pageOne: 1,
        pageTwo: 0,
      );
    }
    emit(state.copyWith(
        credit: credit,
        income: income,
        group: group,
        selectvalueoneController: at,
        i: incomemodels,
        c: coopmodels,
        s: creditmodels,
        p: infomodels,
        addFinancialandservicesOneModelObj:
            state.addFinancialandservicesOneModelObj?.copyWith(
          dropdownItemList: a,
          fsProgress: pfProgress,
          selectedDropDownValue: aa,
          stepped2: stepped,
        )));
  }
}

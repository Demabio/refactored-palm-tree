import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/agriinfosource.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/extensionaccess.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/extensionmode.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/agriculturalinfosource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/extensionmodes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/extensionsources.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/financial_services.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farm.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/agriinfosource.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/extensionaccess.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/extensionmode.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_two_screen/models/add_financialandservices_two_model.dart';
part 'add_financialandservices_two_event.dart';
part 'add_financialandservices_two_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesTwo according to the event that is dispatched to it.
class AddFinancialandservicesTwoBloc extends Bloc<
    AddFinancialandservicesTwoEvent, AddFinancialandservicesTwoState> {
  AddFinancialandservicesTwoBloc(AddFinancialandservicesTwoState initialState)
      : super(initialState) {
    on<AddFinancialandservicesTwoInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
    on<ChangeDropDown3Event>(_changeDropDown3);
    on<ChangeDropDown4Event>(_changeDropDown4);
    on<ChangeDropDown5Event>(_changeDropDown5);

    on<SaveTapEvent>(_saveTap);

    on<CheckThreeEvent>(_checkModes);
    on<CheckTwoEvent>(_checkAssets);
    on<CheckOneEvent>(_checkpowers);

    on<ClearEvent>(_clear);
  }

  _onInitialize(
    AddFinancialandservicesTwoInitialEvent event,
    Emitter<AddFinancialandservicesTwoState> emit,
  ) async {
    FSProgress pfProgress = await getProgress() ??
        FSProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    FarmerFarm farmer = await getFarm() ??
        FarmerFarm(
          farmerId: 0,
          farmerFarmId: 0,
          labourSourceId: 0,
          cropsInsurance: false,
          fishInsurance: false,
          assetsInsurance: false,
          livestockInsurance: false,
          farmRecords: false,
        );
    List<CheckBoxList>? infomodels = await fetchInfo();
    List<CheckBoxList>? accessmodels = await fetchEAccess();
    List<CheckBoxList>? modemodels = await fetchEService();
    List<SelectionPopupModel>? a = await fillDropdownItemList();
    SelectionPopupModel? aa;
    SelectionPopupModel? bb;
    SelectionPopupModel? cc;
    SelectionPopupModel? dd;
    SelectionPopupModel? ee;
    SelectionPopupModel? ff;

    if (pfProgress.pageTwo == 1) {
      List<FarmerAgriInfoSource>? info = await getInfo();
      infomodels = _infos(infomodels, info!);
      List<FarmerExtensionAccess>? access = await getEAccess();
      accessmodels = _access(accessmodels, access!);
      List<FarmerExtensionMode>? mode = await getModes();
      if (mode != null) {
        modemodels = _modes(modemodels, mode);
      }
      aa = a.firstWhere(
        (model) => model.id == (farmer.cropsInsurance! ? 1 : 0),
      );

      bb = a.firstWhere(
        (model) => model.id == (farmer.assetsInsurance! ? 1 : 0),
      );

      cc = a.firstWhere(
        (model) => model.id == (farmer.farmRecords! ? 1 : 0),
      );

      dd = a.firstWhere(
        (model) => model.id == (farmer.livestockInsurance! ? 1 : 0),
      );

      ee = a.firstWhere(
        (model) => model.id == (farmer.fishInsurance! ? 1 : 0),
      );

      ff = a.firstWhere(
        (model) => model.id == (farmer.extensionsericeAccess),
      );
    }
    int stepped = 0;
    if (pfProgress.pageTwo == 1) {
      stepped = 2;
    } else if (pfProgress.pageOne == 1) {
      stepped = 1;
    }
    emit(state.copyWith(
        p: infomodels,
        e: accessmodels,
        m: modemodels,
        addFinancialandservicesTwoModelObj:
            state.addFinancialandservicesTwoModelObj?.copyWith(
          dropdownItemList: a,
          dropdownItemList1: a,
          dropdownItemList2: a,
          dropdownItemList3: a,
          dropdownItemList4: a,
          dropdownItemList5: a,
          selectedDropDownValue: aa,
          selectedDropDownValue1: bb,
          selectedDropDownValue2: cc,
          selectedDropDownValue3: dd,
          selectedDropDownValue4: ee,
          selectedDropDownValue5: ff,
          fsProgress: pfProgress,
          stepped2: stepped,
        )));
  }

  Future<FSProgress?> getProgress() async {
    int farmerid = PrefUtils().getFarmId();
    FSProgressDB pfProgressDB = FSProgressDB();
    return await pfProgressDB.fetchByFarm(farmerid);
  }

  Future<Farmer?> getFarmer() async {
    int farmerid = PrefUtils().getFarmerId();
    FarmerDB farmerFishProductionLevelsDB = FarmerDB();
    return await farmerFishProductionLevelsDB.fetchByFarmerId(farmerid);
  }

  Future<List<FarmerAgriInfoSource>?> getInfo() async {
    int id = PrefUtils().getFarmerId();
    FarmerAgriInfoSourceDB farmerLivestockAgeGroupsDB =
        FarmerAgriInfoSourceDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmerId(id);
  }

  Future<List<FarmerExtensionAccess>?> getEAccess() async {
    int id = PrefUtils().getFarmId();
    FarmerExtensionAccessDB farmerLivestockAgeGroupsDB =
        FarmerExtensionAccessDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<List<FarmerExtensionMode>?> getModes() async {
    int id = PrefUtils().getFarmId();
    FarmerExtensionModeDB farmerLivestockAgeGroupsDB = FarmerExtensionModeDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
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

  List<CheckBoxList> _modes(
      List<CheckBoxList> feedmodelss, List<FarmerExtensionMode> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerExtensionMode> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.extensionModeId);

      feedmodels[index].isSelected = true;
    }
    return feedmodels;
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

  Future<List<CheckBoxList>> fetchEService() async {
    List<CheckBoxList> list = [];
    ExtensionModeDB farmStructureDB = ExtensionModeDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].sourceMode,
          id: value[i].extensionModeId,
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fetchEAccess() async {
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

  Future<FarmerFarm?> getFarm() async {
    int id = PrefUtils().getFarmerId();
    FarmerFarmDB farmerFishProductionLevelsDB = FarmerFarmDB();
    return await farmerFishProductionLevelsDB.fetchByFarmerFarmId(id);
  }

  _saveTap(
    SaveTapEvent event,
    Emitter<AddFinancialandservicesTwoState> emit,
  ) async {
    int farmerid = PrefUtils().getFarmerId();
    int farmid = PrefUtils().getFarmId();

    int selectedCount =
        state.p.where((enterprise) => enterprise.isSelected).length;

    int selectedCount2 =
        state.e.where((enterprise) => enterprise.isSelected).length;
    FarmerDB farmerDB = FarmerDB();
    try {
      FSProgressDB atProgressDB = FSProgressDB();
      if (state.addFinancialandservicesTwoModelObj!.fsProgress!.pageTwo == 0 &&
          selectedCount != 0 &&
          (selectedCount2 != 0 ||
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue5!
                      .id ==
                  0)) {
        int id = await farmerDB.updateFromFinancialTwo(Farmer(
          farmerId: farmerid,
          farmerName: "FM",
          cropsInsurance: state.addFinancialandservicesTwoModelObj!
                  .selectedDropDownValue!.id ==
              1,
          assetsInsurance: state.addFinancialandservicesTwoModelObj!
                  .selectedDropDownValue1!.id ==
              1,
          farmRecords: state.addFinancialandservicesTwoModelObj!
                  .selectedDropDownValue2!.id ==
              1,
          livestockInsurance: state.addFinancialandservicesTwoModelObj!
                  .selectedDropDownValue3!.id ==
              1,
          fishInsurance: state.addFinancialandservicesTwoModelObj!
                  .selectedDropDownValue4!.id ==
              1,
          extensionsericeAccess: state
              .addFinancialandservicesTwoModelObj!.selectedDropDownValue!.id,
        ));
        //REMEMBER!!!!!!!!
        if (id > 0) {
          atProgressDB
              .update(FSProgress(
                farmId: farmid,
                pageOne: state
                    .addFinancialandservicesTwoModelObj!.fsProgress!.pageOne,
                pageTwo: 1,
              ))
              .then((value) => print("Scope FI" + value.toString()));
          event.createSuccessful!.call();
        }
      } else if (selectedCount != 0 &&
          (selectedCount2 != 0 ||
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue5!
                      .id ==
                  0)) {
        int id = await farmerDB.updateFromFinancialTwo(Farmer(
          farmerId: farmerid,
          farmerName: "NA",
          cropsInsurance: state.addFinancialandservicesTwoModelObj!
                  .selectedDropDownValue!.id ==
              1,
          assetsInsurance: state.addFinancialandservicesTwoModelObj!
                  .selectedDropDownValue1!.id ==
              1,
          farmRecords: state.addFinancialandservicesTwoModelObj!
                  .selectedDropDownValue2!.id ==
              1,
          livestockInsurance: state.addFinancialandservicesTwoModelObj!
                  .selectedDropDownValue3!.id ==
              1,
          fishInsurance: state.addFinancialandservicesTwoModelObj!
                  .selectedDropDownValue4!.id ==
              1,
          extensionsericeAccess: state
              .addFinancialandservicesTwoModelObj!.selectedDropDownValue!.id,
        ));
        if (id > 0) {
          atProgressDB
              .update(FSProgress(
                farmId: farmid,
                pageOne: state
                    .addFinancialandservicesTwoModelObj!.fsProgress!.pageOne,
                pageTwo: 1,
              ))
              .then((value) => print("Scope FI" + value.toString()));
          event.createSuccessful!.call();
        } else {
          event.createFailed!.call();
        }
      } else {
        //   event.createFailed!.call();
        int selectedCount =
            state.p.where((enterprise) => enterprise.isSelected).length;

        int selectedCount2 =
            state.e.where((enterprise) => enterprise.isSelected).length;

        emit(state.copyWith(
          checka: selectedCount == 0,
          checkb: (selectedCount2 == 0 &&
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue5!
                      .id !=
                  0),
        ));
      }
    } catch (e) {
      event.createFailed!.call();
    }
  }

  _checkpowers(
    CheckOneEvent event,
    Emitter<AddFinancialandservicesTwoState> emit,
  ) async {
    List<FarmerAgriInfoSource>? fishes = await getInfo();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchInfo();

    feedmodels =
        fishes != null ? feedmodels = _infos(feedmodels, fishes) : feedmodels;

    fishes != null
        ? emit(state.copyWith(p: feedmodels, checka: false))
        : emit(state.copyWith(checkb: true));
  }

  _checkAssets(
    CheckTwoEvent event,
    Emitter<AddFinancialandservicesTwoState> emit,
  ) async {
    List<FarmerExtensionAccess>? fishes = await getEAccess();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchEAccess();

    feedmodels =
        fishes != null ? feedmodels = _access(feedmodels, fishes) : feedmodels;

    fishes != null
        ? emit(state.copyWith(e: feedmodels, checka: false))
        : emit(state.copyWith(checkb: true));
  }

  _checkModes(
    CheckThreeEvent event,
    Emitter<AddFinancialandservicesTwoState> emit,
  ) async {
    List<FarmerExtensionMode>? fishes = await getModes();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchEService();

    feedmodels =
        fishes != null ? feedmodels = _modes(feedmodels, fishes) : feedmodels;

    fishes != null
        ? emit(state.copyWith(m: feedmodels))
        : emit(state.copyWith(m: feedmodels));
  }

  _clear(
    ClearEvent event,
    Emitter<AddFinancialandservicesTwoState> emit,
  ) async {
    if (state.addFinancialandservicesTwoModelObj?.fsProgress!.pageTwo == 0) {
      int farmerid = PrefUtils().getFarmerId();
      int id = PrefUtils().getFarmId();
      FarmerExtensionModeDB farmerExtensionModeDB = FarmerExtensionModeDB();
      FarmerExtensionAccessDB farmerExtensionAccessDB =
          FarmerExtensionAccessDB();
      FarmerAgriInfoSourceDB farmerAgriInfoSourceDB = FarmerAgriInfoSourceDB();
      farmerExtensionModeDB
          .delete(id)
          .then((value) => print("Deleted: $value"));
      farmerExtensionAccessDB
          .delete(id)
          .then((value) => print("Deleted: $value"));
      farmerAgriInfoSourceDB
          .delete(farmerid)
          .then((value) => print("Deleted: $value"));
    }
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

  List<SelectionPopupModel> fillDropdownItemList1() {
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

  List<SelectionPopupModel> fillDropdownItemList2() {
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

  List<SelectionPopupModel> fillDropdownItemList3() {
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

  List<SelectionPopupModel> fillDropdownItemList4() {
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

  List<SelectionPopupModel> fillDropdownItemList5() {
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

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddFinancialandservicesTwoState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue: event.value,
        addFinancialandservicesTwoModelObj:
            state.addFinancialandservicesTwoModelObj?.copyWith(
          selectedDropDownValue: event.value,
          selectedDropDownValue1:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue1,
          selectedDropDownValue2:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue2,
          selectedDropDownValue3:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue3,
          selectedDropDownValue4:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue4,
          selectedDropDownValue5:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue5,
        )));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddFinancialandservicesTwoState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue1: event.value,
        addFinancialandservicesTwoModelObj:
            state.addFinancialandservicesTwoModelObj?.copyWith(
          selectedDropDownValue1: event.value,
          selectedDropDownValue:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue,
          selectedDropDownValue2:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue2,
          selectedDropDownValue3:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue3,
          selectedDropDownValue4:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue4,
          selectedDropDownValue5:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue5,
        )));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<AddFinancialandservicesTwoState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue: event.value,
        addFinancialandservicesTwoModelObj:
            state.addFinancialandservicesTwoModelObj?.copyWith(
          selectedDropDownValue2: event.value,
          selectedDropDownValue1:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue1,
          selectedDropDownValue:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue,
          selectedDropDownValue3:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue3,
          selectedDropDownValue4:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue4,
          selectedDropDownValue5:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue5,
        )));
  }

  _changeDropDown3(
    ChangeDropDown3Event event,
    Emitter<AddFinancialandservicesTwoState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue: event.value,
        addFinancialandservicesTwoModelObj:
            state.addFinancialandservicesTwoModelObj?.copyWith(
          selectedDropDownValue3: event.value,
          selectedDropDownValue1:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue1,
          selectedDropDownValue2:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue2,
          selectedDropDownValue:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue,
          selectedDropDownValue4:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue4,
          selectedDropDownValue5:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue5,
        )));
  }

  _changeDropDown4(
    ChangeDropDown4Event event,
    Emitter<AddFinancialandservicesTwoState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue: event.value,
        addFinancialandservicesTwoModelObj:
            state.addFinancialandservicesTwoModelObj?.copyWith(
          selectedDropDownValue4: event.value,
          selectedDropDownValue1:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue1,
          selectedDropDownValue2:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue2,
          selectedDropDownValue3:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue3,
          selectedDropDownValue:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue,
          selectedDropDownValue5:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue5,
        )));
  }

  _changeDropDown5(
    ChangeDropDown5Event event,
    Emitter<AddFinancialandservicesTwoState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue: event.value,
        addFinancialandservicesTwoModelObj:
            state.addFinancialandservicesTwoModelObj?.copyWith(
          selectedDropDownValue5: event.value,
          selectedDropDownValue1:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue1,
          selectedDropDownValue2:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue2,
          selectedDropDownValue3:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue3,
          selectedDropDownValue4:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue4,
          selectedDropDownValue:
              state.addFinancialandservicesTwoModelObj?.selectedDropDownValue,
        )));
  }
}

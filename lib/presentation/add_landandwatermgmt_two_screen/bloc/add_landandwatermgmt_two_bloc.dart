import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/irrigation/irrigationmemberships.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/agency.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/category.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/type.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropareaunit.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationagencies.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationtypes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/membershiptypes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/financial_services.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/land_water_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/irrigation/agency.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/irrigation/category.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/irrigation/type.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_two_screen/models/add_landandwatermgmt_two_model.dart';
part 'add_landandwatermgmt_two_event.dart';
part 'add_landandwatermgmt_two_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtTwo according to the event that is dispatched to it.
class AddLandandwatermgmtTwoBloc
    extends Bloc<AddLandandwatermgmtTwoEvent, AddLandandwatermgmtTwoState> {
  AddLandandwatermgmtTwoBloc(AddLandandwatermgmtTwoState initialState)
      : super(initialState) {
    on<AddLandandwatermgmtTwoInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<SaveTapEvent>(_saveTap);

    on<CheckThreeEvent>(_checkModes);
    on<CheckTwoEvent>(_checkAssets);
    on<CheckOneEvent>(_checkpowers);

    on<ClearEvent>(_clear);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddLandandwatermgmtTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
      addLandandwatermgmtTwoModelObj:
          state.addLandandwatermgmtTwoModelObj?.copyWith(
        selectedDropDownValue: event.value,
        selectedDropDownValue1:
            state.addLandandwatermgmtTwoModelObj?.selectedDropDownValue1,
      ),
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddLandandwatermgmtTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
      addLandandwatermgmtTwoModelObj:
          state.addLandandwatermgmtTwoModelObj?.copyWith(
        selectedDropDownValue1: event.value,
        selectedDropDownValue:
            state.addLandandwatermgmtTwoModelObj?.selectedDropDownValue,
      ),
    ));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Yes",
        isSelected: true,
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

  _clear(
    ClearEvent event,
    Emitter<AddLandandwatermgmtTwoState> emit,
  ) async {
    if (state.addLandandwatermgmtTwoModelObj?.lwProgress!.pageTwo == 0) {
      int id = PrefUtils().getFarmId();
      FarmerIrrigationAgencyDB farmerIrrigationAgencyDB =
          FarmerIrrigationAgencyDB();
      FarmerIrrigationTypeDB farmerIrrigationTypeDB = FarmerIrrigationTypeDB();
      FarmerIrrigationCategoryDB farmerIrrigationCategoryDB =
          FarmerIrrigationCategoryDB();
      farmerIrrigationCategoryDB
          .delete(id)
          .then((value) => print("Deleted: $value"));
      farmerIrrigationTypeDB
          .delete(id)
          .then((value) => print("Deleted: $value"));
      farmerIrrigationAgencyDB
          .delete(id)
          .then((value) => print("Deleted: $value"));
    }
  }

  _checkpowers(
    CheckOneEvent event,
    Emitter<AddLandandwatermgmtTwoState> emit,
  ) async {
    List<FarmerIrrigationType>? fishes = await getType();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchType();

    feedmodels =
        fishes != null ? feedmodels = _type(feedmodels, fishes) : feedmodels;

    fishes != null
        ? emit(state.copyWith(u: feedmodels, checka: false))
        : emit(state.copyWith(checkb: true));
  }

  _checkAssets(
    CheckTwoEvent event,
    Emitter<AddLandandwatermgmtTwoState> emit,
  ) async {
    List<FarmerIrrigationCategory>? fishes = await getCategs();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchSchemes();

    feedmodels =
        fishes != null ? feedmodels = _categ(feedmodels, fishes) : feedmodels;

    fishes != null
        ? emit(state.copyWith(p: feedmodels, checka: false))
        : emit(state.copyWith(checkb: true));
  }

  _checkModes(
    CheckThreeEvent event,
    Emitter<AddLandandwatermgmtTwoState> emit,
  ) async {
    List<FarmerIrrigationAgency>? fishes = await getAgency();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchAgency();

    feedmodels =
        fishes != null ? feedmodels = _agency(feedmodels, fishes) : feedmodels;

    fishes != null
        ? emit(state.copyWith(b: feedmodels))
        : emit(state.copyWith(b: feedmodels));
  }

  _saveTap(
    SaveTapEvent event,
    Emitter<AddLandandwatermgmtTwoState> emit,
  ) async {
    int farmerid = PrefUtils().getFarmerId();
    int farmid = PrefUtils().getFarmId();
    int selectedCount =
        state.u.where((enterprise) => enterprise.isSelected).length;

    int selectedCount2 =
        state.p.where((enterprise) => enterprise.isSelected).length;
    FarmerDB farmerDB = FarmerDB();
    try {
      LWProgressDB atProgressDB = LWProgressDB();
      if (state.addLandandwatermgmtTwoModelObj!.lwProgress!.pageTwo == 0 &&
          ((selectedCount != 0 && selectedCount2 != 0) ||
              state.addLandandwatermgmtTwoModelObj?.selectedDropDownValue!.id ==
                  0)) {
        int id = await farmerDB.updateFromLandWaterTwo(Farmer(
          farmerId: farmerid,
          farmerName: "NA",
          irrigationUse:
              state.addLandandwatermgmtTwoModelObj?.selectedDropDownValue!.id ==
                      0
                  ? false
                  : state.addLandandwatermgmtTwoModelObj!.selectedDropDownValue!
                          .id ==
                      1,
          irrigationArea:
              state.addLandandwatermgmtTwoModelObj?.selectedDropDownValue!.id ==
                      0
                  ? 0
                  : double.parse(state.areavalueoneController!.text),
        ));
        //REMEMBER!!!!!!!!
        //   if (id > 0) {
        atProgressDB
            .update(LWProgress(
              farmId: farmid,
              pageOne:
                  state.addLandandwatermgmtTwoModelObj!.lwProgress!.pageOne,
              pageTwo: 1,
            ))
            .then((value) => print("Scope FI" + value.toString()));
        event.createSuccessful!.call();
        //}
      } else if ((selectedCount != 0 && selectedCount2 != 0) ||
          state.addLandandwatermgmtTwoModelObj?.selectedDropDownValue!.id ==
              0) {
        int id = await farmerDB.updateFromLandWaterTwo(Farmer(
          farmerId: farmerid,
          farmerName: "NA",
          irrigationUse:
              state.addLandandwatermgmtTwoModelObj?.selectedDropDownValue!.id ==
                      0
                  ? false
                  : state.addLandandwatermgmtTwoModelObj!.selectedDropDownValue!
                          .id ==
                      1,
          irrigationArea:
              state.addLandandwatermgmtTwoModelObj?.selectedDropDownValue!.id ==
                      0
                  ? 0
                  : double.parse(state.areavalueoneController!.text),
        ));
        //  if (id > 0) {
        atProgressDB
            .update(LWProgress(
              farmId: farmid,
              pageOne:
                  state.addLandandwatermgmtTwoModelObj!.lwProgress!.pageOne,
              pageTwo: 1,
            ))
            .then((value) => print("Scope FI" + value.toString()));
        event.createSuccessful!.call();
        //   }
      } else {
        //   event.createFailed!.call();
        int selectedCount =
            state.u.where((enterprise) => enterprise.isSelected).length;

        int selectedCount2 =
            state.p.where((enterprise) => enterprise.isSelected).length;

        emit(state.copyWith(
          checka: (selectedCount == 0 &&
              state.addLandandwatermgmtTwoModelObj?.selectedDropDownValue!.id !=
                  0),
          checkb: (selectedCount2 == 0 &&
              state.addLandandwatermgmtTwoModelObj?.selectedDropDownValue!.id !=
                  0),
        ));
      }
    } catch (e) {
      event.createFailed!.call();
    }
  }

  Future<List<SelectionPopupModel>> fillCategories() async {
    List<SelectionPopupModel> list = [];
    CropAreaUnitDB areaUnitDB = CropAreaUnitDB();
    await areaUnitDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].areaUnit,
          id: value[i].areaUnitId,
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fetchType() async {
    List<CheckBoxList> list = [];
    IrrigationTypeDB farmStructureDB = IrrigationTypeDB();
//        createdBy: int.parse(map['created_by'] ?? "0"),

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].irrigationType,
          id: value[i].irrigationTypeId,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>?> memberships() async {
    List<IrrigationMembershipType>? types = [];
    List<SelectionPopupModel>? list = [];

    IrrigationMembershipTypeDB membershipTypeDB = IrrigationMembershipTypeDB();
    types = await membershipTypeDB.fetchAll();
    if (types != null)
      for (var type in types) {
        list.add(SelectionPopupModel(
          title: type.irrigationMembershipType,
          id: type.membershipTypeId,
        ));
      }
    return list;
  }

  Future<List<CheckBoxList>> fetchSchemes() async {
    List<CheckBoxList> list = [];

    List<SelectionPopupModel>? dpds = await memberships();
    //  List<SelectionPopupModel> dpds = [
    //     SelectionPopupModel(title: "Full Member", id: 1),
    //     SelectionPopupModel(title: "Out Grower Member", id: 0),
    //   ];
    IrrigationAgencyDB livestockAgeGroupDB = IrrigationAgencyDB();
    TextEditingController stored = TextEditingController();
    stored.value = TextEditingValue(text: "999");
    await livestockAgeGroupDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].agencyName,
          id: value[i].irrigationAgencyId,
          female: TextEditingController(),
          male: TextEditingController(),
          focusNode: FocusNode(),
          femalefocusNode: FocusNode(),
          model: dpds ?? [],
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fetchAgency() async {
    List<CheckBoxList> list = [];
    IrrigationAgencyDB farmStructureDB = IrrigationAgencyDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].agencyName,
          id: value[i].irrigationAgencyId,
        ));
      }
    });
    return list;
  }

  List<CheckBoxList> _type(
      List<CheckBoxList> feedmodelss, List<FarmerIrrigationType> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerIrrigationType> feeds = feedss;

    for (var ent in feeds) {
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.irrigationTypeId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  List<CheckBoxList> _categ(
      List<CheckBoxList> feedmodelss, List<FarmerIrrigationCategory> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerIrrigationCategory> feeds = feedss;

    for (var ent in feeds) {
      SelectionPopupModel? drop;
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.irrigationCategoryId);
      int index2 = feedmodels[index]
          .model
          .indexWhere((obj) => obj.id == ent.membershipTypeId);

      drop = feedmodels[index].model[index2];

      feedmodels[index].isSelected = true;
      feedmodels[index].var1 = ent.irrigationProjectName ?? "N/A";
      feedmodels[index].male =
          TextEditingController(text: ent.irrigationProjectName);
      feedmodels[index].drop = ent.membershipTypeId == 0 ? null : drop;
    }

    return feedmodels;
  }

  List<CheckBoxList> _agency(
      List<CheckBoxList> feedmodelss, List<FarmerIrrigationAgency> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerIrrigationAgency> feeds = feedss;

    for (var ent in feeds) {
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.irrigationAgencyId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  Future<List<FarmerIrrigationAgency>?> getAgency() async {
    int id = PrefUtils().getFarmId();
    FarmerIrrigationAgencyDB farmerLivestockAgeGroupsDB =
        FarmerIrrigationAgencyDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<List<FarmerIrrigationCategory>?> getCategs() async {
    int id = PrefUtils().getFarmId();
    FarmerIrrigationCategoryDB farmerLivestockAgeGroupsDB =
        FarmerIrrigationCategoryDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<List<FarmerIrrigationType>?> getType() async {
    int id = PrefUtils().getFarmId();
    FarmerIrrigationTypeDB farmerLivestockAgeGroupsDB =
        FarmerIrrigationTypeDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<LWProgress?> getProgress() async {
    int farmerid = PrefUtils().getFarmId();
    LWProgressDB pfProgressDB = LWProgressDB();
    return await pfProgressDB.fetchByFarm(farmerid);
  }

  Future<Farmer?> getFarmer() async {
    int farmerid = PrefUtils().getFarmerId();
    FarmerDB farmerFishProductionLevelsDB = FarmerDB();
    return await farmerFishProductionLevelsDB.fetchByFarmerId(farmerid);
  }

  _onInitialize(
    AddLandandwatermgmtTwoInitialEvent event,
    Emitter<AddLandandwatermgmtTwoState> emit,
  ) async {
    LWProgress pfProgress = await getProgress() ??
        LWProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    Farmer farmer = await getFarmer() ??
        Farmer(
          farmerId: 0,
          farmerName: "farmerName",
          labourSourceId: 0,
          irrigationArea: 0,
          irrigationUse: false,
        );
    List<CheckBoxList>? typemodels = await fetchType();
    List<CheckBoxList>? schememodels = await fetchSchemes();
    List<CheckBoxList>? agmodels = await fetchAgency();

    TextEditingController at = TextEditingController();
    List<SelectionPopupModel>? a = fillDropdownItemList();
    SelectionPopupModel? aa;

    if (pfProgress.pageTwo == 1) {
      List<FarmerIrrigationType>? type = await getType();
      if (type != null) {
        typemodels = _type(typemodels, type);
      }
      List<FarmerIrrigationCategory>? scheme = await getCategs();
      if (scheme != null) {
        schememodels = _categ(schememodels, scheme);
      }
      List<FarmerIrrigationAgency>? ag = await getAgency();
      if (ag != null) {
        agmodels = _agency(agmodels, ag);
      }

      aa = a.firstWhere(
        (model) => model.id == (farmer.irrigationUse! ? 1 : 0),
      );

      if (farmer.irrigationArea != null) {
        at = TextEditingController(text: farmer.irrigationArea.toString());
      }
    }
    int stepped = 0;
    if (pfProgress.pageTwo == 1) {
      stepped = 2;
    } else if (pfProgress.pageOne == 1) {
      stepped = 1;
    }
    emit(state.copyWith(
        areavalueoneController: at,
        u: typemodels,
        p: schememodels,
        b: agmodels,
        addLandandwatermgmtTwoModelObj:
            state.addLandandwatermgmtTwoModelObj?.copyWith(
          dropdownItemList: a,
          dropdownItemList1: await fillCategories(),
          selectedDropDownValue: aa,
          lwProgress: pfProgress,
          stepped2: stepped,
        )));
  }
}

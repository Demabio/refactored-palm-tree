import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/crop_agri.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/crops/crop.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fertiliser/fertiliser.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fertiliser/fertilisersource.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/pesticide.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropmotive.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropsystem.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropwatersource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fertiliser/fertilisersource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fertiliser/fertilisertype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/pesticidetype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/crop_agri.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/crop/crops.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fertiliser/fertiliser.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fertiliser/fertiliser_source.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/pesticide.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_crop_two_screen/models/add_crop_two_model.dart';
part 'add_crop_two_event.dart';
part 'add_crop_two_state.dart';

/// A bloc that manages the state of a AddCropTwo according to the event that is dispatched to it.
class AddCropTwoBloc extends Bloc<AddCropTwoEvent, AddCropTwoState> {
  AddCropTwoBloc(AddCropTwoState initialState) : super(initialState) {
    on<AddCropTwoInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
    on<ChangeDropDown3Event>(_changeDropDown3);
    on<ChangeDropDown4Event>(_changeDropDown4);

    on<CheckThreeEvent>(_checkModes);
    on<CheckTwoEvent>(_checkAssets);
    on<CheckOneEvent>(_checkpowers);
    on<SaveTapEvent>(_saveTap);
  }

  _onInitialize(
    AddCropTwoInitialEvent event,
    Emitter<AddCropTwoState> emit,
  ) async {
    FarmerCrop crop = await getFarm() ??
        FarmerCrop(
          farmerId: PrefUtils().getFarmerId(),
          farmerFarmId: PrefUtils().getFarmId(),
          farmerCropId: 0,
        );
    CAProgress caProgress = await getProgress() ??
        CAProgress(
          cropId: 0,
          pageOne: 0,
          pageTwo: 0,
        );

    List<SelectionPopupModel> motive = await fetchMotives();
    List<SelectionPopupModel> syst = await fetchProductionSytems();
    List<SelectionPopupModel> water = await fetchWaterSources();
    List<SelectionPopupModel> fert = fillDropdownItemList3();
    List<SelectionPopupModel> pest = fillDropdownItemList3();

    SelectionPopupModel? selectedmotive;
    SelectionPopupModel? selectedsyst;
    SelectionPopupModel? selectedwater;
    SelectionPopupModel? selectedfert;
    SelectionPopupModel? selectedpest;

    List<CheckBoxList>? typemodels = await fecthType();
    List<CheckBoxList>? sourcemodels = await fetchSources();
    List<CheckBoxList>? pestsmodels = await fetchPest();

    if (caProgress.pageTwo == 1 && crop.farmerCropId != 0) {
      selectedmotive = motive.firstWhere(
        (model) => model.id == crop.cropMotiveId,
      );

      selectedsyst = syst.firstWhere(
        (model) => model.id == crop.cropSystemId,
      );

      selectedwater = water.firstWhere(
        (model) => model.id == (crop.waterSourceId),
      );

      selectedfert = fert.firstWhere(
        (model) => model.id == (crop.fertilizerUse!),
      );

      selectedpest = pest.firstWhere(
        (model) => model.id == (crop.pesticideUse!),
      );
      List<FarmerFertiliser>? type = await getTypes();
      if (type != null) {
        typemodels = _types(typemodels, type);
      }
      List<FarmerFertiliserSource>? source = await getSources();
      if (source != null) {
        sourcemodels = _sources(sourcemodels, source);
      }
      List<FarmerPesticide>? pests = await getPest();
      if (pests != null) {
        pestsmodels = _pest(pestsmodels, pests);
      }
    }
    int stepper = 0;
    if (caProgress.pageOne == 1) {
      stepper = 1;
    }
    emit(
      state.copyWith(
        a: typemodels,
        p: pestsmodels,
        s: sourcemodels,
        addCropTwoModelObj: state.addCropTwoModelObj?.copyWith(
          dropdownItemList: motive,
          dropdownItemList1: syst,
          dropdownItemList2: water,
          dropdownItemList3: pest,
          dropdownItemList4: fert,
          caProgressDB: caProgress,
          crop: crop,
          selectedDropDownValue: selectedmotive,
          selectedDropDownValue1: selectedsyst,
          selectedDropDownValue2: selectedwater,
          selectedDropDownValue3: selectedpest,
          selectedDropDownValue4: selectedfert,
          stepped2: stepper,
        ),
      ),
    );
  }

  Future<FarmerCrop?> getFarm() async {
    int cropId = PrefUtils().getCropId();
    FarmerCropsDB farmerCropsDB = FarmerCropsDB();
    return await farmerCropsDB.fetchByFarmerCropId(cropId);
  }

  Future<CAProgress?> getProgress() async {
    int cropid = PrefUtils().getCropId();
    CAProgressDB caProgressDB = CAProgressDB();
    return await caProgressDB.fetchByCropId(cropid);
  }

  Future<List<CheckBoxList>> fecthType() async {
    List<CheckBoxList> list = [];
    FertiliserTypeDB farmStructureDB = FertiliserTypeDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].fertiliserType,
          id: value[i].fertiliserTypeId,
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fetchSources() async {
    List<CheckBoxList> list = [];
    FertiliserSourceDB farmStructureDB = FertiliserSourceDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value!.length; i++) {
        list.add(CheckBoxList(
          title: value[i].source,
          id: value[i].fertSourceId,
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fetchPest() async {
    List<CheckBoxList> list = [];
    PesticideTypeDB farmStructureDB = PesticideTypeDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].pesticideType,
          id: value[i].pesticideTypeId,
        ));
      }
    });
    return list;
  }

  List<CheckBoxList> _sources(
      List<CheckBoxList> feedmodelss, List<FarmerFertiliserSource> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerFertiliserSource> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.fertSourceId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  Future<List<FarmerFertiliserSource>?> getSources() async {
    int id = PrefUtils().getCropId();
    FarmerFertiliserSourcesDB farmerFishInputDB = FarmerFertiliserSourcesDB();
    return await farmerFishInputDB.fetchByCropId(id);
  }

  List<CheckBoxList> _pest(
      List<CheckBoxList> feedmodelss, List<FarmerPesticide> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerPesticide> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.pesticideTypeId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  Future<List<FarmerPesticide>?> getPest() async {
    int id = PrefUtils().getCropId();
    FarmerPesticidesDB farmerFishInputDB = FarmerPesticidesDB();
    return await farmerFishInputDB.fetchByCropId(id);
  }

  List<CheckBoxList> _types(
      List<CheckBoxList> feedmodelss, List<FarmerFertiliser> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerFertiliser> feeds = feedss;

    for (var ent in feeds) {
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.fertiliserTypeId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  Future<List<FarmerFertiliser>?> getTypes() async {
    int id = PrefUtils().getCropId();
    FarmerFertiliserDB farmerFishInputDB = FarmerFertiliserDB();
    return await farmerFishInputDB.fetchByCropId(id);
  }

  _saveTap(
    SaveTapEvent event,
    Emitter<AddCropTwoState> emit,
  ) {
    FarmerCropsDB cropsDB = FarmerCropsDB();
    int farmerid = PrefUtils().getFarmId();
    int selectedCount =
        state.p.where((enterprise) => enterprise.isSelected).length;

    int selectedCount2 =
        state.a.where((enterprise) => enterprise.isSelected).length;

    int selectedCount3 =
        state.s.where((enterprise) => enterprise.isSelected).length;

    bool fert = state.addCropTwoModelObj?.selectedDropDownValue4?.id == 0 ||
        selectedCount2 > 0;
    bool pest = state.addCropTwoModelObj?.selectedDropDownValue3?.id == 0 ||
        selectedCount > 0;
    bool source = state.addCropTwoModelObj?.selectedDropDownValue4?.id == 0 ||
        selectedCount3 > 0;

    try {
      if (fert && pest && source) {
        cropsDB
            .updatePageTwo(FarmerCrop(
          farmerCropId: PrefUtils().getCropId(),
          cropMotiveId: state.addCropTwoModelObj!.selectedDropDownValue?.id,
          cropSystemId: state.addCropTwoModelObj!.selectedDropDownValue1?.id,
          waterSourceId: state.addCropTwoModelObj!.selectedDropDownValue2?.id,
          pesticideUse: state.addCropTwoModelObj!.selectedDropDownValue3?.id,
          fertilizerUse: state.addCropTwoModelObj!.selectedDropDownValue4?.id,
          farmerId: farmerid,
          farmerFarmId: PrefUtils().getFarmId(),
        ))
            .then((value) async {
          if (value > 0) {
            CAProgressDB caProgressDB = CAProgressDB();

            caProgressDB
                .update(CAProgress(
                  cropId: PrefUtils().getCropId(),
                  pageOne: state.addCropTwoModelObj!.caProgressDB!.pageOne,
                  pageTwo: 1,
                ))
                .then((value) => print("Scope FI" + value.toString()));

            event.createSuccessful!.call();
          } else {
            event.createFailed!.call();
          }
        });
      } else {
        bool fert = state.addCropTwoModelObj?.selectedDropDownValue4?.id == 1 &&
            selectedCount2 > 0;
        bool pest = state.addCropTwoModelObj?.selectedDropDownValue3?.id == 1 &&
            selectedCount > 0;
        bool source =
            state.addCropTwoModelObj?.selectedDropDownValue4?.id == 1 &&
                selectedCount3 > 0;

        emit(state.copyWith(
          checkedA: !fert,
          checkedS: !source,
          checkedP: !pest,
        ));
      }
    } catch (e) {
      event.createFailed!.call();
    }
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddCropTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
      addCropTwoModelObj: state.addCropTwoModelObj?.copyWith(
        selectedDropDownValue: event.value,
        selectedDropDownValue1:
            state.addCropTwoModelObj?.selectedDropDownValue1,
        selectedDropDownValue2:
            state.addCropTwoModelObj?.selectedDropDownValue2,
        selectedDropDownValue3:
            state.addCropTwoModelObj?.selectedDropDownValue3,
        selectedDropDownValue4:
            state.addCropTwoModelObj?.selectedDropDownValue4,
      ),
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddCropTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
      addCropTwoModelObj: state.addCropTwoModelObj?.copyWith(
        selectedDropDownValue1: event.value,
        selectedDropDownValue: state.addCropTwoModelObj?.selectedDropDownValue,
        selectedDropDownValue2:
            state.addCropTwoModelObj?.selectedDropDownValue2,
        selectedDropDownValue3:
            state.addCropTwoModelObj?.selectedDropDownValue3,
        selectedDropDownValue4:
            state.addCropTwoModelObj?.selectedDropDownValue4,
      ),
    ));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<AddCropTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue2: event.value,
      addCropTwoModelObj: state.addCropTwoModelObj?.copyWith(
        selectedDropDownValue2: event.value,
        selectedDropDownValue1:
            state.addCropTwoModelObj?.selectedDropDownValue1,
        selectedDropDownValue: state.addCropTwoModelObj?.selectedDropDownValue,
        selectedDropDownValue3:
            state.addCropTwoModelObj?.selectedDropDownValue3,
        selectedDropDownValue4:
            state.addCropTwoModelObj?.selectedDropDownValue4,
      ),
    ));
  }

  _changeDropDown3(
    ChangeDropDown3Event event,
    Emitter<AddCropTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue3: event.value,
      addCropTwoModelObj: state.addCropTwoModelObj?.copyWith(
        selectedDropDownValue3: event.value,
        selectedDropDownValue1:
            state.addCropTwoModelObj?.selectedDropDownValue1,
        selectedDropDownValue2:
            state.addCropTwoModelObj?.selectedDropDownValue2,
        selectedDropDownValue: state.addCropTwoModelObj?.selectedDropDownValue,
        selectedDropDownValue4:
            state.addCropTwoModelObj?.selectedDropDownValue4,
      ),
    ));
  }

  _changeDropDown4(
    ChangeDropDown4Event event,
    Emitter<AddCropTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue4: event.value,
      addCropTwoModelObj: state.addCropTwoModelObj?.copyWith(
        selectedDropDownValue4: event.value,
        selectedDropDownValue1:
            state.addCropTwoModelObj?.selectedDropDownValue1,
        selectedDropDownValue2:
            state.addCropTwoModelObj?.selectedDropDownValue2,
        selectedDropDownValue3:
            state.addCropTwoModelObj?.selectedDropDownValue3,
        selectedDropDownValue: state.addCropTwoModelObj?.selectedDropDownValue,
      ),
    ));
  }

  _checkpowers(
    CheckOneEvent event,
    Emitter<AddCropTwoState> emit,
  ) async {
    List<FarmerPesticide>? fishes = await getPest();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchPest();

    feedmodels =
        fishes != null ? feedmodels = _pest(feedmodels, fishes) : feedmodels;

    fishes != null
        ? emit(state.copyWith(p: feedmodels, checkedP: false))
        : emit(state.copyWith(checkedP: true));
  }

  _checkAssets(
    CheckTwoEvent event,
    Emitter<AddCropTwoState> emit,
  ) async {
    List<FarmerFertiliser>? fishes = await getTypes();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fecthType();

    feedmodels =
        fishes != null ? feedmodels = _types(feedmodels, fishes) : feedmodels;

    fishes != null
        ? emit(state.copyWith(a: feedmodels, checkedA: false))
        : emit(state.copyWith(checkedA: true));
  }

  _checkModes(
    CheckThreeEvent event,
    Emitter<AddCropTwoState> emit,
  ) async {
    List<FarmerFertiliserSource>? fishes = await getSources();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchSources();

    feedmodels =
        fishes != null ? feedmodels = _sources(feedmodels, fishes) : feedmodels;

    fishes != null
        ? emit(state.copyWith(s: feedmodels, checkedS: false))
        : emit(state.copyWith(checkedS: true));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList1() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList2() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList3() {
    return [
      SelectionPopupModel(id: 1, title: "Yes"),
      SelectionPopupModel(id: 0, title: "No")
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList4() {
    return [
      SelectionPopupModel(id: 1, title: "Yes"),
      SelectionPopupModel(id: 0, title: "No")
    ];
  }

  Future<List<SelectionPopupModel>> fetchMotives() async {
    List<SelectionPopupModel> list = [];
    CropPlantingMotiveDB cropPlantingMotiveDB = CropPlantingMotiveDB();

    await cropPlantingMotiveDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].cropMotive,
          id: value[i].cropMotiveId,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fetchProductionSytems() async {
    List<SelectionPopupModel> list = [];
    CropSystemDB cropSystemDB = CropSystemDB();

    await cropSystemDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].croppingSystem,
          id: value[i].cropSystemId,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fetchWaterSources() async {
    List<SelectionPopupModel> list = [];
    CropWaterSourceDB cropWaterSourceDB = CropWaterSourceDB();

    await cropWaterSourceDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].waterSource,
          id: value[i].waterSourceId,
        ));
      }
    });
    return list;
  }
}

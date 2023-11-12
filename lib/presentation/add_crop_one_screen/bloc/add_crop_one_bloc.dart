import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/crop_agri.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/crops/crop.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/crop.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropareaunit.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/crop_agri.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/crop/crops.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farm.dart';
import '/core/app_export.dart';
import '../models/chipviewalbert_item_model.dart';
import 'package:kiamis_app/presentation/add_crop_one_screen/models/add_crop_one_model.dart';
part 'add_crop_one_event.dart';
part 'add_crop_one_state.dart';

/// A bloc that manages the state of a AddCropOne according to the event that is dispatched to it.
class AddCropOneBloc extends Bloc<AddCropOneEvent, AddCropOneState> {
  AddCropOneBloc(AddCropOneState initialState) : super(initialState) {
    on<AddCropOneInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
    on<SearchEventCrop>(_searchCrops);
    on<ReturnCommonEventCrop>(_restoreCommon);
    on<NextTapEvent>(_nextTap);
    on<SaveTapEvent>(_saveTap);
  }

  _updateChipView(
    UpdateChipViewEvent event,
    Emitter<AddCropOneState> emit,
  ) {
    // List<ChipviewalbertItemModel> newList = List<ChipviewalbertItemModel>.from(
    //     state.addCropOneModelObj!.chipviewalbertItemList);
    // newList[event.index] =
    //     newList[event.index].copyWith(isSelected: event.isSelected);
    emit(state.copyWith(
        addCropOneModelObj: state.addCropOneModelObj?.copyWith(
      selectedCrop: null,
      search: false,
    )));

    SelectionPopupModel? categorymodel =
        state.addCropOneModelObj?.dropdownItemList.firstWhere(
      (model) => model.id == event.model!.cropId,
    );

    emit(state.copyWith(
        addCropOneModelObj: state.addCropOneModelObj?.copyWith(
      selectedCrop: categorymodel,
      selectedDropDownValue1: state.addCropOneModelObj?.selectedDropDownValue1,
      selectedDropDownValue2: state.addCropOneModelObj?.selectedDropDownValue2,
    )));
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddCropOneState> emit,
  ) {
    emit(
      state.copyWith(
        selectedDropDownValue: event.value,
        addCropOneModelObj: state.addCropOneModelObj?.copyWith(
          selectedCrop: event.value,
          selectedDropDownValue1:
              state.addCropOneModelObj?.selectedDropDownValue1,
          selectedDropDownValue2:
              state.addCropOneModelObj?.selectedDropDownValue2,
        ),
      ),
    );
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddCropOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
      addCropOneModelObj: state.addCropOneModelObj?.copyWith(
        selectedDropDownValue1: event.value,
        selectedCrop: state.addCropOneModelObj?.selectedCrop,
        selectedDropDownValue2:
            state.addCropOneModelObj?.selectedDropDownValue2,
      ),
    ));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<AddCropOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue2: event.value,
      addCropOneModelObj: state.addCropOneModelObj?.copyWith(
        selectedDropDownValue2: event.value,
        selectedCrop: state.addCropOneModelObj?.selectedCrop,
        selectedDropDownValue1:
            state.addCropOneModelObj?.selectedDropDownValue1,
      ),
    ));
  }

  List<ChipviewalbertItemModel> fillChipviewalbertItemList() {
    return List.generate(9, (index) => ChipviewalbertItemModel());
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
      SelectionPopupModel(id: 1, title: "Yes"),
      SelectionPopupModel(id: 0, title: "No")
    ];
  }

  _searchCrops(
    SearchEventCrop event,
    Emitter<AddCropOneState> emit,
  ) async {
    emit(state.copyWith(
        addCropOneModelObj: state.addCropOneModelObj?.copyWith(
      selectedCrop: state.addCropOneModelObj?.selectedCrop,
      search: true,
      searchValues: await searchCrop(event.value),
      selectedDropDownValue1: state.addCropOneModelObj?.selectedDropDownValue1,
      selectedDropDownValue2: state.addCropOneModelObj?.selectedDropDownValue2,
    )));
  }

  _restoreCommon(
    ReturnCommonEventCrop event,
    Emitter<AddCropOneState> emit,
  ) async {
    emit(state.copyWith(
        addCropOneModelObj: state.addCropOneModelObj?.copyWith(
      selectedCrop: state.addCropOneModelObj?.selectedCrop,
      search: false,
      selectedDropDownValue1: state.addCropOneModelObj?.selectedDropDownValue1,
      selectedDropDownValue2: state.addCropOneModelObj?.selectedDropDownValue2,
    )));
  }

  Future<List<SelectionPopupModel>> fetchAreaUnits() async {
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

  Future<List<SelectionPopupModel>> fetchCrops() async {
    List<SelectionPopupModel> list = [];
    CropDB cropDB = CropDB();

    await cropDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].crop,
          id: value[i].cropId,
          code: int.parse(value[i].cropCode),
        ));
      }
    });
    return list;
  }

  Future<List<ChipviewalbertItemModel>> fetchCommonCrops() async {
    List<ChipviewalbertItemModel> list = [];
    CropDB cropDB = CropDB();

    await cropDB.fetchCommonCrops().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(ChipviewalbertItemModel(
          albertcrop: value[i].crop,
          cropId: value[i].cropId,
        ));
      }
    });
    return list;
  }

  Future<List<ChipviewalbertItemModel>> searchCrop(String crop) async {
    List<ChipviewalbertItemModel> list = [];
    CropDB cropDB = CropDB();

    await cropDB.searchCrops(crop).then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(ChipviewalbertItemModel(
          albertcrop: value[i].crop,
          cropId: value[i].cropId,
        ));
      }
    });
    return list;
  }

  _nextTap(
    NextTapEvent event,
    Emitter<AddCropOneState> emit,
  ) {
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);
    FarmerCropsDB cropsDB = FarmerCropsDB();
    int farmerid = PrefUtils().getFarmId();
    try {
      if (state.addCropOneModelObj!.caProgressDB!.pageOne == 0) {
        cropsDB
            .insertNonNullables(FarmerCrop(
          farmerCropId: 0,
          farmerId: farmerid,
          cropCode: state.addCropOneModelObj!.selectedCrop?.code,
          cropId: state.addCropOneModelObj!.selectedCrop?.id,
          farmerFarmId: PrefUtils().getFarmId(),
          dateCreated: DateTime.now(),
          createdBy: userId,
        ))
            .then((value) {
          if (value > 0) {
            PrefUtils().setCropId(value);
            cropsDB
                .updatePageOne(FarmerCrop(
                  farmerCropId: value,
                  cropCode: state.addCropOneModelObj!.selectedCrop?.code,
                  cropArea: double.parse(state.areavalueoneController!.text),
                  areaUnitId:
                      state.addCropOneModelObj!.selectedDropDownValue1?.id,
                  usageOfCertifiedSeeds:
                      state.addCropOneModelObj!.selectedDropDownValue2?.id == 1,
                  cropId: state.addCropOneModelObj!.selectedCrop?.id,
                  farmerId: farmerid,
                  farmerFarmId: PrefUtils().getFarmId(),
                ))
                .then((value) => print(
                      "Updated scop: " + value.toString(),
                    ));

            CAProgressDB caProgressDB = CAProgressDB();
            if (state.addCropOneModelObj!.caProgressDB!.pageOne == 0) {
              caProgressDB
                  .insert(CAProgress(
                    cropId: value,
                    pageOne: 1,
                    pageTwo: 0,
                  ))
                  .then((value) => print("Scope FI" + value.toString()));
            } else {
              caProgressDB
                  .update(CAProgress(
                    cropId: value,
                    pageOne: 1,
                    pageTwo: state.addCropOneModelObj!.caProgressDB!.pageTwo,
                  ))
                  .then((value) => print("Scope FI" + value.toString()));
            }
          } else {
            event.createFailed!.call();
          }
        });
      }
      if (state.addCropOneModelObj!.caProgressDB!.pageOne == 1) {
        if (farmerid != 0) {
          CAProgressDB caProgressDB = CAProgressDB();

          cropsDB
              .updatePageOne(FarmerCrop(
                farmerCropId: PrefUtils().getCropId(),
                cropCode: state.addCropOneModelObj!.selectedCrop?.code,
                cropArea: double.parse(state.areavalueoneController!.text),
                areaUnitId:
                    state.addCropOneModelObj!.selectedDropDownValue1?.id,
                usageOfCertifiedSeeds:
                    state.addCropOneModelObj!.selectedDropDownValue2?.id == 1,
                cropId: state.addCropOneModelObj!.selectedCrop?.id,
                farmerId: farmerid,
                farmerFarmId: PrefUtils().getFarmId(),
              ))
              .then((value) => print(
                    "Updated scop: " + value.toString(),
                  ));

          caProgressDB
              .update(CAProgress(
                cropId: PrefUtils().getCropId(),
                pageOne: 1,
                pageTwo: state.addCropOneModelObj!.caProgressDB!.pageTwo,
              ))
              .then((value) => print("Scope FI" + value.toString()));
        }
      }
    } catch (e) {
      event.createFailed!.call();
    }

    event.createSuccessful!.call();
  }

  _saveTap(
    SaveTapEvent event,
    Emitter<AddCropOneState> emit,
  ) {
    if (PrefUtils().getYesNo()) {
      final claims = JWT.decode(PrefUtils().getToken());
      int userId = int.parse(claims.payload[
          'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);
      FarmerCropsDB cropsDB = FarmerCropsDB();
      int farmerid = PrefUtils().getFarmId();
      try {
        if (state.addCropOneModelObj!.caProgressDB!.pageOne == 0) {
          cropsDB
              .insertNonNullables(FarmerCrop(
            farmerCropId: 0,
            farmerId: farmerid,
            cropCode: 0,
            cropId: state.addCropOneModelObj!.selectedCrop?.id,
            farmerFarmId: PrefUtils().getFarmId(),
            dateCreated: DateTime.now(),
            createdBy: userId,
          ))
              .then((value) {
            if (value > 0) {
              PrefUtils().setCropId(value);
              cropsDB
                  .updatePageOne(FarmerCrop(
                    farmerCropId: value,
                    cropCode: state.addCropOneModelObj!.selectedCrop?.code,
                    cropArea: double.parse(state.areavalueoneController!.text),
                    areaUnitId:
                        state.addCropOneModelObj!.selectedDropDownValue1?.id,
                    usageOfCertifiedSeeds:
                        state.addCropOneModelObj!.selectedDropDownValue2?.id ==
                            1,
                    cropId: state.addCropOneModelObj!.selectedCrop?.id,
                    farmerId: farmerid,
                    farmerFarmId: PrefUtils().getFarmId(),
                  ))
                  .then((value) => print(
                        "Updated scop: " + value.toString(),
                      ));

              CAProgressDB caProgressDB = CAProgressDB();
              if (state.addCropOneModelObj!.caProgressDB!.pageOne == 0) {
                caProgressDB
                    .insert(CAProgress(
                      cropId: value,
                      pageOne: 1,
                      pageTwo: 0,
                    ))
                    .then((value) => print("Scope FI" + value.toString()));
              } else {
                caProgressDB
                    .update(CAProgress(
                      cropId: value,
                      pageOne: 1,
                      pageTwo: state.addCropOneModelObj!.caProgressDB!.pageTwo,
                    ))
                    .then((value) => print("Scope FI" + value.toString()));
              }
            } else {
              event.createFailed!.call();
            }
          });
        }
        if (state.addCropOneModelObj!.caProgressDB!.pageOne == 1) {
          if (farmerid != 0) {
            CAProgressDB caProgressDB = CAProgressDB();

            cropsDB
                .updatePageOne(FarmerCrop(
                  farmerCropId: PrefUtils().getCropId(),
                  cropCode: state.addCropOneModelObj!.selectedCrop?.code,
                  cropArea: double.parse(state.areavalueoneController!.text),
                  areaUnitId:
                      state.addCropOneModelObj!.selectedDropDownValue1?.id,
                  usageOfCertifiedSeeds:
                      state.addCropOneModelObj!.selectedDropDownValue2?.id == 1,
                  cropId: state.addCropOneModelObj!.selectedCrop?.id,
                  farmerId: farmerid,
                  farmerFarmId: PrefUtils().getFarmId(),
                ))
                .then((value) => print(
                      "Updated scop: " + value.toString(),
                    ));

            caProgressDB
                .update(CAProgress(
                  cropId: PrefUtils().getCropId(),
                  pageOne: 1,
                  pageTwo: state.addCropOneModelObj!.caProgressDB!.pageTwo,
                ))
                .then((value) => print("Scope FI" + value.toString()));
          }
        }
        event.createSuccessful!.call();
      } catch (e) {
        event.createFailed!.call();
      }
    }
  }

  Future<FarmerCrop?> getCrop() async {
    int cropId = PrefUtils().getCropId();
    FarmerCropsDB farmerCropsDB = FarmerCropsDB();
    return await farmerCropsDB.fetchByFarmerCropId(cropId);
  }

  Future<CAProgress?> getProgress() async {
    int cropid = PrefUtils().getCropId();
    CAProgressDB caProgressDB = CAProgressDB();
    return await caProgressDB.fetchByCropId(cropid);
  }

  Future<FarmerFarm?> getFarm() async {
    int farmid = PrefUtils().getFarmId();
    FarmerFarmDB farmDB = FarmerFarmDB();
    return await farmDB.fetchByFarmerFarmId(farmid);
  }

  Future<double> getsizes() async {
    int farmid = PrefUtils().getFarmId();
    FarmerCropsDB farmerCropsDB = FarmerCropsDB();
    return await farmerCropsDB.cropFarmsizes(farmid);
  }

  _onInitialize(
    AddCropOneInitialEvent event,
    Emitter<AddCropOneState> emit,
  ) async {
    FarmerCrop crop = await getCrop() ??
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
          cropFarmSize: 0,
        );
    //print(farmer);
    TextEditingController areavalueoneController = TextEditingController();

    List<SelectionPopupModel> area = await fetchAreaUnits();
    List<SelectionPopupModel> crops = await fetchCrops();
    List<SelectionPopupModel> useof = fillDropdownItemList2();

    SelectionPopupModel? selectedarea;
    SelectionPopupModel? selectedcrop;
    SelectionPopupModel? selecteduse;

    if (caProgress.pageOne == 1 && crop.farmerCropId != 0) {
      areavalueoneController =
          TextEditingController(text: crop.cropArea.toString());

      selectedarea = area.firstWhere(
        (model) => model.id == crop.areaUnitId,
      );

      selectedcrop = crops.firstWhere(
        (model) => model.id == crop.cropId,
      );

      selecteduse = useof.firstWhere(
        (model) => model.id == (crop.usageOfCertifiedSeeds! ? 1 : 0),
      );
    }
    int stepper = 0;
    if (caProgress.pageTwo == 1) {
      stepper = 2;
    } else if (caProgress.pageOne == 1) {
      stepper = 1;
    }
    emit(
      state.copyWith(
        searchController: TextEditingController(),
        areavalueoneController: areavalueoneController,
      ),
    );
    emit(
      state.copyWith(
        addCropOneModelObj: state.addCropOneModelObj?.copyWith(
          chipviewalbertItemList: await fetchCommonCrops(),
          dropdownItemList: crops,
          dropdownItemList1: area,
          dropdownItemList2: useof,
          stepped2: stepper,
          selectedCrop: selectedcrop,
          selectedDropDownValue1: selectedarea,
          selectedDropDownValue2: selecteduse,
          crop: crop,
          caProgressDB: caProgress,
          area: farmer.cropFarmSize,
          area1: await getsizes(),
        ),
      ),
    );
  }
}

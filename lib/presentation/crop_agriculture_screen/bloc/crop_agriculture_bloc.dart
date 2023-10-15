import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/crops/crop.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropareaunit.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropmotive.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropsystem.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropwatersource.dart';
import 'package:kiamis_app/data/models/dbModels/processes/crop_agri.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/crops/crop.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/crop.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropareaunit.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropmotive.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropsystem.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropwatersource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/crop_agri.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/crop/crops.dart';
import '/core/app_export.dart';
import '../models/cropdetails_item_model.dart';
import 'package:kiamis_app/presentation/crop_agriculture_screen/models/crop_agriculture_model.dart';
part 'crop_agriculture_event.dart';
part 'crop_agriculture_state.dart';

/// A bloc that manages the state of a CropAgriculture according to the event that is dispatched to it.
class CropAgricultureBloc
    extends Bloc<CropAgricultureEvent, CropAgricultureState> {
  CropAgricultureBloc(CropAgricultureState initialState) : super(initialState) {
    on<CropAgricultureInitialEvent>(_onInitialize);
    on<AddEditEvent>(_addEdit);
    on<DeleteEvent>(_delete);
  }

  _onInitialize(
    CropAgricultureInitialEvent event,
    Emitter<CropAgricultureState> emit,
  ) async {
    List<FarmerCrop> crops = await fetchFCrops() ?? [];

    List<CropdetailsItemModel> cropmodels = [];

    CropWaterSource? waterSource;

    CropAreaUnit? cropAreaUnit;

    CropSystem? cropSystem;

    CropPlantingMotive? cropPlantingMotive;

    Crop? cropp;

    for (var crop in crops) {
      waterSource = await getSource(crop.waterSourceId!);
      cropAreaUnit = await getArea(crop.areaUnitId!);
      cropSystem = await getSystem(crop.cropSystemId!);
      cropPlantingMotive = await getmotive(crop.cropMotiveId!);
      cropp = await getCrop(crop.cropId!);
      cropmodels.add(CropdetailsItemModel(
        //   crop: crop,
        id: crop.farmerCropId,
        totalAcreage: crop.cropArea.toString(),
        name: cropp!.crop,
        unitOfArea: cropAreaUnit!.areaUnit,
        water: waterSource?.waterSource,
        purpose: cropPlantingMotive?.cropMotive,
        system: cropSystem?.croppingSystem,
        fertiliser: crop.fertilizerUse! == 1 ? "Yes" : "No",
        pesticide: crop.pesticideUse! == 1 ? "Yes" : "No",
        seeds: crop.usageOfCertifiedSeeds! ? "Yes" : "No",
      ));
    }
    emit(
      state.copyWith(
        cropAgricultureModelObj: state.cropAgricultureModelObj?.copyWith(
          cropdetailsItemList: cropmodels,
        ),
      ),
    );
  }

  List<CropdetailsItemModel> fillCropdetailsItemList() {
    return List.generate(2, (index) => CropdetailsItemModel());
  }

  // Future<List<CropdetailsItemModel>?> fetchCrops() {
  //   return [];
  // }

  Future<List<FarmerCrop>?> fetchFCrops() async {
    int id = PrefUtils().getFarmId();
    FarmerCropsDB farmerCropsDB = FarmerCropsDB();
    return await farmerCropsDB.fetchAllByFarm(id);
  }

  Future<FarmerCrop?> getOwnership() async {
    int cropId = PrefUtils().getCropId();
    FarmerCropsDB farmerCropsDB = FarmerCropsDB();
    return await farmerCropsDB.fetchByFarmerCropId(cropId);
  }

  Future<CropAreaUnit?> getArea(int id) async {
    CropAreaUnitDB cropAreaUnitDB = CropAreaUnitDB();
    return await cropAreaUnitDB.fetchByAreaUnitId(id);
  }

  Future<Crop?> getCrop(int id) async {
    CropDB cropSystemDB = CropDB();
    return await cropSystemDB.fetchByCropId(id);
  }

  Future<CropSystem?> getSystem(int id) async {
    CropSystemDB cropSystemDB = CropSystemDB();
    return await cropSystemDB.fetchByCropSystemId(id);
  }

  Future<CropWaterSource?> getSource(int id) async {
    CropWaterSourceDB cropWaterSourceDB = CropWaterSourceDB();
    return await cropWaterSourceDB.fetchByWaterSourceId(id);
  }

  Future<CropPlantingMotive?> getmotive(int id) async {
    CropPlantingMotiveDB cropPlantingMotiveDB = CropPlantingMotiveDB();
    return await cropPlantingMotiveDB.fetchByCropMotiveId(id);
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

  _addEdit(
    AddEditEvent event,
    Emitter<CropAgricultureState> emit,
  ) {
    if (event.value! == 1) {
      PrefUtils().setCropId(event.crop!);
      event.createSuccessful!.call();
    } else {
      PrefUtils().setCropId(0);
      event.createSuccessful!.call();
    }
  }

  _delete(
    DeleteEvent event,
    Emitter<CropAgricultureState> emit,
  ) async {
    FarmerCropsDB farmerCropsDB = FarmerCropsDB();
    int deleted = await farmerCropsDB.delete(event.value!);

    if (deleted > 0) {
      List<FarmerCrop> crops = await fetchFCrops() ?? [];

      List<CropdetailsItemModel> cropmodels = [];

      CropWaterSource? waterSource;

      CropAreaUnit? cropAreaUnit;

      CropSystem? cropSystem;

      CropPlantingMotive? cropPlantingMotive;

      Crop? cropp;

      for (var crop in crops) {
        waterSource = await getSource(crop.waterSourceId!);
        cropAreaUnit = await getArea(crop.areaUnitId!);
        cropSystem = await getSystem(crop.cropSystemId!);
        cropPlantingMotive = await getmotive(crop.cropMotiveId!);
        cropp = await getCrop(crop.cropId!);
        cropmodels.add(CropdetailsItemModel(
          //   crop: crop,
          id: crop.farmerCropId,
          totalAcreage: crop.cropArea.toString(),
          name: cropp!.crop,
          unitOfArea: cropAreaUnit!.areaUnit,
          water: waterSource?.waterSource,
          purpose: cropPlantingMotive?.cropMotive,
          system: cropSystem?.croppingSystem,
          fertiliser: crop.fertilizerUse! == 1 ? "Yes" : "No",
          pesticide: crop.pesticideUse! == 1 ? "Yes" : "No",
          seeds: crop.usageOfCertifiedSeeds! ? "Yes" : "No",
        ));
      }
      emit(
        state.copyWith(
          cropAgricultureModelObj: state.cropAgricultureModelObj?.copyWith(
            cropdetailsItemList: cropmodels,
          ),
        ),
      );
    }
  }
}

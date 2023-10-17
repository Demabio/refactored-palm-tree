import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/crops/crop.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropareaunit.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropmotive.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropsystem.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropwatersource.dart';
import 'package:kiamis_app/data/models/dbModels/processes/crop_agri.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/crops/crop.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fertiliser/fertiliser.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fertiliser/fertilisersource.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/pesticide.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/crop.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropareaunit.dart';
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

    List<CheckBoxList>? typemodels = await fecthType();
    List<CheckBoxList>? sourcemodels = await fetchSources();
    List<CheckBoxList>? pestsmodels = await fetchPest();
    for (var crop in crops) {
      List<FarmerFertiliser>? type = await getTypes();
      if (type != null) {
        typemodels = _types(typemodels!, type);
      }
      List<FarmerFertiliserSource>? source = await getSources();
      if (source != null) {
        sourcemodels = _sources(sourcemodels!, source);
      }
      List<FarmerPesticide>? pests = await getPest();
      if (pests != null) {
        pestsmodels = _pest(pestsmodels!, pests);
      }
      waterSource = await getSource(crop.waterSourceId);
      cropAreaUnit = await getArea(crop.areaUnitId!);
      cropSystem = await getSystem(crop.cropSystemId);
      cropPlantingMotive = await getmotive(crop.cropMotiveId);
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
        a: typemodels!,
        s: sourcemodels!,
        p: pestsmodels!,
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

  Future<CropSystem?> getSystem(int? id) async {
    CropSystemDB cropSystemDB = CropSystemDB();
    return id != null ? await cropSystemDB.fetchByCropSystemId(id) : null;
  }

  Future<CropWaterSource?> getSource(int? id) async {
    CropWaterSourceDB cropWaterSourceDB = CropWaterSourceDB();
    return id != null ? await cropWaterSourceDB.fetchByWaterSourceId(id) : null;
  }

  Future<CropPlantingMotive?> getmotive(int? id) async {
    CropPlantingMotiveDB cropPlantingMotiveDB = CropPlantingMotiveDB();
    return id != null
        ? await cropPlantingMotiveDB.fetchByCropMotiveId(id)
        : null;
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
    CAProgressDB caProgressDB = CAProgressDB();

    if (deleted > 0) {
      List<FarmerCrop> crops = await fetchFCrops() ?? [];
      await caProgressDB.delete(event.value!);
      List<CropdetailsItemModel> cropmodels = [];

      CropWaterSource? waterSource;

      CropAreaUnit? cropAreaUnit;

      CropSystem? cropSystem;

      CropPlantingMotive? cropPlantingMotive;

      Crop? cropp;

      for (var crop in crops) {
        waterSource = await getSource(crop.waterSourceId);
        cropAreaUnit = await getArea(crop.areaUnitId!);
        cropSystem = await getSystem(crop.cropSystemId);
        cropPlantingMotive = await getmotive(crop.cropMotiveId);
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

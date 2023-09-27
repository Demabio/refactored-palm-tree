import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropareaunit.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropscategory.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropsystem.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropwatersource.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestock.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestockcategory.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestockfarmingsystem.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestockfeedtypes.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestocksubcategory.dart';
import 'package:kiamis_app/data/models/dbModels/other/agriculturalinfosource.dart';
import 'package:kiamis_app/data/models/dbModels/other/agriskills.dart';
import 'package:kiamis_app/data/models/dbModels/other/conservationagripractices.dart';
import 'package:kiamis_app/data/models/dbModels/other/creditsource.dart';
import 'package:kiamis_app/data/models/dbModels/other/educationlevel.dart';
import 'package:kiamis_app/data/models/dbModels/other/enterpirses.dart';
import 'package:kiamis_app/data/models/dbModels/other/extensionsources.dart';
import 'package:kiamis_app/data/models/dbModels/other/householdrelationships.dart';
import 'package:kiamis_app/data/models/dbModels/other/incomesource.dart';
import 'package:kiamis_app/data/models/dbModels/other/laboursource.dart';
import 'package:kiamis_app/data/models/dbModels/other/livelihoodsource.dart';
import 'package:kiamis_app/data/models/dbModels/other/maritalstatus.dart';
import 'package:kiamis_app/data/models/dbModels/other/pesticidetype.dart';
import 'package:kiamis_app/data/models/dbModels/other/respondentrelationship.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropareaunit.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropscategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropsystem.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropwatersource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestock.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockfarmingsystem.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockfeedtypes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestocksubcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/agriculturalinfosource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/agriskills.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/conservationagripractices.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/creditsource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/educationlevel.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/enterpirses.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/extensionsources.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/householdrelationships.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/incomesource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/laboursource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/livelihoodsource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/maritalstatus.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/pesticidetype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/respondentrelationship.dart';
import 'package:kiamis_app/data/sqlService/dbutils.dart';
import 'package:kiamis_app/data/sqlService/graphqlqueries.dart';
import '../../../data/models/dbModels/crops/crop.dart';
import '../../../data/models/dbModels/farm/farmassets.dart';
import '../../../data/models/dbModels/farm/farmassetsource.dart';
import '../../../data/models/dbModels/farm/farmassettypes.dart';
import '../../../data/models/dbModels/farm/farmerstatus.dart';
import '../../../data/models/dbModels/farm/farmertypes.dart';
import '../../../data/models/dbModels/farm/farmlandpractices.dart';
import '../../../data/models/dbModels/farm/farmownership.dart';
import '../../../data/models/dbModels/farm/farmpowersource.dart';
import '../../../data/models/dbModels/farm/farmstructures.dart';
import '../../../data/repository/repository.dart';
import '../../../data/sqlService/dbqueries/crops/crop.dart';
import '../../../data/sqlService/dbqueries/farm/farmassets.dart';
import '../../../data/sqlService/dbqueries/farm/farmassetsource.dart';
import '../../../data/sqlService/dbqueries/farm/farmassettypes.dart';
import '../../../data/sqlService/dbqueries/farm/farmerstatus.dart';
import '../../../data/sqlService/dbqueries/farm/farmertypes.dart';
import '../../../data/sqlService/dbqueries/farm/farmlandpractices.dart';
import '../../../data/sqlService/dbqueries/farm/farmownership.dart';
import '../../../data/sqlService/dbqueries/farm/farmpowersource.dart';
import '../../../data/sqlService/dbqueries/farm/farmstructures.dart';
import '/core/app_export.dart';
import 'package:path/path.dart';

import 'package:kiamis_app/presentation/home_farmer_not_found_dialog/models/home_farmer_not_found_model.dart';
part 'home_farmer_not_found_event.dart';
part 'home_farmer_not_found_state.dart';

/// A bloc that manages the state of a HomeFarmerNotFound according to the event that is dispatched to it.
class HomeFarmerNotFoundBloc
    extends Bloc<HomeFarmerNotFoundEvent, HomeFarmerNotFoundState> {
  HomeFarmerNotFoundBloc(HomeFarmerNotFoundState initialState)
      : super(initialState) {
    on<HomeFarmerNotFoundInitialEvent>(_onInitialize);
    on<FetchGetOrdersEvent>(_addCount);
    on<InnitDBwithDataEvent>(_downloadData);
    on<InnitDBwithDataFailedEvent>(_dbDownloadFailed);
  }
  DBUtils _dbUtils = DBUtils();
  final _repository = Repository();

  _onInitialize(
    HomeFarmerNotFoundInitialEvent event,
    Emitter<HomeFarmerNotFoundState> emit,
  ) async {}

  Future<void> _addCount(
      FetchGetOrdersEvent event, Emitter<HomeFarmerNotFoundState> emit) async {
    final updatedState = state.copyWith(
      count: state.count + 1,
      linebarvalue: state.linebarvalue + 0.1,
      percentagedone: state.percentagedone + 10,
    );
    emit(updatedState);
  }

  Future<void> _dbDownloadFailed(InnitDBwithDataFailedEvent event,
      Emitter<HomeFarmerNotFoundState> emit) async {
    final updatedState = state.copyWith(failed: false);
    emit(updatedState);
  }

  Future<void> _downloadData(
    InnitDBwithDataEvent event,
    Emitter<HomeFarmerNotFoundState> emit,
  ) async {
    int full = 4400;
    int appraiser = 0;
    double currentval = 0;
    double currentpercentage = 0;
    final updatedState = state.copyWith(
      visibility: true,
      failed: false,
    );
    emit(updatedState);
    _dbUtils.deleteDatabaseIfExists(
        join(PrefUtils().getDBPath(), 'localdevice.db'));

// Crops
    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallCrops,
    ).then((value) async {
      List<Crop> crops = Crop.fromJsonList(value.data);
      Future<int> cropsuccess = CropDB().insertCrops(crops);

      cropsuccess.then((_) {
        if (_ == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });
    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallCropSystems,
    ).then((value) async {
      List<CropSystem> cropsystem = CropSystem.parseCropSystems(value.data);
      Future<int> cropsuccess =
          CropSystemDB().insertCroppingSystems(cropsystem);

      cropsuccess.then((_) {
        if (_ == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });
    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallCropCategories,
    ).then((value) async {
      List<CropCategory> cropcategory =
          CropCategory.parseCropCategories(value.data);
      Future<int> cropsuccess =
          CropCategoriesDB().insertCropCategories(cropcategory);

      cropsuccess.then((_) {
        if (_ == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });
    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallCropAreaUnits,
    ).then((value) async {
      List<CropAreaUnit> cropareaunit =
          CropAreaUnit.parseCropAreaUnits(value.data);
      Future<int> cropsuccess = CropAreaUnitDB().insertAreaUnits(cropareaunit);

      cropsuccess.then((_) {
        if (_ == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });
    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallCropWaterSources,
    ).then((value) async {
      List<CropWaterSource> cropswater =
          CropWaterSource.parseCropWaterSources(value.data);
      await CropWaterSourceDB().insertWaterSources(cropswater).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    //Livestock

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getAllLivestocks,
    ).then((value) async {
      List<Livestock> data = Livestock.parseLivestocks(value.data);
      await LivestockDB().insertLivestocks(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getAllLivestockCategories,
    ).then((value) async {
      List<LivestockCategory> data =
          LivestockCategory.parseLivestockCategories(value.data);
      await LivestockCategoryDB().insertLivestockCategories(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getAllLivestockSubcategories,
    ).then((value) async {
      List<LivestockSubcategory> data =
          LivestockSubcategory.parseLivestockSubcategories(value.data);
      await LivestockSubcategoryDB()
          .insertLivestockSubcategories(data)
          .then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getAllLivestockFarmingSystems,
    ).then((value) async {
      List<LivestockFarmingSystem> data =
          LivestockFarmingSystem.parseLivestockFarmingSystems(value.data);
      await LivestockFarmingSystemDB()
          .insertLivestockFarmSystems(data)
          .then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getAllLivestockFeedTypes,
    ).then((value) async {
      List<LivestockFeedType> data =
          LivestockFeedType.parseLivestockFeedTypes(value.data);
      await LivestockFeedTypeDB().insertFeedTypes(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    //Farm
    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getAllLivestockFeedTypes,
    ).then((value) async {
      List<LivestockFeedType> data =
          LivestockFeedType.parseLivestockFeedTypes(value.data);
      await LivestockFeedTypeDB().insertFeedTypes(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getAllLivestockFeedTypes,
    ).then((value) async {
      List<LivestockFeedType> data =
          LivestockFeedType.parseLivestockFeedTypes(value.data);
      await LivestockFeedTypeDB().insertFeedTypes(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getAllLivestockFeedTypes,
    ).then((value) async {
      List<LivestockFeedType> data =
          LivestockFeedType.parseLivestockFeedTypes(value.data);
      await LivestockFeedTypeDB().insertFeedTypes(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getAllLivestockFeedTypes,
    ).then((value) async {
      List<LivestockFeedType> data =
          LivestockFeedType.parseLivestockFeedTypes(value.data);
      await LivestockFeedTypeDB().insertFeedTypes(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getAllLivestockFeedTypes,
    ).then((value) async {
      List<LivestockFeedType> data =
          LivestockFeedType.parseLivestockFeedTypes(value.data);
      await LivestockFeedTypeDB().insertFeedTypes(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getAllLivestockFeedTypes,
    ).then((value) async {
      List<LivestockFeedType> data =
          LivestockFeedType.parseLivestockFeedTypes(value.data);
      await LivestockFeedTypeDB().insertFeedTypes(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

//Farm
    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallFarmAssetSources,
    ).then((value) async {
      List<FarmAssetSource> data =
          FarmAssetSource.parseFarmAssetSources(value.data);
      await FarmAssetSourceDB().insertAssetSources(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallFarmAssetTypes,
    ).then((value) async {
      List<FarmAssetType> data = FarmAssetType.parseFarmAssetTypes(value.data);
      await FarmAssetTypeDB().insertAssetTypes(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallFarmAssets,
    ).then((value) async {
      List<FarmAsset> data = FarmAsset.parseFarmAssets(value.data);
      await FarmAssetDB().insertFarmAssets(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallFarmPowerSources,
    ).then((value) async {
      List<FarmPowerSource> data =
          FarmPowerSource.parseFarmPowerSources(value.data);
      await FarmPowerSourceDB().insertPowerSources(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    //Farm
    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallFarmStructures,
    ).then((value) async {
      List<FarmStructure> data = FarmStructure.parseFarmStructures(value.data);
      await FarmStructureDB().insertFarmStructures(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallFarmerFarmOwnerships,
    ).then((value) async {
      List<FarmerFarmOwnership> data =
          FarmerFarmOwnership.parseFarmerFarmOwnerships(value.data);
      await FarmerFarmOwnershipDB().insertOwnerships(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallFarmerStatus,
    ).then((value) async {
      List<FarmerStatus> data = FarmerStatus.parseFarmerStatus(value.data);
      await FarmerStatusDB().insertFarmerStatuses(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallFarmerType,
    ).then((value) async {
      List<FarmerType> data = FarmerType.parseFarmerTypes(value.data);
      await FarmerTypeDB().insertFarmerTypes(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallFarmlandPractices,
    ).then((value) async {
      List<FarmlandPractice> data =
          FarmlandPractice.parseFarmlandPractices(value.data);
      await FarmlandPracticeDB().insertLandPractices(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    //Others
    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallAgriInfoSource,
    ).then((value) async {
      List<AgriInfoSource> data =
          AgriInfoSource.parseAgriInfoSources(value.data);
      await AgriInfoSourceDB().insertAgriInfoSources(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallAgriManagementSkills,
    ).then((value) async {
      List<AgriManagementSkill> data =
          AgriManagementSkill.parseAgriManagementSkills(value.data);
      await AgriManagementSkillsDB().insertAgriSkills(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallAgriPractice,
    ).then((value) async {
      List<AgriPractice> data = AgriPractice.parseAgriPractices(value.data);
      await AgriPracticeDB().insertAgriPractices(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallCreditSources,
    ).then((value) async {
      List<CreditSource> data = CreditSource.parseCreditSources(value.data);
      await CreditSourceDB().insertCreditSources(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallEducationLevels,
    ).then((value) async {
      List<EducationLevel> data =
          EducationLevel.parseEducationLevels(value.data);
      await EducationLevelDB().insertEducationLevels(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallEnterprises,
    ).then((value) async {
      List<Enterprise> data = Enterprise.parseEnterprises(value.data);
      await EnterprisesDB().insertEnterprises(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallExtensionSources,
    ).then((value) async {
      List<ExtensionSource> data =
          ExtensionSource.parseExtensionSources(value.data);
      await ExtensionSourceDB().insertExtensionSources(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallHouseholdRelationship,
    ).then((value) async {
      List<HouseholdRelationship> data =
          HouseholdRelationship.parseHouseholdRelationships(value.data);
      await HouseholdRelationshipsDB()
          .insertHouseholdRelationships(data)
          .then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallIncomeSource,
    ).then((value) async {
      List<IncomeSource> data = IncomeSource.parseIncomeSources(value.data);
      await IncomeSourceDB().insertIncomeSources(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallLabourSource,
    ).then((value) async {
      List<LabourSource> data = LabourSource.parseLabourSources(value.data);
      await LabourSourceDB().insertLabourSources(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallLivelihoodSource,
    ).then((value) async {
      List<LivelihoodSource> data =
          LivelihoodSource.parseLivelihoodSources(value.data);
      await LivelihoodSourceDB().insertLivelihoodSources(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallMaritalStatus,
    ).then((value) async {
      List<MaritalStatus> data = MaritalStatus.parseMaritalStatus(value.data);
      await MaritalStatusDB().insertMaritalStatuses(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallPesticideTypes,
    ).then((value) async {
      List<PesticideType> data = PesticideType.parsePesticideTypes(value.data);
      await PesticideTypeDB().insertPesticideTypes(data).then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallRespondentRelationships,
    ).then((value) async {
      List<RespondentRelationship> data =
          RespondentRelationship.parseRespondentRelationships(value.data);
      await RespondentRelationshipDB()
          .insertRespondentRelationships(data)
          .then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });

    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: Graphql.getallRespondentRelationships,
    ).then((value) async {
      List<RespondentRelationship> data =
          RespondentRelationship.parseRespondentRelationships(value.data);
      await RespondentRelationshipDB()
          .insertRespondentRelationships(data)
          .then((value) {
        if (value == 200) {
          appraiser += 100;
          currentval = appraiser / 4400;
          currentpercentage = currentval * 100;
          final updatedState = state.copyWith(
            count: state.count + 1,
            linebarvalue: currentval,
            percentagedone: currentpercentage.toInt(),
          );
          emit(updatedState);
        } else {}
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
}

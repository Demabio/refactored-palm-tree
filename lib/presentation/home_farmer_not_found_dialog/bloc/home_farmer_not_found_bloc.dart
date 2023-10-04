import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropareaunit.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropscategory.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropsystem.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropwatersource.dart';
import 'package:kiamis_app/data/models/dbModels/fertiliser/fertilisertype.dart';
import 'package:kiamis_app/data/models/dbModels/fertiliser/fertilisertypecategory.dart';
import 'package:kiamis_app/data/models/dbModels/fish/fish.dart';
import 'package:kiamis_app/data/models/dbModels/fish/fishcategory.dart';
import 'package:kiamis_app/data/models/dbModels/fish/fishproductionlevels.dart';
import 'package:kiamis_app/data/models/dbModels/fish/fishproductiontype.dart';
import 'package:kiamis_app/data/models/dbModels/fish/fishproductionuom.dart';
import 'package:kiamis_app/data/models/dbModels/irrigation/irrigationagencies.dart';
import 'package:kiamis_app/data/models/dbModels/irrigation/irrigationcategory.dart';
import 'package:kiamis_app/data/models/dbModels/irrigation/irrigationtypes.dart';
import 'package:kiamis_app/data/models/dbModels/irrigation/irrigationwatersources.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/agegroup.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/beehivetypes.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestock.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestockcategory.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestockfarmingsystem.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestockfeedtypes.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestocksubcategory.dart';
import 'package:kiamis_app/data/models/dbModels/other/agriculturalinfosource.dart';
import 'package:kiamis_app/data/models/dbModels/other/agriskills.dart';
import 'package:kiamis_app/data/models/dbModels/other/conservationagripractices.dart';
import 'package:kiamis_app/data/models/dbModels/other/cooperativegroups.dart';
import 'package:kiamis_app/data/models/dbModels/other/creditsource.dart';
import 'package:kiamis_app/data/models/dbModels/other/educationlevel.dart';
import 'package:kiamis_app/data/models/dbModels/other/enterpirses.dart';
import 'package:kiamis_app/data/models/dbModels/other/extensionmodes.dart';
import 'package:kiamis_app/data/models/dbModels/other/extensionsources.dart';
import 'package:kiamis_app/data/models/dbModels/other/householdrelationships.dart';
import 'package:kiamis_app/data/models/dbModels/other/incomesource.dart';
import 'package:kiamis_app/data/models/dbModels/other/laboursource.dart';
import 'package:kiamis_app/data/models/dbModels/other/livelihoodsource.dart';
import 'package:kiamis_app/data/models/dbModels/other/maritalstatus.dart';
import 'package:kiamis_app/data/models/dbModels/other/pesticidetype.dart';
import 'package:kiamis_app/data/models/dbModels/other/registrationstatus.dart';
import 'package:kiamis_app/data/models/dbModels/other/respondentrelationship.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropareaunit.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropscategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropsystem.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropwatersource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fertiliser/fertilisersource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fertiliser/fertilisertype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fertiliser/fertilisertypecategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fish.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductionlevels.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductiontype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductionuom.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationagencies.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationtypes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationwatersources.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/agegroup.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/beehivetype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestock.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockfarmingsystem.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockfeedtypes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestocksubcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/agriculturalinfosource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/agriskills.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/conservationagripractices.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/cooperativegroups.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/creditsource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/educationlevel.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/enterpirses.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/extensionmodes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/extensionsources.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/householdrelationships.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/incomesource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/laboursource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/livelihoodsource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/maritalstatus.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/pesticidetype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/registrationstatus.dart';
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
import '../../../data/models/dbModels/fertiliser/fertilisersource.dart';
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
    on<InnitDBwithDataSuccessEvent>(_dbDownloadSuccess);
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
    final updatedState = state.copyWith(failed: true, success: false);
    emit(updatedState);
  }

  Future<void> _dbDownloadSuccess(InnitDBwithDataSuccessEvent event,
      Emitter<HomeFarmerNotFoundState> emit) async {
    try {
      final updatedState = state.copyWith(failed: false, success: true);
      emit(updatedState);
    } catch (e) {
      throw (e);
    }
  }

  Future<void> _downloadData(
    InnitDBwithDataEvent event,
    Emitter<HomeFarmerNotFoundState> emit,
  ) async {
    int full = 10000;
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

    try {
      await _repository.setupServicePost(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${PrefUtils().getToken()}'
        },
        requestData: Graphql.getallCrops,
      ).then((value) async {
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<Crop> crops = Crop.fromJsonList(value.data);
        Future<int> cropsuccess = CropDB().insertCrops(crops);
        //List<Crop> crops1 = CropDB().fetchAll();

        cropsuccess.then((_) {
          if (_ == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<CropSystem> cropsystem = CropSystem.parseCropSystems(value.data);
        Future<int> cropsuccess =
            CropSystemDB().insertCroppingSystems(cropsystem);

        cropsuccess.then((_) {
          if (_ == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<CropCategory> cropcategory =
            CropCategory.parseCropCategories(value.data);
        Future<int> cropsuccess =
            CropCategoriesDB().insertCropCategories(cropcategory);

        cropsuccess.then((_) {
          if (_ == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<CropAreaUnit> cropareaunit =
            CropAreaUnit.parseCropAreaUnits(value.data);
        Future<int> cropsuccess =
            CropAreaUnitDB().insertAreaUnits(cropareaunit);

        cropsuccess.then((_) {
          if (_ == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<CropWaterSource> cropswater =
            CropWaterSource.parseCropWaterSources(value.data);
        await CropWaterSourceDB().insertWaterSources(cropswater).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<Livestock> data = Livestock.parseLivestocks(value.data);
        await LivestockDB().insertLivestocks(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<LivestockCategory> data =
            LivestockCategory.parseLivestockCategories(value.data);
        await LivestockCategoryDB()
            .insertLivestockCategories(data)
            .then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<LivestockSubcategory> data =
            LivestockSubcategory.parseLivestockSubcategories(value.data);
        await LivestockSubcategoryDB()
            .insertLivestockSubcategories(data)
            .then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<LivestockFarmingSystem> data =
            LivestockFarmingSystem.parseLivestockFarmingSystems(value.data);
        await LivestockFarmingSystemDB()
            .insertLivestockFarmSystems(data)
            .then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<LivestockFeedType> data =
            LivestockFeedType.parseLivestockFeedTypes(value.data);
        await LivestockFeedTypeDB().insertFeedTypes(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<FarmAssetSource> data =
            FarmAssetSource.parseFarmAssetSources(value.data);
        await FarmAssetSourceDB().insertAssetSources(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<FarmAssetType> data =
            FarmAssetType.parseFarmAssetTypes(value.data);
        await FarmAssetTypeDB().insertAssetTypes(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<FarmAsset> data = FarmAsset.parseFarmAssets(value.data);
        await FarmAssetDB().insertFarmAssets(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<FarmPowerSource> data =
            FarmPowerSource.parseFarmPowerSources(value.data);
        await FarmPowerSourceDB().insertPowerSources(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<FarmStructure> data =
            FarmStructure.parseFarmStructures(value.data);
        await FarmStructureDB().insertFarmStructures(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<FarmerFarmOwnership> data =
            FarmerFarmOwnership.parseFarmerFarmOwnerships(value.data);
        await FarmerFarmOwnershipDB().insertOwnerships(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<FarmerStatus> data = FarmerStatus.parseFarmerStatus(value.data);
        await FarmerStatusDB().insertFarmerStatuses(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<FarmerType> data = FarmerType.parseFarmerTypes(value.data);
        await FarmerTypeDB().insertFarmerTypes(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<FarmlandPractice> data =
            FarmlandPractice.parseFarmlandPractices(value.data);
        await FarmlandPracticeDB().insertLandPractices(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<AgriInfoSource> data =
            AgriInfoSource.parseAgriInfoSources(value.data);
        await AgriInfoSourceDB().insertAgriInfoSources(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<AgriManagementSkill> data =
            AgriManagementSkill.parseAgriManagementSkills(value.data);
        await AgriManagementSkillsDB().insertAgriSkills(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<AgriPractice> data = AgriPractice.parseAgriPractices(value.data);
        await AgriPracticeDB().insertAgriPractices(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<CreditSource> data = CreditSource.parseCreditSources(value.data);
        await CreditSourceDB().insertCreditSources(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<EducationLevel> data =
            EducationLevel.parseEducationLevels(value.data);
        await EducationLevelDB().insertEducationLevels(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<Enterprise> data = Enterprise.parseEnterprises(value.data);
        await EnterprisesDB().insertEnterprises(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<ExtensionSource> data =
            ExtensionSource.parseExtensionSources(value.data);
        await ExtensionSourceDB().insertExtensionSources(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<HouseholdRelationship> data =
            HouseholdRelationship.parseHouseholdRelationships(value.data);
        await HouseholdRelationshipsDB()
            .insertHouseholdRelationships(data)
            .then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<IncomeSource> data = IncomeSource.parseIncomeSources(value.data);
        await IncomeSourceDB().insertIncomeSources(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<LabourSource> data = LabourSource.parseLabourSources(value.data);
        await LabourSourceDB().insertLabourSources(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<LivelihoodSource> data =
            LivelihoodSource.parseLivelihoodSources(value.data);
        await LivelihoodSourceDB().insertLivelihoodSources(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<MaritalStatus> data = MaritalStatus.parseMaritalStatus(value.data);
        await MaritalStatusDB().insertMaritalStatuses(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<PesticideType> data =
            PesticideType.parsePesticideTypes(value.data);
        await PesticideTypeDB().insertPesticideTypes(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
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
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<RespondentRelationship> data =
            RespondentRelationship.parseRespondentRelationships(value.data);
        await RespondentRelationshipDB()
            .insertRespondentRelationships(data)
            .then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });

      //fertilizer

      await _repository.setupServicePost(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${PrefUtils().getToken()}'
        },
        requestData: Graphql.getallFertiliserSources,
      ).then((value) async {
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<FertilizerSource> data =
            FertilizerSource.parseFertiliserSources(value.data);
        await FertiliserSourceDB().insertFertilizerSources(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });

      await _repository.setupServicePost(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${PrefUtils().getToken()}'
        },
        requestData: Graphql.getallFertiliserTypes,
      ).then((value) async {
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<FertilizerType> data =
            FertilizerType.parseFertiliserTypes(value.data);
        await FertiliserTypeDB().insertFertilizerTypes(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });

      await _repository.setupServicePost(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${PrefUtils().getToken()}'
        },
        requestData: Graphql.getallFertiliserTypeCategories,
      ).then((value) async {
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<FertilizerTypeCategory> data =
            FertilizerTypeCategory.parseFertiliserCategories(value.data);
        await FertiliserTypeCategoriesDB()
            .insertFertilizerCategories(data)
            .then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });

      //fish
      await _repository.setupServicePost(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${PrefUtils().getToken()}'
        },
        requestData: Graphql.getallFishCategories,
      ).then((value) async {
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<FishCategory> data = FishCategory.parseFishCategories(value.data);
        await FishCategoryDB().insertFishCategories(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });

      await _repository.setupServicePost(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${PrefUtils().getToken()}'
        },
        requestData: Graphql.getallFishProductionLevels,
      ).then((value) async {
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<FishProductionLevel> data =
            FishProductionLevel.parseFishProductionLevels(value.data);
        await FishProductionLevelDB()
            .insertProductionLevels(data)
            .then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });

      await _repository.setupServicePost(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${PrefUtils().getToken()}'
        },
        requestData: Graphql.getallFishProductionTypes,
      ).then((value) async {
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<FishProductionType> data =
            FishProductionType.parseFishProductionTypes(value.data);
        await FishProductionTypeDB()
            .insertFishProductionTypes(data)
            .then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });

      await _repository.setupServicePost(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${PrefUtils().getToken()}'
        },
        requestData: Graphql.getallFishProductionUOM,
      ).then((value) async {
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<FishProductionUnitOfMeasure> data =
            FishProductionUnitOfMeasure.parseFishProductionUOM(value.data);
        await FishProductionUnitOfMeasureDB()
            .insertUnitOfMeasures(data)
            .then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });

      // Irrigation
      await _repository.setupServicePost(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${PrefUtils().getToken()}'
        },
        requestData: Graphql.getallIrrigationAgencies,
      ).then((value) async {
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<IrrigationAgency> data =
            IrrigationAgency.parseIrrigationAgencies(value.data);
        await IrrigationAgencyDB().insertIrrigationAgencies(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });

      await _repository.setupServicePost(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${PrefUtils().getToken()}'
        },
        requestData: Graphql.getallIrrigationCategories,
      ).then((value) async {
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<IrrigationCategory> data =
            IrrigationCategory.parseIrrigationCategories(value.data);
        await IrrigationCategoryDB()
            .insertIrrigationCategories(data)
            .then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });

      await _repository.setupServicePost(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${PrefUtils().getToken()}'
        },
        requestData: Graphql.getallIrrigationTypes,
      ).then((value) async {
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<IrrigationType> data =
            IrrigationType.parseIrrigationTypes(value.data);
        await IrrigationTypeDB().insertIrrigationTypes(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });

      await _repository.setupServicePost(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${PrefUtils().getToken()}'
        },
        requestData: Graphql.getallIrrigationWaterSources,
      ).then((value) async {
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<IrrigationWaterSource> data =
            IrrigationWaterSource.parseIrrigationWaterSources(value.data);
        await IrrigationWaterSourceDB()
            .insertIrrigationWaterSources(data)
            .then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });

      await _repository.setupServicePost(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${PrefUtils().getToken()}'
        },
        requestData: Graphql.getallFish,
      ).then((value) async {
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<FishType> data = FishType.parseFishList(value.data);
        await FishTypeDB().insertFishTypes(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });

      await _repository.setupServicePost(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${PrefUtils().getToken()}'
        },
        requestData: Graphql.getallFarmerRegistrationStatuses,
      ).then((value) async {
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<FarmersRegistrationStatus> data =
            FarmersRegistrationStatus.parseFarmerRegistrationStatuses(
                value.data);
        await FarmersRegistrationStatusDB()
            .insertRegistrationStatuses(data)
            .then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });

      await _repository.setupServicePost(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${PrefUtils().getToken()}'
        },
        requestData: Graphql.getallAgeGroups,
      ).then((value) async {
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<LivestockAgeGroup> data =
            LivestockAgeGroup.parseAgeGroups(value.data);
        await LivestockAgeGroupDB().insertAgeGroups(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });

      await _repository.setupServicePost(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${PrefUtils().getToken()}'
        },
        requestData: Graphql.getallBeeHiveTypes,
      ).then((value) async {
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<LivestockBeehiveType> data =
            LivestockBeehiveType.parseBeeHiveTypes(value.data);
        await LivestockBeehiveTypeDB().insertBeehiveTypes(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });

      await _repository.setupServicePost(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${PrefUtils().getToken()}'
        },
        requestData: Graphql.getallCooperativeGroups,
      ).then((value) async {
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<CooperativeGroup> data =
            CooperativeGroup.parseCooperativeGroups(value.data);
        await CooperativeGroupDB().insertCooperativeGroups(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });

      await _repository.setupServicePost(
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ${PrefUtils().getToken()}'
        },
        requestData: Graphql.getallExtensionModes,
      ).then((value) async {
        appraiser += 100;
        currentval = appraiser / full;
        currentpercentage = currentval * 100;
        final updatedState = state.copyWith(
          count: state.count + 1,
          linebarvalue: currentval,
          percentagedone: currentpercentage.toInt(),
        );
        emit(updatedState);
        List<ExtensionMode> data =
            ExtensionMode.parseExtensionModes(value.data);
        await ExtensionModeDB().insertExtensionModes(data).then((value) {
          if (value == 200) {
            appraiser += 100;
            currentval = appraiser / full;
            currentpercentage = currentval * 100;
            final updatedState = state.copyWith(
              count: state.count + 1,
              linebarvalue: currentval,
              percentagedone: currentpercentage.toInt(),
            );
            emit(updatedState);
          } else {
            print("failed");
          }
        });
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    } catch (e) {
      event.onFailed?.call();
    } finally {
      if (appraiser == full) {
        event.onSuccess?.call();
      } else {
        event.onFailed?.call();
      }
    }

// Crops

    //event.onSuccess?.call();
  }
}

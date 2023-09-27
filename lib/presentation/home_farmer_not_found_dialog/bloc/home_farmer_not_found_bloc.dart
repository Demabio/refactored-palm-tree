import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropareaunit.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropscategory.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropsystem.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropwatersource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropareaunit.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropscategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropsystem.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropwatersource.dart';
import 'package:kiamis_app/data/sqlService/dbutils.dart';
import 'package:kiamis_app/data/sqlService/graphqlqueries.dart';
import '../../../data/models/dbModels/crops/crop.dart';
import '../../../data/repository/repository.dart';
import '../../../data/sqlService/dbqueries/crops/crop.dart';
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

  Future<void> _downloadData(
    InnitDBwithDataEvent event,
    Emitter<HomeFarmerNotFoundState> emit,
  ) async {
    int full = 4400;
    int appraiser = 0;
    double currentval = 0;
    double currentpercentage = 0;
    final updatedState = state.copyWith(visibility: true);
    emit(updatedState);
    _dbUtils.deleteDatabaseIfExists(
        join(PrefUtils().getDBPath(), 'localdevice.db'));

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
  }
}

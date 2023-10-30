import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '/core/app_export.dart';
import 'package:path/path.dart';

import 'package:kiamis_app/presentation/download_setups/models/home_farmer_not_found_model.dart';
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
    final updatedState = state.copyWith(
      visibility: true,
      failed: false,
    );
    emit(updatedState);
    bool update = await downloadFarmers(emit);
    update ? event.onSuccess?.call() : event.onFailed?.call();
    return;
  }

  Future<bool> downloadFarmers(
    Emitter<HomeFarmerNotFoundState> emit,
  ) async {
    try {
      Dio dio = Dio();
      const name = 'localdevice.db';
      final path = await getDatabasesPath();
      String dbpath = join(path, name);
      String token = PrefUtils().getToken();

      Response response = await dio.download(
        'https://prudmatvisionaries.com/Gateway/FarmerRegistration/setupdownload', // Replace with the actual URL
        '$dbpath',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            // Add other headers if needed
          },
        ), // Get the local file URI to save the APK
        onReceiveProgress: (received, total) {
          if (total != -1) {
            double currentval = received / total;
            int percent = (currentval * 100).toInt();
            emit(state.copyWith(
              percentagedone: percent,
              linebarvalue: currentval,
            ));
            emit(state.copyWith(
                linebarvalue: currentval, percentagedone: percent));
            print("received: $received,total:$total");
            print((received / total * 100).toStringAsFixed(0) + '%');
          }

          // print('Received: $received out of $total');
        },
      );

      if (response.statusCode == 200) {
        print('File downloaded successfully');
        return true;
      } else {
        print('Failed to download the file');
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}

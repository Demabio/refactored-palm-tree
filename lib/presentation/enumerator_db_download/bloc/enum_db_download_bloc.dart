import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/presentation/enumerator_db_download/models/enum_db_download_model.dart';
import 'package:sqflite/sqflite.dart';
import '/core/app_export.dart';
import 'package:path/path.dart';

part 'enum_db_download_event.dart';
part 'enum_db_download_state.dart';

/// A bloc that manages the state of a HomeFarmerNotFound according to the event that is dispatched to it.
class EnumDbDownloadBloc
    extends Bloc<EnumDbDownloadEvent, EnumDbDownloadState> {
  EnumDbDownloadBloc(EnumDbDownloadState initialState) : super(initialState) {
    on<EnumDbDownloadInitialEvent>(_onInitialize);
    on<FetchGetOrdersEvent>(_addCount);
    on<InnitDBwithDataEvent>(_downloadData);
    on<InnitDBwithDataFailedEvent>(_dbDownloadFailed);
    on<InnitDBwithDataSuccessEvent>(_dbDownloadSuccess);
  }
  _onInitialize(
    EnumDbDownloadInitialEvent event,
    Emitter<EnumDbDownloadState> emit,
  ) async {}

  Future<void> _addCount(
      FetchGetOrdersEvent event, Emitter<EnumDbDownloadState> emit) async {
    final updatedState = state.copyWith(
      count: state.count + 1,
      linebarvalue: state.linebarvalue + 0.1,
      percentagedone: state.percentagedone + 10,
    );
    emit(updatedState);
  }

  Future<void> _dbDownloadFailed(InnitDBwithDataFailedEvent event,
      Emitter<EnumDbDownloadState> emit) async {
    final updatedState = state.copyWith(
      failed: true,
      success: false,
      downing: false,
    );
    emit(updatedState);
  }

  Future<void> _dbDownloadSuccess(InnitDBwithDataSuccessEvent event,
      Emitter<EnumDbDownloadState> emit) async {
    try {
      final updatedState = state.copyWith(
        failed: false,
        success: true,
        downing: false,
      );
      emit(updatedState);
    } catch (e) {
      throw (e);
    }
  }

  Future<void> _downloadData(
    InnitDBwithDataEvent event,
    Emitter<EnumDbDownloadState> emit,
  ) async {
    final updatedState = state.copyWith(
      visibility: true,
      failed: false,
      downing: true,
    );
    emit(updatedState);
    bool update = await downloadFarmers(emit);
    update ? event.onSuccess?.call() : event.onFailed?.call();
    return;
  }

  Future<bool> downloadFarmers(
    Emitter<EnumDbDownloadState> emit,
  ) async {
    try {
      final claims = JWT.decode(PrefUtils().getToken());

      Dio dio = Dio();
      String userId = claims.payload[
          'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'];
      String name = 'enumerator-$userId.db';
      final path = await getDatabasesPath();
      String dbpath = join(path, name);
      String token = PrefUtils().getToken();

      Response response = await dio.download(
        'https://prudmatvisionaries.com/Gateway/FarmerRegistration/enumeratordownload', // Replace with the actual URL
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

import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/repository/repository.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/downloadedfarmer.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import 'package:kiamis_app/presentation/update_db/models/updatedb_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';
import '/core/app_export.dart';
import 'package:path/path.dart';

part 'updatedb_event.dart';
part 'updatedb_state.dart';

/// A bloc that manages the state of a HomeFarmerNotFound according to the event that is dispatched to it.
class UpdateDBBloc extends Bloc<UpdateDBEvent, UpdateDBState> {
  UpdateDBBloc(UpdateDBState initialState) : super(initialState) {
    on<UpdateDBInitialEvent>(_onInitialize);
    on<FetchGetOrdersEvent>(_addCount);
    on<InnitDBwithDataEvent>(_downloadData);
    on<InnitDBwithDataFailedEvent>(_dbDownloadFailed);
    on<InnitDBwithDataSuccessEvent>(_dbDownloadSuccess);
  }
  _onInitialize(
    UpdateDBInitialEvent event,
    Emitter<UpdateDBState> emit,
  ) async {}

  final _repository = Repository();

  Future<void> _downloadData(
    InnitDBwithDataEvent event,
    Emitter<UpdateDBState> emit,
  ) async {
    final updatedState = state.copyWith(
      visibility: true,
      failed: false,
    );
    emit(updatedState);
    await _repository.downloadRequest(
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
    ).then((value) async {
      if (value.statusCode == 200) {
        bool downloaded = await downloadFarmers(emit);

        if (downloaded) {
          bool updated = await _updateFarmers();
          if (updated) {
            event.onSuccess?.call();
          } else {
            event.onFailed?.call();
          }
        } else {
          event.onFailed?.call();
        }
      }
    }).onError((error, stackTrace) {
      event.onFailed?.call();
      print(error.toString());
    });
  }

  Future<bool> downloadFarmers(
    Emitter<UpdateDBState> emit,
  ) async {
    try {
      final claims = JWT.decode(PrefUtils().getToken());
      print(claims.payload);
      print(claims.payload['WardId']);
      Dio dio = Dio();
      const name = 'ward.db';
      final path = await getDatabasesPath();
      String dbpath = join(path, name);
      String token = PrefUtils().getToken();

      var status = await Permission.storage.request();
      Response response = await dio.download(
        'https://prudmatvisionaries.com/Gateway/FarmerRegistration/download', // Replace with the actual URL
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

  Future<bool> _updateFarmers() async {
    try {
      FarmerDB farmerDB = FarmerDB();
      DFarmerDB dFarmerDB = DFarmerDB();
      List<Farmer> farmers = await farmerDB.fetchAll() ?? [];
      if (farmers.isNotEmpty) {
        for (Farmer farmer in farmers) {
          Farmer? farmerWard = await dFarmerDB.fetchByIDNo(farmer.idNo!);
          if (farmerWard != null) {
            farmerDB.updateRegstatus(farmerWard);
          }
        }
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> _addCount(
      FetchGetOrdersEvent event, Emitter<UpdateDBState> emit) async {
    final updatedState = state.copyWith(
      count: state.count + 1,
      linebarvalue: state.linebarvalue + 0.1,
      percentagedone: state.percentagedone + 10,
    );
    emit(updatedState);
  }

  Future<void> _dbDownloadFailed(
      InnitDBwithDataFailedEvent event, Emitter<UpdateDBState> emit) async {
    final updatedState = state.copyWith(failed: true, success: false);
    emit(updatedState);
  }

  Future<void> _dbDownloadSuccess(
      InnitDBwithDataSuccessEvent event, Emitter<UpdateDBState> emit) async {
    try {
      final updatedState = state.copyWith(failed: false, success: true);
      emit(updatedState);
    } catch (e) {
      throw (e);
    }
  }
}

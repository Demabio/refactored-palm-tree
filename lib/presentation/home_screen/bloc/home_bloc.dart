import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../../data/sqlService/dbutils.dart';
import '/core/app_export.dart';
import '../models/userprofile_item_model.dart';
import 'package:kiamis_app/presentation/home_screen/models/home_model.dart';
import 'package:path/path.dart';

part 'home_event.dart';
part 'home_state.dart';

/// A bloc that manages the state of a Home according to the event that is dispatched to it.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
    on<DBCheckEvent>(_TcheckDBExists);
  }

  DBUtils _dbutils = DBUtils();

  bool exists = false;

  List<UserprofileItemModel> fillUserprofileItemList() {
    return List.generate(6, (index) => UserprofileItemModel());
  }

  _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
        searchController: TextEditingController(),
        searchController1: TextEditingController()));
    emit(state.copyWith(
        homeModelObj: state.homeModelObj
            ?.copyWith(userprofileItemList: fillUserprofileItemList())));
    add(
      DBCheckEvent(),
    );
  }

  Future<void> _TcheckDBExists(
    DBCheckEvent event,
    Emitter<HomeState> emit,
  ) async {
    await getDatabasesPath().then((value) async {
      exists = _dbutils.doesFileExist(join(value, 'localdevice.db'));
      if (exists) {
        event.onSuccess?.call();
      } else {
        event.onError?.call();
      }
    }).onError((error, stackTrace) {
      event.onError?.call();
    });
  }
}

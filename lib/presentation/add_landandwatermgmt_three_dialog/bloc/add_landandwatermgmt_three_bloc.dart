import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/landpractice.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmlandpractices.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/financial_services.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/land_water_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/landpractice.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_three_dialog/models/add_landandwatermgmt_three_model.dart';
part 'add_landandwatermgmt_three_event.dart';
part 'add_landandwatermgmt_three_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtThree according to the event that is dispatched to it.
class AddLandandwatermgmtThreeBloc
    extends Bloc<AddLandandwatermgmtThreeEvent, AddLandandwatermgmtThreeState> {
  AddLandandwatermgmtThreeBloc(AddLandandwatermgmtThreeState initialState)
      : super(initialState) {
    on<AddLandandwatermgmtThreeInitialEvent>(_onInitialize);
    on<ChangeCheckbox>(_changeAgeGroupCB);

    on<ResetCBs>(_resetCBs);
    on<AddCBs>(_addAgeGroups);
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addLandandwatermgmtThreeModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addLandandwatermgmtThreeModelObj:
            state.addLandandwatermgmtThreeModelObj?.copyWith(
      models: newModels,
      count: state.addLandandwatermgmtThreeModelObj!.count + 1,
    )));
  }

  Future<List<CheckBoxList>> fetchLandP() async {
    List<CheckBoxList> list = [];
    FarmlandPracticeDB farmStructureDB = FarmlandPracticeDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].landPracticeName,
          id: value[i].landPracticeId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) async {
    emit(state.copyWith(
        addLandandwatermgmtThreeModelObj:
            state.addLandandwatermgmtThreeModelObj?.copyWith(
      models: await fetchLandP(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) {
    FarmerLandPracticesDB farmerFishInputDB = FarmerLandPracticesDB();
    List<FarmerLandPractice>? categs = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        if (model.isSelected) {
          categs.add(
            FarmerLandPractice(
                farmerPracticeId: 0,
                farmerId: PrefUtils().getFarmerId(),
                farmerFarmId: PrefUtils().getFarmId(),
                landPracticeId: model.id!,
                createdBy: userId,
                quantity: 0,
                dateCreated: DateTime.now()),
          );
        }
      }
      if (state.addLandandwatermgmtThreeModelObj!.lwProgress?.pageOne == 0) {
        farmerFishInputDB.insertLandPractices(categs).then((value) {
          print("inserted: $value");
        });
      } else {
        farmerFishInputDB
            .delete(PrefUtils().getFarmId())
            .then((value) => print("deleted: $value"));
        farmerFishInputDB.insertLandPractices(categs).then((value) {
          print("inserted: $value");
        });
      }

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  List<CheckBoxList> _land(
      List<CheckBoxList> feedmodelss, List<FarmerLandPractice> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerLandPractice> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.landPracticeId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  Future<List<FarmerLandPractice>?> getLandP() async {
    int id = PrefUtils().getFarmId();
    FarmerLandPracticesDB farmerLivestockAgeGroupsDB = FarmerLandPracticesDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<LWProgress?> getProgress() async {
    int id = PrefUtils().getFarmId();
    LWProgressDB pfProgressDB = LWProgressDB();
    return await pfProgressDB.fetchByFarm(id);
  }

  _onInitialize(
    AddLandandwatermgmtThreeInitialEvent event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) async {
    LWProgress pfProgress = await getProgress() ??
        LWProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    List<CheckBoxList>? landmodels = await fetchLandP();

    List<FarmerLandPractice>? land = await getLandP();
    if (land != null) {
      landmodels = _land(landmodels, land);
    }
    emit(state.copyWith(
        addLandandwatermgmtThreeModelObj:
            state.addLandandwatermgmtThreeModelObj?.copyWith(
      models: landmodels,
      lwProgress: pfProgress,
    )));
  }
}

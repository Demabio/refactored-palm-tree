import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/watersource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationwatersources.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/land_water_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/irrigation/watersource.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_four_dialog/models/add_landandwatermgmt_four_model.dart';
part 'add_landandwatermgmt_four_event.dart';
part 'add_landandwatermgmt_four_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtFour according to the event that is dispatched to it.
class AddLandandwatermgmtFourBloc
    extends Bloc<AddLandandwatermgmtFourEvent, AddLandandwatermgmtFourState> {
  AddLandandwatermgmtFourBloc(AddLandandwatermgmtFourState initialState)
      : super(initialState) {
    on<AddLandandwatermgmtFourInitialEvent>(_onInitialize);
    on<ChangeCheckbox>(_changeAgeGroupCB);

    on<ResetCBs>(_resetCBs);
    on<AddCBs>(_addAgeGroups);
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddLandandwatermgmtFourState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addLandandwatermgmtFourModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addLandandwatermgmtFourModelObj:
            state.addLandandwatermgmtFourModelObj?.copyWith(
      models: newModels,
      count: state.addLandandwatermgmtFourModelObj!.count + 1,
    )));
  }

  Future<List<CheckBoxList>> fetchWater() async {
    List<CheckBoxList> list = [];
    IrrigationWaterSourceDB farmStructureDB = IrrigationWaterSourceDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].irrigationWaterSource,
          id: value[i].irrigationWaterSourceId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddLandandwatermgmtFourState> emit,
  ) async {
    emit(state.copyWith(
        addLandandwatermgmtFourModelObj:
            state.addLandandwatermgmtFourModelObj?.copyWith(
      models: await fetchWater(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddLandandwatermgmtFourState> emit,
  ) {
    FarmerIrrigationWaterSourceDB farmerFishInputDB =
        FarmerIrrigationWaterSourceDB();
    List<FarmerIrrigationWaterSource>? categs = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        if (model.isSelected) {
          categs.add(
            FarmerIrrigationWaterSource(
                irrigationCropId: 0,
                farmerId: PrefUtils().getFarmerId(),
                irrigationWaterSourceId: model.id!,
                createdBy: userId,
                sourceName: model.title,
                dateCreated: DateTime.now()),
          );
        }
      }
      if (state.addLandandwatermgmtFourModelObj!.lwProgress?.pageOne == 0) {
        farmerFishInputDB.insertIrrigationWaterSources(categs).then((value) {
          print("inserted: $value");
        });
      } else {
        farmerFishInputDB
            .delete(PrefUtils().getFarmerId())
            .then((value) => print("deleted: $value"));
        farmerFishInputDB.insertIrrigationWaterSources(categs).then((value) {
          print("inserted: $value");
        });
      }

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  List<CheckBoxList> _water(List<CheckBoxList> feedmodelss,
      List<FarmerIrrigationWaterSource> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerIrrigationWaterSource> feeds = feedss;

    for (var ent in feeds) {
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.irrigationWaterSourceId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  Future<List<FarmerIrrigationWaterSource>?> getWater() async {
    int id = PrefUtils().getFarmerId();
    FarmerIrrigationWaterSourceDB farmerLivestockAgeGroupsDB =
        FarmerIrrigationWaterSourceDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmerId(id);
  }

  Future<LWProgress?> getProgress() async {
    int farmerid = PrefUtils().getFarmerId();
    LWProgressDB pfProgressDB = LWProgressDB();
    return await pfProgressDB.fetchByFarmerId(farmerid);
  }

  _onInitialize(
    AddLandandwatermgmtFourInitialEvent event,
    Emitter<AddLandandwatermgmtFourState> emit,
  ) async {
    LWProgress pfProgress = await getProgress() ??
        LWProgress(
          farmerId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    List<CheckBoxList>? watermodels = await fetchWater();

    List<FarmerIrrigationWaterSource>? water = await getWater();
    if (water != null) {
      watermodels = _water(watermodels, water);
    }
    emit(state.copyWith(
        addLandandwatermgmtFourModelObj:
            state.addLandandwatermgmtFourModelObj?.copyWith(
      models: watermodels,
      lwProgress: pfProgress,
    )));
  }
}

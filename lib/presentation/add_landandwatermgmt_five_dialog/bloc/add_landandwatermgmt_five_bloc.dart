import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/type.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationtypes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/land_water_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/irrigation/type.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_five_dialog/models/add_landandwatermgmt_five_model.dart';
part 'add_landandwatermgmt_five_event.dart';
part 'add_landandwatermgmt_five_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtFive according to the event that is dispatched to it.
class AddLandandwatermgmtFiveBloc
    extends Bloc<AddLandandwatermgmtFiveEvent, AddLandandwatermgmtFiveState> {
  AddLandandwatermgmtFiveBloc(AddLandandwatermgmtFiveState initialState)
      : super(initialState) {
    on<AddLandandwatermgmtFiveInitialEvent>(_onInitialize);
    on<ChangeCheckbox>(_changeAgeGroupCB);

    on<ResetCBs>(_resetCBs);
    on<AddCBs>(_addAgeGroups);
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddLandandwatermgmtFiveState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addLandandwatermgmtFiveModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addLandandwatermgmtFiveModelObj:
            state.addLandandwatermgmtFiveModelObj?.copyWith(
      models: newModels,
      count: state.addLandandwatermgmtFiveModelObj!.count + 1,
    )));
  }

  Future<List<CheckBoxList>> fetchType() async {
    List<CheckBoxList> list = [];
    IrrigationTypeDB farmStructureDB = IrrigationTypeDB();
//        createdBy: int.parse(map['created_by'] ?? "0"),

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].irrigationType,
          id: value[i].irrigationTypeId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddLandandwatermgmtFiveState> emit,
  ) async {
    emit(state.copyWith(
        addLandandwatermgmtFiveModelObj:
            state.addLandandwatermgmtFiveModelObj?.copyWith(
      models: await fetchType(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddLandandwatermgmtFiveState> emit,
  ) {
    FarmerIrrigationTypeDB farmerFishInputDB = FarmerIrrigationTypeDB();
    List<FarmerIrrigationType>? categs = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        if (model.isSelected) {
          categs.add(
            FarmerIrrigationType(
                irrigationCropId: 0,
                farmerId: PrefUtils().getFarmerId(),
                farmerFarmId: PrefUtils().getFarmId(),
                irrigationTypeId: model.id!,
                createdBy: userId,
                dateCreated: DateTime.now()),
          );
        }
      }
      if (state.addLandandwatermgmtFiveModelObj!.lwProgress?.pageOne == 0) {
        farmerFishInputDB.insertIrrigationTypes(categs).then((value) {
          print("inserted: $value");
        });
      } else {
        farmerFishInputDB
            .delete(PrefUtils().getFarmId())
            .then((value) => print("deleted: $value"));
        farmerFishInputDB.insertIrrigationTypes(categs).then((value) {
          print("inserted: $value");
        });
      }

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  List<CheckBoxList> _type(
      List<CheckBoxList> feedmodelss, List<FarmerIrrigationType> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerIrrigationType> feeds = feedss;

    for (var ent in feeds) {
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.irrigationTypeId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  Future<List<FarmerIrrigationType>?> getType() async {
    int id = PrefUtils().getFarmId();
    FarmerIrrigationTypeDB farmerLivestockAgeGroupsDB =
        FarmerIrrigationTypeDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<LWProgress?> getProgress() async {
    int farmerid = PrefUtils().getFarmId();
    LWProgressDB pfProgressDB = LWProgressDB();
    return await pfProgressDB.fetchByFarm(farmerid);
  }

  _onInitialize(
    AddLandandwatermgmtFiveInitialEvent event,
    Emitter<AddLandandwatermgmtFiveState> emit,
  ) async {
    LWProgress pfProgress = await getProgress() ??
        LWProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    List<CheckBoxList>? typemodels = await fetchType();

    List<FarmerIrrigationType>? type = await getType();
    if (type != null) {
      typemodels = _type(typemodels, type);
    }
    emit(state.copyWith(
        addLandandwatermgmtFiveModelObj:
            state.addLandandwatermgmtFiveModelObj?.copyWith(
      models: typemodels,
      lwProgress: pfProgress,
    )));
  }
}

import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/other/pesticidetype.dart';
import 'package:kiamis_app/data/models/dbModels/processes/crop_agri.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/landpractice.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/pesticide.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmlandpractices.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/pesticidetype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/crop_agri.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/land_water_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/landpractice.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/pesticide.dart';
import '../models/add_cro_pesticide_model.dart';
import '/core/app_export.dart';
part 'add_crop_pesticide_event.dart';
part 'add_crop_pesticide_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtThree according to the event that is dispatched to it.
class AddCropPesticideBloc
    extends Bloc<AddCropPesticideEvent, AddCropPesticideState> {
  AddCropPesticideBloc(AddCropPesticideState initialState)
      : super(initialState) {
    on<AddCropPesticideInitialEvent>(_onInitialize);
    on<ChangeCheckbox>(_changeAgeGroupCB);

    on<ResetCBs>(_resetCBs);
    on<AddCBs>(_addAgeGroups);
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddCropPesticideState> emit,
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

  Future<List<CheckBoxList>> fetchPest() async {
    List<CheckBoxList> list = [];
    PesticideTypeDB farmStructureDB = PesticideTypeDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].pesticideType,
          id: value[i].pesticideTypeId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddCropPesticideState> emit,
  ) async {
    emit(state.copyWith(
        addLandandwatermgmtThreeModelObj:
            state.addLandandwatermgmtThreeModelObj?.copyWith(
      models: await fetchPest(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddCropPesticideState> emit,
  ) {
    FarmerPesticidesDB farmerFishInputDB = FarmerPesticidesDB();
    List<FarmerPesticide>? categs = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        if (model.isSelected) {
          categs.add(
            FarmerPesticide(
                farmerPesticideId: 0,
                farmerCropId: PrefUtils().getCropId(),
                farmerId: PrefUtils().getFarmerId(),
                farmerFarmId: PrefUtils().getFarmId(),
                pesticideTypeId: model.id!,
                createdBy: userId,
                dateCreated: DateTime.now()),
          );
        }
      }
      if (state.addLandandwatermgmtThreeModelObj!.caProgressDB?.pageTwo == 0) {
        farmerFishInputDB.insertPesticides(categs).then((value) {
          print("inserted: $value");
        });
      } else {
        farmerFishInputDB
            .delete(PrefUtils().getFarmId())
            .then((value) => print("deleted: $value"));
        farmerFishInputDB.insertPesticides(categs).then((value) {
          print("inserted: $value");
        });
      }

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  List<CheckBoxList> _pest(
      List<CheckBoxList> feedmodelss, List<FarmerPesticide> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerPesticide> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.pesticideTypeId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  Future<List<FarmerPesticide>?> getPest() async {
    int id = PrefUtils().getCropId();
    FarmerPesticidesDB farmerFishInputDB = FarmerPesticidesDB();
    return await farmerFishInputDB.fetchByCropId(id);
  }

  Future<CAProgress?> getProgress() async {
    int cropid = PrefUtils().getCropId();
    CAProgressDB caProgressDB = CAProgressDB();
    return await caProgressDB.fetchByCropId(cropid);
  }

  _onInitialize(
    AddCropPesticideInitialEvent event,
    Emitter<AddCropPesticideState> emit,
  ) async {
    CAProgress caProgress = await getProgress() ??
        CAProgress(
          cropId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    List<CheckBoxList>? pestsmodels = await fetchPest();

    List<FarmerPesticide>? pest = await getPest();
    if (pest != null) {
      pestsmodels = _pest(pestsmodels, pest);
    }
    emit(state.copyWith(
        addLandandwatermgmtThreeModelObj:
            state.addLandandwatermgmtThreeModelObj?.copyWith(
      models: pestsmodels,
      caProgressDB: caProgress,
    )));
  }
}

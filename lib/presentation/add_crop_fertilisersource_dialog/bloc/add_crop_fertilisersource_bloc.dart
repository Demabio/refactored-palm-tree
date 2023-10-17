import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/crop_agri.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fertiliser/fertilisersource.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/landpractice.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmlandpractices.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fertiliser/fertilisersource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/crop_agri.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/land_water_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fertiliser/fertiliser_source.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/landpractice.dart';
import '../models/add_crop_fertilisersource_model.dart';
import '/core/app_export.dart';
part 'add_crop_fertilisersource_event.dart';
part 'add_crop_fertilisersource_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtThree according to the event that is dispatched to it.
class AddCropFertiliserSourceBloc
    extends Bloc<AddCropFertiliserSourceEvent, AddCropFertiliserSourceState> {
  AddCropFertiliserSourceBloc(AddCropFertiliserSourceState initialState)
      : super(initialState) {
    on<AddCropFertiliserSourceInitialEvent>(_onInitialize);
    on<ChangeCheckbox>(_changeAgeGroupCB);

    on<ResetCBs>(_resetCBs);
    on<AddCBs>(_addAgeGroups);
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddCropFertiliserSourceState> emit,
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

  Future<List<CheckBoxList>> fetchSources() async {
    List<CheckBoxList> list = [];
    FertiliserSourceDB farmStructureDB = FertiliserSourceDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value!.length; i++) {
        list.add(CheckBoxList(
          title: value[i].source,
          id: value[i].fertSourceId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddCropFertiliserSourceState> emit,
  ) async {
    emit(state.copyWith(
        addLandandwatermgmtThreeModelObj:
            state.addLandandwatermgmtThreeModelObj?.copyWith(
      models: await fetchSources(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddCropFertiliserSourceState> emit,
  ) {
    FarmerFertiliserSourcesDB farmerFishInputDB = FarmerFertiliserSourcesDB();
    List<FarmerFertiliserSource>? categs = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        if (model.isSelected) {
          categs.add(
            FarmerFertiliserSource(
                farmerFertSourceId: 0,
                farmerCropId: PrefUtils().getCropId(),
                farmerId: PrefUtils().getFarmerId(),
                farmerFarmId: PrefUtils().getFarmId(),
                fertSourceId: model.id!,
                createdBy: userId,
                dateCreated: DateTime.now()),
          );
        }
      }
      if (state.addLandandwatermgmtThreeModelObj!.caProgressDB?.pageTwo == 0) {
        farmerFishInputDB.insertFertiliserSources(categs).then((value) {
          print("inserted: $value");
        });
      } else {
        farmerFishInputDB
            .delete(PrefUtils().getFarmId())
            .then((value) => print("deleted: $value"));
        farmerFishInputDB.insertFertiliserSources(categs).then((value) {
          print("inserted: $value");
        });
      }

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  List<CheckBoxList> _sources(
      List<CheckBoxList> feedmodelss, List<FarmerFertiliserSource> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerFertiliserSource> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.fertSourceId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  Future<List<FarmerFertiliserSource>?> getLandP() async {
    int id = PrefUtils().getCropId();
    FarmerFertiliserSourcesDB farmerFishInputDB = FarmerFertiliserSourcesDB();
    return await farmerFishInputDB.fetchByCropId(id);
  }

  Future<CAProgress?> getProgress() async {
    int cropid = PrefUtils().getCropId();
    CAProgressDB caProgressDB = CAProgressDB();
    return await caProgressDB.fetchByCropId(cropid);
  }

  _onInitialize(
    AddCropFertiliserSourceInitialEvent event,
    Emitter<AddCropFertiliserSourceState> emit,
  ) async {
    CAProgress caProgress = await getProgress() ??
        CAProgress(
          cropId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    List<CheckBoxList>? landmodels = await fetchSources();

    List<FarmerFertiliserSource>? land = await getLandP();
    if (land != null) {
      landmodels = _sources(landmodels, land);
    }
    emit(state.copyWith(
        addLandandwatermgmtThreeModelObj:
            state.addLandandwatermgmtThreeModelObj?.copyWith(
      models: landmodels,
      caProgressDB: caProgress,
    )));
  }
}

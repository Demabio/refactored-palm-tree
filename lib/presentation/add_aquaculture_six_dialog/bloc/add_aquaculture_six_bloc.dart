import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/aqua_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fishcategory.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fishinput.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishinput.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductiontype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/aqua_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/fishcategory.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/fishinput.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/models/add_aquaculture_six_model.dart';
part 'add_aquaculture_six_event.dart';
part 'add_aquaculture_six_state.dart';

/// A bloc that manages the state of a AddAquacultureSix according to the event that is dispatched to it.
class AddAquacultureSixBloc
    extends Bloc<AddAquacultureSixEvent, AddAquacultureSixState> {
  AddAquacultureSixBloc(AddAquacultureSixState initialState)
      : super(initialState) {
    on<AddAquacultureSixInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckbox>(_changeAgeGroupCB);

    on<ResetCBs>(_resetCBs);
    on<AddCBs>(_addAgeGroups);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddAquacultureSixState> emit,
  ) {
    emit(state.copyWith(
      brackishvalue: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddAquacultureSixState> emit,
  ) {
    emit(state.copyWith(
      chickMarsh: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddAquacultureSixState> emit,
  ) {
    emit(state.copyWith(
      homeMadeFeedMix: event.value,
    ));
  }

  // Future<List<CheckBoxList>> fetchFeeds() async {
  //   List<CheckBoxList> list = [];
  //   FishInputDB fishProductionTypeDB = FishInputDB();

  //   await fishProductionTypeDB?.fetchAll().then((value) {
  //     for (int i = 0; i < value.length; i++) {
  //       list.add(CheckBoxList(
  //         title: value[i].fishInput,
  //         id: value[i].fishInputId,
  //       ));
  //     }
  //   });
  //   return list;
  // }
  Future<List<CheckBoxList>> fetchFeeds() async {
    List<CheckBoxList> list = [];
    FishCategoryDB fishCategoryDB = FishCategoryDB();
    TextEditingController stored = TextEditingController();

    await fishCategoryDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].fishCategory,
          id: value[i].fishCategoryId,
        ));
      }
    });
    return list;
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddAquacultureSixState> emit,
  ) {
    List<CheckBoxList> newModels = state.addAquacultureSixModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addAquacultureSixModelObj: state.addAquacultureSixModelObj?.copyWith(
      models: newModels,
      count: state.addAquacultureSixModelObj!.count + 1,
    )));
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddAquacultureSixState> emit,
  ) async {
    emit(state.copyWith(
        addAquacultureSixModelObj: state.addAquacultureSixModelObj?.copyWith(
      models: await fetchFeeds(),
      count: 0,
    )));
  }

  // Future<List<FarmerFishInput>?> getCategs() async {
  //   int id = PrefUtils().getFarmerId();
  //   FarmerFishInputDB farmerLivestockAgeGroupsDB = FarmerFishInputDB();
  //   return await farmerLivestockAgeGroupsDB.fetchAllByFarmer(id);
  // }

  Future<List<FarmerFishCategory>?> getCategs() async {
    int id = PrefUtils().getFarmerId();
    FarmerFishCategoryDB farmerLivestockAgeGroupsDB = FarmerFishCategoryDB();
    return await farmerLivestockAgeGroupsDB.fetchAllByfarmer(id);
  }

  List<CheckBoxList> _types(
      List<CheckBoxList> feedmodelss, List<FarmerFishCategory> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerFishCategory> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.fishCategoryId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  // _addAgeGroups(
  //   AddCBs event,
  //   Emitter<AddAquacultureSixState> emit,
  // ) {
  //   FarmerFishInputDB farmerFishInputDB = FarmerFishInputDB();
  //   List<FarmerFishInput>? categs = [];
  //   final claims = JWT.decode(PrefUtils().getToken());
  //   int userId = int.parse(claims.payload['nameidentifier']);

  //   try {
  //     for (CheckBoxList model in event.models) {
  //       if (model.isSelected) {
  //         categs.add(
  //           FarmerFishInput(
  //               farmerFishInputId: 0,
  //               farmerId: PrefUtils().getFarmerId(),
  //               farmerFarmId: PrefUtils().getFarmId(),
  //               fishInputId: model.id!,
  //               createdBy: userId,
  //               dateCreated: DateTime.now()),
  //         );
  //       }
  //     }
  //     if (state.addAquacultureSixModelObj!.aqProgress?.pageTwo == 0) {
  //       farmerFishInputDB.insertFishInputs(categs).then((value) {
  //         print("inserted: $value");
  //       });
  //     } else {
  //       farmerFishInputDB
  //           .delete(PrefUtils().getFarmerId())
  //           .then((value) => print("deleted: $value"));
  //       farmerFishInputDB.insertFishInputs(categs).then((value) {
  //         print("inserted: $value");
  //       });
  //     }

  //     event.createSuccessful?.call();
  //   } catch (e) {
  //     event.createFailed!.call();
  //   }
  // }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddAquacultureSixState> emit,
  ) {
    FarmerFishCategoryDB farmerFishCategoryDB = FarmerFishCategoryDB();
    List<FarmerFishCategory>? categs = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        if (model.isSelected) {
          categs.add(
            FarmerFishCategory(
                farmerFishCategoryId: 0,
                farmerId: PrefUtils().getFarmerId(),
                farmerFarmId: PrefUtils().getFarmId(),
                fishCategoryId: model.id!,
                createdBy: userId,
                dateCreated: DateTime.now()),
          );
        }
      }
      if (state.addAquacultureSixModelObj!.aqProgress?.pageTwo == 0) {
        farmerFishCategoryDB.insertFishCategories(categs).then((value) {
          print("inserted: $value");
        });
      } else {
        farmerFishCategoryDB
            .delete(PrefUtils().getFarmerId())
            .then((value) => print("deleted: $value"));
        farmerFishCategoryDB.insertFishCategories(categs).then((value) {
          print("inserted: $value");
        });
      }

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  Future<AQProgress?> getProgress() async {
    int farmerid = PrefUtils().getFarmerId();
    AQProgressDB pfProgressDB = AQProgressDB();
    return await pfProgressDB.fetchByFarmerId(farmerid);
  }

  _onInitialize(
    AddAquacultureSixInitialEvent event,
    Emitter<AddAquacultureSixState> emit,
  ) async {
    List<CheckBoxList>? atypes = await fetchFeeds();

    AQProgress pfProgress = await getProgress() ??
        AQProgress(
          fishId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    if (pfProgress.pageOne == 1) {
      // List<FarmerFishInput>? categs = await getCategs();

      List<FarmerFishCategory>? categs = await getCategs();
      atypes = _types(atypes, categs!);
    }
    emit(state.copyWith(
        addAquacultureSixModelObj: state.addAquacultureSixModelObj?.copyWith(
      models: atypes,
    )));
  }
}

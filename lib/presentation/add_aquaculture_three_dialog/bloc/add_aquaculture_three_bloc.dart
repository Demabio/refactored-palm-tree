import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/aqua_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fishcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/aqua_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/fishcategory.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_aquaculture_three_dialog/models/add_aquaculture_three_model.dart';
part 'add_aquaculture_three_event.dart';
part 'add_aquaculture_three_state.dart';

/// A bloc that manages the state of a AddAquacultureThree according to the event that is dispatched to it.
class AddAquacultureThreeBloc
    extends Bloc<AddAquacultureThreeEvent, AddAquacultureThreeState> {
  AddAquacultureThreeBloc(AddAquacultureThreeState initialState)
      : super(initialState) {
    on<AddAquacultureThreeInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckbox>(_changeAgeGroupCB);

    on<ResetCBs>(_resetCBs);
    on<AddCBs>(_addAgeGroups);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddAquacultureThreeState> emit,
  ) {
    emit(state.copyWith(
      brackishvalue: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddAquacultureThreeState> emit,
  ) {
    emit(state.copyWith(
      chickMarsh: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddAquacultureThreeState> emit,
  ) {
    emit(state.copyWith(
      homeMadeFeedMix: event.value,
    ));
  }

  Future<List<CheckBoxList>> fetchFeeds() async {
    List<CheckBoxList> list = [];
    FishCategoryDB fishCategoryDB = FishCategoryDB();
    await fishCategoryDB.fetchAll().then((value) {
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
    Emitter<AddAquacultureThreeState> emit,
  ) {
    List<CheckBoxList> newModels = state.addAquacultureThreeModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addAquacultureThreeModelObj:
            state.addAquacultureThreeModelObj?.copyWith(
      models: newModels,
      count: state.addAquacultureThreeModelObj!.count + 1,
    )));
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddAquacultureThreeState> emit,
  ) async {
    emit(state.copyWith(
        addAquacultureThreeModelObj:
            state.addAquacultureThreeModelObj?.copyWith(
      models: await fetchFeeds(),
      count: 0,
    )));
  }

  Future<List<FarmerFishCategory>?> getCategs() async {
    int id = PrefUtils().getFarmId();
    FarmerFishCategoryDB farmerLivestockAgeGroupsDB = FarmerFishCategoryDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
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

  _addAgeGroups(
    AddCBs event,
    Emitter<AddAquacultureThreeState> emit,
  ) {
    FarmerFishCategoryDB farmerFishCategoryDB = FarmerFishCategoryDB();
    List<FarmerFishCategory>? categs = [];
    List<FarmerFishCategory>? notit = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        notit.add(
          FarmerFishCategory(
              farmerFishCategoryId: 0,
              farmerId: PrefUtils().getFarmerId(),
              farmerFarmId: PrefUtils().getFarmId(),
              fishCategoryId: model.id!,
              createdBy: userId,
              dateCreated: DateTime.now()),
        );
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
      if (state.addAquacultureThreeModelObj!.aqProgress?.pageOne == 0) {
        farmerFishCategoryDB.insertFishCategories(notit).then((value) {
          print("inserted: $value");
        });
      }

      farmerFishCategoryDB
          .delete(PrefUtils().getFarmId())
          .then((value) => print("deleted: $value"));

      farmerFishCategoryDB.reinsertFishCategories(categs).then((value) {
        print("inserted: $value");
      });

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  Future<AQProgress?> getProgress() async {
    int id = PrefUtils().getFarmId();
    AQProgressDB pfProgressDB = AQProgressDB();
    return await pfProgressDB.fetchByFarmId(id);
  }

  _onInitialize(
    AddAquacultureThreeInitialEvent event,
    Emitter<AddAquacultureThreeState> emit,
  ) async {
    List<CheckBoxList>? atypes = await fetchFeeds();

    AQProgress pfProgress = await getProgress() ??
        AQProgress(
          farmId: PrefUtils().getFarmId(),
          pageOne: 0,
          pageTwo: 0,
        );
    if (pfProgress.pageOne == 1) {
      List<FarmerFishCategory>? categs = await getCategs();
      atypes = _types(atypes, categs!);
    }
    emit(state.copyWith(
        addAquacultureThreeModelObj:
            state.addAquacultureThreeModelObj?.copyWith(
      models: atypes,
      aqProgress: pfProgress,
    )));
  }
}

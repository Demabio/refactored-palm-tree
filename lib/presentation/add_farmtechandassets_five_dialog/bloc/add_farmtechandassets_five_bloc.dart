import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/assets_tech_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/laboursource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/laboursource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/assets_tech_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/laboursource.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_five_dialog/models/add_farmtechandassets_five_model.dart';
import '/core/app_export.dart';
part 'add_farmtechandassets_five_event.dart';
part 'add_farmtechandassets_five_state.dart';

/// A bloc that manages the state of a AddFarmtechandassetsFive according to the event that is dispatched to it.
class AddFarmtechandassetsFiveBloc
    extends Bloc<AddFarmtechandassetsFiveEvent, AddFarmtechandassetsFiveState> {
  AddFarmtechandassetsFiveBloc(AddFarmtechandassetsFiveState initialState)
      : super(initialState) {
    on<AddFarmtechandassetsFiveInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckBox3Event>(_changeCheckBox3);
    on<ChangeCheckBox4Event>(_changeCheckBox4);
    on<ChangeCheckBox5Event>(_changeCheckBox5);
    on<ChangeCheckBox6Event>(_changeCheckBox6);
    on<ChangeCheckbox>(_changeAgeGroupCB);

    on<ResetCBs>(_resetCBs);
    on<AddCBs>(_addAgeGroups);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddFarmtechandassetsFiveState> emit,
  ) {
    emit(state.copyWith(
      animalDraft: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddFarmtechandassetsFiveState> emit,
  ) {
    emit(state.copyWith(
      gridElectricity: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddFarmtechandassetsFiveState> emit,
  ) {
    emit(state.copyWith(
      manualvalue: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddFarmtechandassetsFiveState> emit,
  ) {
    emit(state.copyWith(
      trash: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddFarmtechandassetsFiveState> emit,
  ) {
    emit(state.copyWith(
      othervalue: event.value,
    ));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<AddFarmtechandassetsFiveState> emit,
  ) {
    emit(state.copyWith(
      solarvalue: event.value,
    ));
  }

  _changeCheckBox6(
    ChangeCheckBox6Event event,
    Emitter<AddFarmtechandassetsFiveState> emit,
  ) {
    emit(state.copyWith(
      windvalue: event.value,
    ));
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddFarmtechandassetsFiveState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addFarmtechandassetsFiveModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addFarmtechandassetsFiveModelObj:
            state.addFarmtechandassetsFiveModelObj?.copyWith(
      models: newModels,
      count: state.addFarmtechandassetsFiveModelObj!.count + 1,
    )));
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddFarmtechandassetsFiveState> emit,
  ) async {
    emit(state.copyWith(
        addFarmtechandassetsFiveModelObj:
            state.addFarmtechandassetsFiveModelObj?.copyWith(
      models: await fetchLabourSources(),
      count: 0,
    )));
  }

  List<CheckBoxList> _sources(
      List<CheckBoxList> feedmodelss, List<FarmerLabourSource> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerLabourSource> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.labourSourceId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddFarmtechandassetsFiveState> emit,
  ) {
    FarmerLabourSourceDB farmerFishInputDB = FarmerLabourSourceDB();
    List<FarmerLabourSource>? categs = [];

    List<FarmerLabourSource>? notit = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        notit.add(
          FarmerLabourSource(
              farmLabourSourceId: 0,
              farmerId: PrefUtils().getFarmerId(),
              farmerFarmId: PrefUtils().getFarmId(),
              labourSourceId: model.id!,
              createdBy: userId,
              dateCreated: DateTime.now()),
        );
        if (model.isSelected) {
          categs.add(
            FarmerLabourSource(
                farmLabourSourceId: 0,
                farmerId: PrefUtils().getFarmerId(),
                farmerFarmId: PrefUtils().getFarmId(),
                labourSourceId: model.id!,
                createdBy: userId,
                dateCreated: DateTime.now()),
          );
        }
      }
      if (state.addFarmtechandassetsFiveModelObj!.categs!.isEmpty) {
        farmerFishInputDB.insertLabourSources(notit).then((value) {
          print("inserted: $value");
        });
      }
      farmerFishInputDB
          .delete(PrefUtils().getFarmId())
          .then((value) => print("deleted: $value"));

      farmerFishInputDB.reinsertLabourSources(categs).then((value) {
        print("inserted: $value");
      });

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  Future<List<FarmerLabourSource>?> getSources() async {
    int id = PrefUtils().getFarmId();
    FarmerLabourSourceDB farmerLivestockAgeGroupsDB = FarmerLabourSourceDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<List<FarmerLabourSource>?> getallSources() async {
    int id = PrefUtils().getFarmId();
    FarmerLabourSourceDB farmerLivestockAgeGroupsDB = FarmerLabourSourceDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmAll(id);
  }

  Future<List<CheckBoxList>> fetchLabourSources() async {
    List<CheckBoxList> list = [];
    LabourSourceDB labourSourceDB = LabourSourceDB();

    await labourSourceDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].labourSource,
          id: value[i].labourSourceId,
        ));
      }
    });
    return list;
  }

  Future<ATProgress?> getProgress() async {
    int farmerid = PrefUtils().getFarmId();
    ATProgressDB pfProgressDB = ATProgressDB();
    return await pfProgressDB.fetchByFarm(farmerid);
  }

  _onInitialize(
    AddFarmtechandassetsFiveInitialEvent event,
    Emitter<AddFarmtechandassetsFiveState> emit,
  ) async {
    ATProgress pfProgress = await getProgress() ??
        ATProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );

    List<CheckBoxList>? atypes = await fetchLabourSources();

    List<FarmerLabourSource>? categs = await getSources() ?? [];
    List<FarmerLabourSource>? allcategs = await getallSources() ?? [];
    atypes = categs.isNotEmpty ? _sources(atypes, categs) : atypes;

    emit(state.copyWith(
        addFarmtechandassetsFiveModelObj:
            state.addFarmtechandassetsFiveModelObj?.copyWith(
      models: atypes,
      categs: allcategs,
      atProgress: pfProgress,
    )));
  }
}

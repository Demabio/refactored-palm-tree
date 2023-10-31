import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/assets_tech_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/powersource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmpowersource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/assets_tech_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/powersource.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_two_dialog/models/add_farmtechandassets_two_model.dart';
part 'add_farmtechandassets_two_event.dart';
part 'add_farmtechandassets_two_state.dart';

/// A bloc that manages the state of a AddFarmtechandassetsTwo according to the event that is dispatched to it.
class AddFarmtechandassetsTwoBloc
    extends Bloc<AddFarmtechandassetsTwoEvent, AddFarmtechandassetsTwoState> {
  AddFarmtechandassetsTwoBloc(AddFarmtechandassetsTwoState initialState)
      : super(initialState) {
    on<AddFarmtechandassetsTwoInitialEvent>(_onInitialize);
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
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      animalDraft: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      gridElectricity: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      manualvalue: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      trash: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      othervalue: event.value,
    ));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      solarvalue: event.value,
    ));
  }

  _changeCheckBox6(
    ChangeCheckBox6Event event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      windvalue: event.value,
    ));
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addFarmtechandassetsTwoModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addFarmtechandassetsTwoModelObj:
            state.addFarmtechandassetsTwoModelObj?.copyWith(
      models: newModels,
      count: state.addFarmtechandassetsTwoModelObj!.count + 1,
    )));
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) async {
    emit(state.copyWith(
        addFarmtechandassetsTwoModelObj:
            state.addFarmtechandassetsTwoModelObj?.copyWith(
      models: await fetchPowerSources(),
      count: 0,
    )));
  }

  List<CheckBoxList> _sources(
      List<CheckBoxList> feedmodelss, List<FarmerPowerSource> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerPowerSource> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.powerSourceId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    FarmerPowerSourceDB farmerFishInputDB = FarmerPowerSourceDB();
    List<FarmerPowerSource>? categs = [];

    List<FarmerPowerSource>? notit = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        notit.add(
          FarmerPowerSource(
              farmPowerSourceId: 0,
              farmerId: PrefUtils().getFarmerId(),
              farmerFarmId: PrefUtils().getFarmId(),
              powerSourceId: model.id!,
              othersName: model.title,
              createdBy: userId,
              dateCreated: DateTime.now()),
        );
        if (model.isSelected) {
          categs.add(
            FarmerPowerSource(
                farmPowerSourceId: 0,
                farmerId: PrefUtils().getFarmerId(),
                farmerFarmId: PrefUtils().getFarmId(),
                powerSourceId: model.id!,
                othersName: model.title,
                createdBy: userId,
                dateCreated: DateTime.now()),
          );
        }
      }
      if (state.addFarmtechandassetsTwoModelObj!.categs!.isEmpty) {
        farmerFishInputDB.insertPowerSources(notit).then((value) {
          print("inserted: $value");
        });
      }
      farmerFishInputDB
          .delete(PrefUtils().getFarmId())
          .then((value) => print("deleted: $value"));

      farmerFishInputDB.reinsertPowerSources(categs).then((value) {
        print("inserted: $value");
      });

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  Future<List<FarmerPowerSource>?> getSources() async {
    int id = PrefUtils().getFarmId();
    FarmerPowerSourceDB farmerLivestockAgeGroupsDB = FarmerPowerSourceDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<List<CheckBoxList>> fetchPowerSources() async {
    List<CheckBoxList> list = [];
    FarmPowerSourceDB powerSourceDB = FarmPowerSourceDB();

    await powerSourceDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].powerSource,
          id: value[i].powerSourceId,
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
    AddFarmtechandassetsTwoInitialEvent event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) async {
    ATProgress pfProgress = await getProgress() ??
        ATProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );

    List<CheckBoxList>? atypes = await fetchPowerSources();

    List<FarmerPowerSource>? categs = await getSources() ?? [];
    atypes = categs.isNotEmpty ? _sources(atypes, categs) : atypes;

    emit(state.copyWith(
        addFarmtechandassetsTwoModelObj:
            state.addFarmtechandassetsTwoModelObj?.copyWith(
      models: atypes,
      categs: categs,
      atProgress: pfProgress,
    )));
  }
}

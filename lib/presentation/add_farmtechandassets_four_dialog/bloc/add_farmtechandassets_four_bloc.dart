import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/assets_tech_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/farmstructure.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmstructures.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/assets_tech_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/structure.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_four_dialog/models/add_farmtechandassets_four_model.dart';
part 'add_farmtechandassets_four_event.dart';
part 'add_farmtechandassets_four_state.dart';

/// A bloc that manages the state of a AddFarmtechandassetsFour according to the event that is dispatched to it.
class AddFarmtechandassetsFourBloc
    extends Bloc<AddFarmtechandassetsFourEvent, AddFarmtechandassetsFourState> {
  AddFarmtechandassetsFourBloc(AddFarmtechandassetsFourState initialState)
      : super(initialState) {
    on<AddFarmtechandassetsFourInitialEvent>(_onInitialize);

    on<ChangeCheckBox13Event>(_changeCheckBox13);
    on<ChangeCheckbox>(_changeAgeGroupCB);

    on<ResetCBs>(_resetCBs);
    on<AddCBs>(_addAgeGroups);
  }

  _changeCheckBox13(
    ChangeCheckBox13Event event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    emit(state.copyWith(
      traditionalGran: event.value,
    ));
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addFarmtechandassetsFourModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addFarmtechandassetsFourModelObj:
            state.addFarmtechandassetsFourModelObj?.copyWith(
      models: newModels,
      count: state.addFarmtechandassetsFourModelObj!.count + 1,
    )));
  }

  Future<List<CheckBoxList>> fetchFarmStructure() async {
    List<CheckBoxList> list = [];
    FarmStructureDB farmStructureDB = FarmStructureDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].structureName,
          id: value[i].farmStructureId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) async {
    emit(state.copyWith(
        addFarmtechandassetsFourModelObj:
            state.addFarmtechandassetsFourModelObj?.copyWith(
      models: await fetchFarmStructure(),
      count: 0,
    )));
  }

  List<CheckBoxList> _structs(
      List<CheckBoxList> feedmodelss, List<FarmerStructure> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerStructure> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.farmStructureId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    FarmerStructureDB farmerFishInputDB = FarmerStructureDB();
    List<FarmerStructure>? categs = [];
    List<FarmerStructure>? notit = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        notit.add(
          FarmerStructure(
              farmerAssetId: 0,
              farmerId: PrefUtils().getFarmerId(),
              farmerFarmId: PrefUtils().getFarmId(),
              farmStructureId: model.id!,
              createdBy: userId,
              dateCreated: DateTime.now()),
        );
        if (model.isSelected) {
          categs.add(
            FarmerStructure(
                farmerAssetId: 0,
                farmerId: PrefUtils().getFarmerId(),
                farmerFarmId: PrefUtils().getFarmId(),
                farmStructureId: model.id!,
                createdBy: userId,
                dateCreated: DateTime.now()),
          );
        }
      }
      if (state.addFarmtechandassetsFourModelObj!.categs!.isEmpty) {
        farmerFishInputDB.insertStructures(notit).then((value) {
          print("inserted: $value");
        });
      }
      farmerFishInputDB
          .delete(PrefUtils().getFarmId())
          .then((value) => print("deleted: $value"));

      farmerFishInputDB.reinsertStructures(categs).then((value) {
        print("inserted: $value");
      });

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  Future<List<FarmerStructure>?> getStructs() async {
    int id = PrefUtils().getFarmId();
    FarmerStructureDB farmerLivestockAgeGroupsDB = FarmerStructureDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<ATProgress?> getProgress() async {
    int id = PrefUtils().getFarmId();
    ATProgressDB pfProgressDB = ATProgressDB();
    return await pfProgressDB.fetchByFarm(id);
  }

  _onInitialize(
    AddFarmtechandassetsFourInitialEvent event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) async {
    ATProgress pfProgress = await getProgress() ??
        ATProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );

    List<CheckBoxList>? atypes = await fetchFarmStructure();

    List<FarmerStructure>? categs = await getStructs() ?? [];
    atypes = categs.isNotEmpty ? _structs(atypes, categs) : atypes;

    emit(state.copyWith(
        addFarmtechandassetsFourModelObj:
            state.addFarmtechandassetsFourModelObj?.copyWith(
      models: atypes,
      atProgress: pfProgress,
      categs: categs,
    )));
  }
}

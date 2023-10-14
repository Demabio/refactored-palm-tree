import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/extensionmode.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/extensionmodes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/extensionsources.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/financial_services.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/extensionmode.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_eight_dialog/models/add_financialandservices_eight_model.dart';
part 'add_financialandservices_eight_event.dart';
part 'add_financialandservices_eight_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesEight according to the event that is dispatched to it.
class AddFinancialandservicesEightBloc extends Bloc<
    AddFinancialandservicesEightEvent, AddFinancialandservicesEightState> {
  AddFinancialandservicesEightBloc(
      AddFinancialandservicesEightState initialState)
      : super(initialState) {
    on<AddFinancialandservicesEightInitialEvent>(_onInitialize);
    on<ChangeCheckbox>(_changeAgeGroupCB);
    on<ResetCBs>(_resetCBs);

    on<AddCBs>(_addAgeGroups);
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addFinancialandservicesEightModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addFinancialandservicesEightModelObj:
            state.addFinancialandservicesEightModelObj?.copyWith(
      models: newModels,
      count: state.addFinancialandservicesEightModelObj!.count + 1,
    )));
  }

  Future<List<CheckBoxList>> fetchEAccess() async {
    List<CheckBoxList> list = [];
    ExtensionModeDB farmStructureDB = ExtensionModeDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].sourceMode,
          id: value[i].extensionModeId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) async {
    emit(state.copyWith(
        addFinancialandservicesEightModelObj:
            state.addFinancialandservicesEightModelObj?.copyWith(
      models: await fetchEAccess(),
      count: 0,
    )));
  }

  List<CheckBoxList> _modes(
      List<CheckBoxList> feedmodelss, List<FarmerExtensionMode> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerExtensionMode> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.extensionModeId);

      feedmodels[index].isSelected = true;
    }
    return feedmodels;
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) {
    FarmerExtensionModeDB farmerFishInputDB = FarmerExtensionModeDB();
    List<FarmerExtensionMode>? categs = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        if (model.isSelected) {
          categs.add(
            FarmerExtensionMode(
                farmerExtensionModeId: 0,
                farmerId: PrefUtils().getFarmerId(),
                farmerFarmId: PrefUtils().getFarmId(),
                extensionModeId: model.id!,
                createdBy: userId,
                dateCreated: DateTime.now()),
          );
        }
      }
      if (state.addFinancialandservicesEightModelObj!.fsProgress?.pageTwo ==
          0) {
        farmerFishInputDB.insertExtensionModes(categs).then((value) {
          print("inserted: $value");
        });
      } else {
        farmerFishInputDB
            .delete(PrefUtils().getFarmerId())
            .then((value) => print("deleted: $value"));
        farmerFishInputDB.insertExtensionModes(categs).then((value) {
          print("inserted: $value");
        });
      }

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  Future<List<FarmerExtensionMode>?> getModes() async {
    int id = PrefUtils().getFarmerId();
    FarmerExtensionModeDB farmerLivestockAgeGroupsDB = FarmerExtensionModeDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmerId(id);
  }

  Future<FSProgress?> getProgress() async {
    int farmerid = PrefUtils().getFarmerId();
    FSProgressDB pfProgressDB = FSProgressDB();
    return await pfProgressDB.fetchByFarmerId(farmerid);
  }

  _onInitialize(
    AddFinancialandservicesEightInitialEvent event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) async {
    FSProgress pfProgress = await getProgress() ??
        FSProgress(
          farmerId: 0,
          pageOne: 0,
          pageTwo: 0,
        );

    List<CheckBoxList>? modemodels = await fetchEAccess();

    //  if (pfProgress.pageTwo == 1) {
    List<FarmerExtensionMode>? mode = await getModes();
    modemodels =
        mode != null ? modemodels = _modes(modemodels, mode) : modemodels;

    /// }
    emit(state.copyWith(
        addFinancialandservicesEightModelObj:
            state.addFinancialandservicesEightModelObj?.copyWith(
      models: modemodels,
    )));
  }
}

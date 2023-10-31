import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/agency.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationagencies.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/land_water_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/irrigation/agency.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_seven_dialog/models/add_landandwatermgmt_seven_model.dart';
part 'add_landandwatermgmt_seven_event.dart';
part 'add_landandwatermgmt_seven_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtSeven according to the event that is dispatched to it.
class AddLandandwatermgmtSevenBloc
    extends Bloc<AddLandandwatermgmtSevenEvent, AddLandandwatermgmtSevenState> {
  AddLandandwatermgmtSevenBloc(AddLandandwatermgmtSevenState initialState)
      : super(initialState) {
    on<AddLandandwatermgmtSevenInitialEvent>(_onInitialize);
    on<ChangeCheckbox>(_changeAgeGroupCB);

    on<ResetCBs>(_resetCBs);
    on<AddCBs>(_addAgeGroups);
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddLandandwatermgmtSevenState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addLandandwatermgmtSevenModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addLandandwatermgmtSevenModelObj:
            state.addLandandwatermgmtSevenModelObj?.copyWith(
      models: newModels,
      count: state.addLandandwatermgmtSevenModelObj!.count + 1,
    )));
  }

  Future<List<CheckBoxList>> fetchAgency() async {
    List<CheckBoxList> list = [];
    IrrigationAgencyDB farmStructureDB = IrrigationAgencyDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].agencyName,
          id: value[i].irrigationAgencyId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddLandandwatermgmtSevenState> emit,
  ) async {
    emit(state.copyWith(
        addLandandwatermgmtSevenModelObj:
            state.addLandandwatermgmtSevenModelObj?.copyWith(
      models: await fetchAgency(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddLandandwatermgmtSevenState> emit,
  ) {
    FarmerIrrigationAgencyDB farmerFishInputDB = FarmerIrrigationAgencyDB();
    List<FarmerIrrigationAgency>? categs = [];
    List<FarmerIrrigationAgency>? notit = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        notit.add(
          FarmerIrrigationAgency(
              irrigationCropId: 0,
              farmerFarmId: PrefUtils().getFarmId(),
              farmerId: PrefUtils().getFarmerId(),
              irrigationAgencyId: model.id!,
              createdBy: userId,
              agencyName: model.title,
              dateCreated: DateTime.now()),
        );
        if (model.isSelected) {
          categs.add(
            FarmerIrrigationAgency(
                irrigationCropId: 0,
                farmerFarmId: PrefUtils().getFarmId(),
                farmerId: PrefUtils().getFarmerId(),
                irrigationAgencyId: model.id!,
                createdBy: userId,
                agencyName: model.title,
                dateCreated: DateTime.now()),
          );
        }
      }
      if (state.addLandandwatermgmtSevenModelObj!.lwProgress?.pageOne == 0) {
        farmerFishInputDB.insertIrrigationAgencies(notit).then((value) {
          print("inserted: $value");
        });
      } else {
        farmerFishInputDB
            .delete(PrefUtils().getFarmId())
            .then((value) => print("deleted: $value"));
        farmerFishInputDB.reinsertIrrigationAgencies(categs).then((value) {
          print("inserted: $value");
        });
      }

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  List<CheckBoxList> _agency(
      List<CheckBoxList> feedmodelss, List<FarmerIrrigationAgency> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerIrrigationAgency> feeds = feedss;

    for (var ent in feeds) {
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.irrigationAgencyId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  Future<List<FarmerIrrigationAgency>?> getAgency() async {
    int id = PrefUtils().getFarmId();
    FarmerIrrigationAgencyDB farmerLivestockAgeGroupsDB =
        FarmerIrrigationAgencyDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<LWProgress?> getProgress() async {
    int id = PrefUtils().getFarmId();
    LWProgressDB pfProgressDB = LWProgressDB();
    return await pfProgressDB.fetchByFarm(id);
  }

  _onInitialize(
    AddLandandwatermgmtSevenInitialEvent event,
    Emitter<AddLandandwatermgmtSevenState> emit,
  ) async {
    LWProgress pfProgress = await getProgress() ??
        LWProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    List<CheckBoxList>? agmodels = await fetchAgency();

    List<FarmerIrrigationAgency>? ag = await getAgency();
    if (ag != null) {
      agmodels = _agency(agmodels, ag);
    }
    emit(state.copyWith(
        addLandandwatermgmtSevenModelObj:
            state.addLandandwatermgmtSevenModelObj?.copyWith(
      models: agmodels,
      lwProgress: pfProgress,
    )));
  }
}

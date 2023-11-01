import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/livestock_progress.dart';
import 'package:kiamis_app/data/models/dbModels/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestock.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestockservice.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/livestock_input.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/livestock_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farm.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/livestock.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/livestockservices.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/livestock_two_page/models/livestock_two_model.dart';
part 'livestock_two_event.dart';
part 'livestock_two_state.dart';

/// A bloc that manages the state of a LivestockTwo according to the event that is dispatched to it.
class LivestockTwoBloc extends Bloc<LivestockTwoEvent, LivestockTwoState> {
  LivestockTwoBloc(LivestockTwoState initialState) : super(initialState) {
    on<LivestockTwoInitialEvent>(_onInitialize);
  }
  Future<LSProgress?> getLSProgress(int? id) async {
    //int id = PrefUtils().getFarmId();
    LSProgressDB pfProgressDB = LSProgressDB();
    return id != null ? await pfProgressDB.fetchByLivestock(id) : null;
  }

  Future<FarmerLivestockService?> getFarmLS() async {
    int farmid = PrefUtils().getFarmId();
    FarmerLivestockServicesDB farmDB = FarmerLivestockServicesDB();
    return await farmDB.fetchByFarm(farmid);
  }

  Future<FarmerFarm?> getFarm() async {
    int id = PrefUtils().getFarmId();
    FarmerFarmDB farmerFishProductionLevelsDB = FarmerFarmDB();
    return await farmerFishProductionLevelsDB.fetchByFarmerFarmId(id);
  }

  Future<List<FarmerLivestock>?> getLuvestocks() async {
    int id = PrefUtils().getFarmId();
    FarmerLivestockDB farmerFishProductionLevelsDB = FarmerLivestockDB();
    return await farmerFishProductionLevelsDB.fetchByFarm(id);
  }

  Future<PFProgress?> getLSIProgress() async {
    int id = PrefUtils().getFarmId();
    LSIProgressDB pfProgressDB = LSIProgressDB();
    return await pfProgressDB.fetchByFarmId(id);
  }

  _onInitialize(
    LivestockTwoInitialEvent event,
    Emitter<LivestockTwoState> emit,
  ) async {
    FarmerFarm farm = await getFarm() ??
        FarmerFarm(
          farmerId: 0,
          farmerFarmId: 0,
          cropProd: false,
          livestockProd: false,
          fishFarming: false,
        );

    List<FarmerLivestock>? livestock = await getLuvestocks();

    int? livestockid =
        livestock != null ? livestock.last.farmerLivestockId : null;

    LSProgress lsProgress = await getLSProgress(livestockid) ??
        LSProgress(
          livestockId: 0,
          pageOne: 0,
          pageTwo: 0,
        );

    PFProgress lsiProgress = await getLSIProgress() ??
        PFProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    FarmerLivestockService farmerLivestockService = await getFarmLS() ??
        FarmerLivestockService(
          farmerLivestockServicesId: 0,
          farmerId: 0,
          farmerFarmId: 0,
          fertilizerForFodder: false,
          fertilizerSeeds: false,
          fodderSeeds: false,
          aiUse: 0,
          embryoTransfer: false,
          hormoneUse: 0,
          routineVaccination: false,
          curativeMeasures: false,
        );
    emit(state.copyWith(
        next: farm.fishFarming,
        prev: farm.cropProd,
        done: lsProgress.pageOne == 1 && lsiProgress.pageOne == 1,
        livestockTwoModelObj: state.livestockTwoModelObj?.copyWith(
          livestockins: farmerLivestockService,
        )));
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestockservice.dart';
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

  Future<FarmerLivestockService?> getFarm() async {
    int farmid = PrefUtils().getFarmerId();
    FarmerLivestockServicesDB farmDB = FarmerLivestockServicesDB();
    return await farmDB.fetchByFarmer(farmid);
  }

  _onInitialize(
    LivestockTwoInitialEvent event,
    Emitter<LivestockTwoState> emit,
  ) async {
    FarmerLivestockService farmerLivestockService = await getFarm() ??
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
        livestockTwoModelObj: state.livestockTwoModelObj?.copyWith(
      livestockins: farmerLivestockService,
    )));
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/process_status.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/process_status.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/farmer_registration_screen/models/farmer_registration_model.dart';
part 'farmer_registration_event.dart';
part 'farmer_registration_state.dart';

/// A bloc that manages the state of a FarmerRegistration according to the event that is dispatched to it.
class FarmerRegistrationBloc
    extends Bloc<FarmerRegistrationEvent, FarmerRegistrationState> {
  FarmerRegistrationBloc(FarmerRegistrationState initialState)
      : super(initialState) {
    on<FarmerRegistrationInitialEvent>(_onInitialize);
    on<StepDownEvent>(_onSteppedDown);
    on<OnSteppedEvent>(_onStepped);
    on<StepUpEvent>(_onSteppedUp);
  }

  ProcessStatus getRegProgress() {
    if (PrefUtils().getAddorEdit()) {
      int farmerid = PrefUtils().getFarmerId();
      if (farmerid != 0) {
        ProcessStatusDB processStatusDB = ProcessStatusDB();
        processStatusDB.fetchByFarmerId(farmerid).then((value) {
          return ProcessStatus(
            farmerId: value.farmerId,
            farmeridentification: value.farmeridentification,
            primaryfarmholding: value.primaryfarmholding,
            cropAgriculture: value.cropAgriculture,
            livestock: value.cropAgriculture,
            aquaculture: value.aquaculture,
            farmAssets: value.farmAssets,
            landWater: value.landWater,
            financialServices: value.financialServices,
          );
        });
      }
    }

    return ProcessStatus(
      farmerId: 0,
      farmeridentification: 0,
      primaryfarmholding: 0,
      cropAgriculture: 0,
      livestock: 0,
      aquaculture: 0,
      farmAssets: 0,
      landWater: 0,
      financialServices: 0,
    );
  }

  Farmer getFarmer() {
    if (PrefUtils().getAddorEdit()) {
      int farmerid = PrefUtils().getFarmerId();
      if (farmerid != 0) {
        FarmerDB farmerDB = FarmerDB();
        farmerDB.fetchByFarmerId(farmerid).then((value) {
          return Farmer(
            farmerId: value!.farmerId,
            farmerName: value.farmerName,
            cropProd: value.cropProd,
            livestockProd: value.livestockProd,
            fishFarming: value.fishFarming,
          );
        });
      }
    }

    return Farmer(
      farmerId: 0,
      farmerName: "NA",
    );
  }

  _onSteppedDown(
    StepDownEvent event,
    Emitter<FarmerRegistrationState> emit,
  ) {
    emit(
      state.copyWith(
        farmerRegistrationModelObj: state.farmerRegistrationModelObj?.copyWith(
          currentStep: --state.farmerRegistrationModelObj?.currentStep,
        ),
      ),
    );
  }

  _onSteppedUp(
    StepUpEvent event,
    Emitter<FarmerRegistrationState> emit,
  ) {
    emit(
      state.copyWith(
        farmerRegistrationModelObj: state.farmerRegistrationModelObj?.copyWith(
          currentStep: ++state.farmerRegistrationModelObj?.currentStep,
        ),
      ),
    );
  }

  _onStepped(
    OnSteppedEvent event,
    Emitter<FarmerRegistrationState> emit,
  ) {
    emit(
      state.copyWith(
        farmerRegistrationModelObj: state.farmerRegistrationModelObj?.copyWith(
          currentStep: event.value,
        ),
      ),
    );
  }

  _onInitialize(
    FarmerRegistrationInitialEvent event,
    Emitter<FarmerRegistrationState> emit,
  ) async {
    emit(state.copyWith(
        farmerRegistrationModelObj: state.farmerRegistrationModelObj?.copyWith(
      processStatus: getRegProgress(),
      //farmer: getFarmer(),
    )));
  }
}

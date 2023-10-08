// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/dbModels/processes/process_status.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';

/// This class defines the variables used in the [farmer_registration_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FarmerRegistrationModel extends Equatable {
  FarmerRegistrationModel({
    this.processStatus,
    this.farmer,
    this.currentStep = 0,
  }) {}

  ProcessStatus? processStatus;

  Farmer? farmer;

  int currentStep;
  FarmerRegistrationModel copyWith({
    ProcessStatus? processStatus,
    Farmer? farmer,
    int? currentStep,
  }) {
    return FarmerRegistrationModel(
      processStatus: processStatus ?? this.processStatus,
      farmer: farmer ?? this.farmer,
      currentStep: currentStep ?? this.currentStep,
    );
  }

  @override
  List<Object?> get props => [
        processStatus,
        farmer,
        currentStep,
      ];
}

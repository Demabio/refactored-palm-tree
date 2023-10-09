// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';

/// This class defines the variables used in the [farmers_identification_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FarmersIdentificationOneModel extends Equatable {
  FarmersIdentificationOneModel({
    this.stepped = 0,
    this.stepped2 = 1,
    this.page1 = StepState.indexed,
    this.page2 = StepState.indexed,
    this.page3 = StepState.indexed,
    this.page4 = StepState.indexed,
    this.fiProgress,
    this.farmer,
  }) {}

  int stepped;
  int stepped2;

  StepState? page1;

  StepState? page2;

  StepState? page3;

  StepState? page4;

  FIProgress? fiProgress;

  Farmer? farmer;

  FarmersIdentificationOneModel copyWith({
    int? stepped,
    int? stepped2,
    StepState? page1,
    StepState? page2,
    StepState? page3,
    StepState? page4,
    FIProgress? fiProgress,
    Farmer? farmer,
  }) {
    return FarmersIdentificationOneModel(
      stepped: stepped ?? this.stepped,
      stepped2: stepped2 ?? this.stepped2,
      page1: page1 ?? this.page1,
      page2: page2 ?? this.page2,
      page3: page3 ?? this.page3,
      page4: page4 ?? this.page4,
      farmer: farmer ?? this.farmer,
      fiProgress: fiProgress ?? this.fiProgress,
    );
  }

  @override
  List<Object?> get props => [
        stepped,
        stepped2,
        page1,
        page2,
        page3,
        page4,
        fiProgress,
        farmer,
      ];
}

// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// This class defines the variables used in the [farmers_identification_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FarmersIdentificationOneModel extends Equatable {
  FarmersIdentificationOneModel({
    this.stepped = 0,
    this.page1 = StepState.indexed,
    this.page2 = StepState.indexed,
    this.page3 = StepState.indexed,
    this.page4 = StepState.indexed,
  }) {}

  int stepped;

  StepState? page1;

  StepState? page2;

  StepState? page3;

  StepState? page4;

  FarmersIdentificationOneModel copyWith({
    int? stepped,
    StepState? page1,
    StepState? page2,
    StepState? page3,
    StepState? page4,
  }) {
    return FarmersIdentificationOneModel(
      stepped: stepped ?? this.stepped,
      page1: page1 ?? this.page1,
      page2: page2 ?? this.page2,
      page3: page3 ?? this.page3,
      page4: page4 ?? this.page4,
    );
  }

  @override
  List<Object?> get props => [
        stepped,
        page1,
        page2,
        page3,
        page4,
      ];
}

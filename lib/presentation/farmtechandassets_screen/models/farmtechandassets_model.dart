// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/dbModels/processes/assets_tech_progress.dart';

/// This class defines the variables used in the [farmtechandassets_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FarmtechandassetsModel extends Equatable {
  FarmtechandassetsModel({
    this.atProgress,
  });
  ATProgress? atProgress;

  FarmtechandassetsModel copyWith({
    ATProgress? atProgress,
  }) {
    return FarmtechandassetsModel(
      atProgress: atProgress ?? this.atProgress,
    );
  }

  @override
  List<Object?> get props => [
        atProgress,
      ];
}

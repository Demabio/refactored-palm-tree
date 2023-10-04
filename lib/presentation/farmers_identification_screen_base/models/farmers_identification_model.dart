// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [farmers_identification_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FarmersIdentificationBaseModel extends Equatable {
  FarmersIdentificationBaseModel() {}

  FarmersIdentificationBaseModel copyWith() {
    return FarmersIdentificationBaseModel();
  }

  @override
  List<Object?> get props => [];
}

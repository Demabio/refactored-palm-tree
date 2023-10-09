// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';

/// This class defines the variables used in the [farmers_identification_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FarmersIdentificationModel extends Equatable {
  FarmersIdentificationModel({
    this.farmer,
    this.ed,
    this.marital,
    this.rship,
  }) {}
  Farmer? farmer;
  String? marital;
  String? rship;
  String? ed;
  FarmersIdentificationModel copyWith({
    Farmer? farmer,
    String? marital,
    String? rship,
    String? ed,
  }) {
    return FarmersIdentificationModel(
      farmer: farmer ?? this.farmer,
      marital: marital ?? this.marital,
      rship: rship ?? this.rship,
      ed: ed ?? this.ed,
    );
  }

  @override
  List<Object?> get props => [
        farmer,
        ed,
        rship,
        marital,
      ];
}

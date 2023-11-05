// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestockservice.dart';

/// This class defines the variables used in the [livestock_two_page],
/// and is typically used to hold data that is passed between different parts of the application.
class LivestockTwoModel extends Equatable {
  LivestockTwoModel({this.livestockins, this.area = "N/A"});
  FarmerLivestockService? livestockins;
  String area;
  LivestockTwoModel copyWith({
    FarmerLivestockService? livestockins,
    String? area,
  }) {
    return LivestockTwoModel(
      area: area ?? this.area,
      livestockins: livestockins ?? this.livestockins,
    );
  }

  @override
  List<Object?> get props => [livestockins, area];
}

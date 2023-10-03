// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/models/agegroupmodel.dart';

/// This class defines the variables used in the [add_reared_livestock_dialog_two_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddRearedLivestockDialogTwoModel extends Equatable {
  AddRearedLivestockDialogTwoModel({
    this.ageGroupmModel,
  }) {}

  List<AgeGroupmModel>? ageGroupmModel;

  AddRearedLivestockDialogTwoModel copyWith(
    List<AgeGroupmModel>? ageGroupmModel,
  ) {
    return AddRearedLivestockDialogTwoModel(
      ageGroupmModel: ageGroupmModel ?? this.ageGroupmModel,
    );
  }

  @override
  List<Object?> get props => [
        ageGroupmModel,
      ];
}

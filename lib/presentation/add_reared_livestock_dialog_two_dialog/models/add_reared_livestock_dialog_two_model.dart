// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/models/agegroupmodel.dart';

/// This class defines the variables used in the [add_reared_livestock_dialog_two_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddRearedLivestockDialogTwoModel extends Equatable {
  AddRearedLivestockDialogTwoModel({
    this.ageGroupmModels = const [],
    this.count = 0,
  }) {}

  List<AgeGroupModel> ageGroupmModels;

  int count;

  AddRearedLivestockDialogTwoModel copyWith({
    List<AgeGroupModel>? ageGroupmModels,
    int? count,
  }) {
    return AddRearedLivestockDialogTwoModel(
      ageGroupmModels: ageGroupmModels ?? this.ageGroupmModels,
      count: count ?? this.count,
    );
  }

  @override
  List<Object?> get props => [ageGroupmModels, count];
}

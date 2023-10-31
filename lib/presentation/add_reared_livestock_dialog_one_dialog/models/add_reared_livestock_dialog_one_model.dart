// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_one_dialog/models/feedsmodel.dart';

/// This class defines the variables used in the [add_reared_livestock_dialog_one_dialog],
/// and is typically used to hold data that is passed between different parts of the application.
class AddRearedLivestockDialogOneModel extends Equatable {
  AddRearedLivestockDialogOneModel({
    this.models = const [],
    this.count = 0,
  });

  List<FeedsModel> models;

  int count;

  AddRearedLivestockDialogOneModel copyWith({
    List<FeedsModel>? models,
    int? count,
  }) {
    return AddRearedLivestockDialogOneModel(
      count: count ?? this.count,
      models: models ?? this.models,
    );
  }

  @override
  List<Object?> get props => [
        models,
        count,
      ];
}

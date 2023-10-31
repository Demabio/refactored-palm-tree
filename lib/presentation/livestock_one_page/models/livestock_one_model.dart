// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import 'livestock_item_model.dart';

/// This class defines the variables used in the [livestock_one_page],
/// and is typically used to hold data that is passed between different parts of the application.
class LivestockOneModel extends Equatable {
  LivestockOneModel({
    this.lsmodels = const [],
  });
  List<LSdetailsItemModel> lsmodels;
  LivestockOneModel copyWith({
    List<LSdetailsItemModel>? lsmodels,
  }) {
    return LivestockOneModel(
      lsmodels: lsmodels ?? this.lsmodels,
    );
  }

  @override
  List<Object?> get props => [
        lsmodels,
      ];
}

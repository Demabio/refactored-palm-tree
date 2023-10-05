// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [chipviewalbert_item_widget] screen.
class ChipviewalbertItemModel extends Equatable {
  ChipviewalbertItemModel({
    this.albertcrop = "Albert crop",
    this.isSelected = false,
    this.cropId,
  }) {}

  String albertcrop;

  bool isSelected;

  int? cropId;

  ChipviewalbertItemModel copyWith({
    String? albertcrop,
    bool? isSelected,
  }) {
    return ChipviewalbertItemModel(
        albertcrop: albertcrop ?? this.albertcrop,
        isSelected: isSelected ?? this.isSelected,
        cropId: cropId ?? this.cropId);
  }

  @override
  List<Object?> get props => [
        albertcrop,
        isSelected,
        cropId,
      ];
}

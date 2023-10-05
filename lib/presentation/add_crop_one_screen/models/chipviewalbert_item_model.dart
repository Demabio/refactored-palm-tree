// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [chipviewalbert_item_widget] screen.
class ChipviewalbertItemModel extends Equatable {
  ChipviewalbertItemModel({
    this.albertcrop = "Albert crop",
    this.isSelected = false,
    this.cropId,
    this.search = false,
  }) {}

  String albertcrop;

  bool isSelected;

  int? cropId;

  bool search;

  ChipviewalbertItemModel copyWith({
    String? albertcrop,
    bool? isSelected,
    int? cropId,
    bool? search,
  }) {
    return ChipviewalbertItemModel(
      albertcrop: albertcrop ?? this.albertcrop,
      isSelected: isSelected ?? this.isSelected,
      cropId: cropId ?? this.cropId,
      search: search ?? this.search,
    );
  }

  @override
  List<Object?> get props => [
        albertcrop,
        isSelected,
        cropId,
        search,
      ];
}

// ignore_for_file: must_be_immutable

part of 'add_reared_livestock_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddRearedLivestockOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddRearedLivestockOneEvent extends Equatable {}

/// Event that is dispatched when the AddRearedLivestockOne widget is first created.
class AddRearedLivestockOneInitialEvent extends AddRearedLivestockOneEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing ChipView selection
class UpdateChipViewEvent extends AddRearedLivestockOneEvent {
  UpdateChipViewEvent({
    required this.index,
    this.isSelected,
    this.model,
  });

  int index;
  ChipviewayrshiItemModel? model;
  bool? isSelected;

  @override
  List<Object?> get props => [
        index,
        isSelected,
        model,
      ];
}

///event for dropdown selection
class ChangeDropDownEvent extends AddRearedLivestockOneEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends AddRearedLivestockOneEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ChangeDropDownEventLivestock extends AddRearedLivestockOneEvent {
  ChangeDropDownEventLivestock({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ChangeDropDownEventCategory extends AddRearedLivestockOneEvent {
  ChangeDropDownEventCategory({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ChangeDropDownEventSubCategory extends AddRearedLivestockOneEvent {
  ChangeDropDownEventSubCategory({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class SearchEventLivestock extends AddRearedLivestockOneEvent {
  SearchEventLivestock({required this.value});

  String value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ReturnCommonEventLivestock extends AddRearedLivestockOneEvent {
  ReturnCommonEventLivestock({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

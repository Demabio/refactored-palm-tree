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
  });

  int index;

  bool? isSelected;

  @override
  List<Object?> get props => [
        index,
        isSelected,
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

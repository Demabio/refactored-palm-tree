// ignore_for_file: must_be_immutable

part of 'add_reared_livestock_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddRearedLivestockTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddRearedLivestockTwoEvent extends Equatable {}

/// Event that is dispatched when the AddRearedLivestockTwo widget is first created.
class AddRearedLivestockTwoInitialEvent extends AddRearedLivestockTwoEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing ChipView selection
class UpdateChipViewEvent extends AddRearedLivestockTwoEvent {
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
class ChangeDropDownEvent extends AddRearedLivestockTwoEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends AddRearedLivestockTwoEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

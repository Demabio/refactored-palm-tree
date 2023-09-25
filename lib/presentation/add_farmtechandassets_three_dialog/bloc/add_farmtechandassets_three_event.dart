// ignore_for_file: must_be_immutable

part of 'add_farmtechandassets_three_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddFarmtechandassetsThree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddFarmtechandassetsThreeEvent extends Equatable {}

/// Event that is dispatched when the AddFarmtechandassetsThree widget is first created.
class AddFarmtechandassetsThreeInitialEvent
    extends AddFarmtechandassetsThreeEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends AddFarmtechandassetsThreeEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends AddFarmtechandassetsThreeEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown2Event extends AddFarmtechandassetsThreeEvent {
  ChangeDropDown2Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

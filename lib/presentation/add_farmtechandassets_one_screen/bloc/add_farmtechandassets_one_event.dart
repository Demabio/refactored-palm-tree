// ignore_for_file: must_be_immutable

part of 'add_farmtechandassets_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddFarmtechandassetsOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddFarmtechandassetsOneEvent extends Equatable {}

/// Event that is dispatched when the AddFarmtechandassetsOne widget is first created.
class AddFarmtechandassetsOneInitialEvent extends AddFarmtechandassetsOneEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends AddFarmtechandassetsOneEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends AddFarmtechandassetsOneEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

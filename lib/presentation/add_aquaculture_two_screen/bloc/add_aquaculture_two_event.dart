// ignore_for_file: must_be_immutable

part of 'add_aquaculture_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddAquacultureTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddAquacultureTwoEvent extends Equatable {}

/// Event that is dispatched when the AddAquacultureTwo widget is first created.
class AddAquacultureTwoInitialEvent extends AddAquacultureTwoEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends AddAquacultureTwoEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends AddAquacultureTwoEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown2Event extends AddAquacultureTwoEvent {
  ChangeDropDown2Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

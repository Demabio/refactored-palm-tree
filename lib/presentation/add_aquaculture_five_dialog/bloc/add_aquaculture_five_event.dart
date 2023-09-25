// ignore_for_file: must_be_immutable

part of 'add_aquaculture_five_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddAquacultureFive widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddAquacultureFiveEvent extends Equatable {}

/// Event that is dispatched when the AddAquacultureFive widget is first created.
class AddAquacultureFiveInitialEvent extends AddAquacultureFiveEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends AddAquacultureFiveEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends AddAquacultureFiveEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown2Event extends AddAquacultureFiveEvent {
  ChangeDropDown2Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

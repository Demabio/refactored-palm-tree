// ignore_for_file: must_be_immutable

part of 'add_aquaculture_four_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddAquacultureFour widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddAquacultureFourEvent extends Equatable {}

/// Event that is dispatched when the AddAquacultureFour widget is first created.
class AddAquacultureFourInitialEvent extends AddAquacultureFourEvent {
  @override
  List<Object?> get props => [];
}

class AddCBs extends AddAquacultureFourEvent {
  AddCBs({
    this.createFailed,
    this.createSuccessful,
  });
  Function? createSuccessful;

  Function? createFailed;
  @override
  List<Object?> get props => [
        createFailed,
        createSuccessful,
      ];
}

///event for dropdown selection
class ChangeDropDownEvent extends AddAquacultureFourEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends AddAquacultureFourEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown2Event extends AddAquacultureFourEvent {
  ChangeDropDown2Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown3Event extends AddAquacultureFourEvent {
  ChangeDropDown3Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown4Event extends AddAquacultureFourEvent {
  ChangeDropDown4Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown5Event extends AddAquacultureFourEvent {
  ChangeDropDown5Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

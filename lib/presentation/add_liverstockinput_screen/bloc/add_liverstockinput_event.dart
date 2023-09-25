// ignore_for_file: must_be_immutable

part of 'add_liverstockinput_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddLiverstockinput widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddLiverstockinputEvent extends Equatable {}

/// Event that is dispatched when the AddLiverstockinput widget is first created.
class AddLiverstockinputInitialEvent extends AddLiverstockinputEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends AddLiverstockinputEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends AddLiverstockinputEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown2Event extends AddLiverstockinputEvent {
  ChangeDropDown2Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown3Event extends AddLiverstockinputEvent {
  ChangeDropDown3Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown4Event extends AddLiverstockinputEvent {
  ChangeDropDown4Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown5Event extends AddLiverstockinputEvent {
  ChangeDropDown5Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown6Event extends AddLiverstockinputEvent {
  ChangeDropDown6Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown7Event extends AddLiverstockinputEvent {
  ChangeDropDown7Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

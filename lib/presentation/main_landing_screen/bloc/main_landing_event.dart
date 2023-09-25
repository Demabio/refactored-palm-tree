// ignore_for_file: must_be_immutable

part of 'main_landing_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///MainLanding widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MainLandingEvent extends Equatable {}

/// Event that is dispatched when the MainLanding widget is first created.
class MainLandingInitialEvent extends MainLandingEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends MainLandingEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends MainLandingEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown2Event extends MainLandingEvent {
  ChangeDropDown2Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

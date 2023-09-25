// ignore_for_file: must_be_immutable

part of 'farmers_identification_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///FarmersIdentificationTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class FarmersIdentificationTwoEvent extends Equatable {}

/// Event that is dispatched when the FarmersIdentificationTwo widget is first created.
class FarmersIdentificationTwoInitialEvent
    extends FarmersIdentificationTwoEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends FarmersIdentificationTwoEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends FarmersIdentificationTwoEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

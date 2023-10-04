// ignore_for_file: must_be_immutable

part of 'add_reared_livestock_dialog_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddRearedLivestockDialogTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddRearedLivestockDialogTwoEvent extends Equatable {}

/// Event that is dispatched when the AddRearedLivestockDialogTwo widget is first created.
class AddRearedLivestockDialogTwoInitialEvent
    extends AddRearedLivestockDialogTwoEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends AddRearedLivestockDialogTwoEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends AddRearedLivestockDialogTwoEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ChangeAgeGroupCheckbox extends AddRearedLivestockDialogTwoEvent {
  ChangeAgeGroupCheckbox({required this.value});

  int value;

  @override
  List<Object?> get props => [
        value,
      ];
}

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

///Event for changing checkbox
class ChangeCheckBox2Event extends AddRearedLivestockDialogTwoEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox3Event extends AddRearedLivestockDialogTwoEvent {
  ChangeCheckBox3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox4Event extends AddRearedLivestockDialogTwoEvent {
  ChangeCheckBox4Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox5Event extends AddRearedLivestockDialogTwoEvent {
  ChangeCheckBox5Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox6Event extends AddRearedLivestockDialogTwoEvent {
  ChangeCheckBox6Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox7Event extends AddRearedLivestockDialogTwoEvent {
  ChangeCheckBox7Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

// ignore_for_file: must_be_immutable

part of 'add_reared_livestock_dialog_three_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddRearedLivestockDialogThree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddRearedLivestockDialogThreeEvent extends Equatable {}

/// Event that is dispatched when the AddRearedLivestockDialogThree widget is first created.
class AddRearedLivestockDialogThreeInitialEvent
    extends AddRearedLivestockDialogThreeEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends AddRearedLivestockDialogThreeEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends AddRearedLivestockDialogThreeEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox2Event extends AddRearedLivestockDialogThreeEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox3Event extends AddRearedLivestockDialogThreeEvent {
  ChangeCheckBox3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox4Event extends AddRearedLivestockDialogThreeEvent {
  ChangeCheckBox4Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox5Event extends AddRearedLivestockDialogThreeEvent {
  ChangeCheckBox5Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox6Event extends AddRearedLivestockDialogThreeEvent {
  ChangeCheckBox6Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox7Event extends AddRearedLivestockDialogThreeEvent {
  ChangeCheckBox7Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

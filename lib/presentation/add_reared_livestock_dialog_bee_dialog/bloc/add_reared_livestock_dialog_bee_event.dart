// ignore_for_file: must_be_immutable

part of 'add_reared_livestock_dialog_bee_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddRearedLivestockDialogTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddRearedLivestockDialogBeeEvent extends Equatable {}

/// Event that is dispatched when the AddRearedLivestockDialogTwo widget is first created.
class AddRearedLivestockDialogBeeInitialEvent
    extends AddRearedLivestockDialogBeeEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends AddRearedLivestockDialogBeeEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends AddRearedLivestockDialogBeeEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ChangeAgeGroupCheckbox extends AddRearedLivestockDialogBeeEvent {
  ChangeAgeGroupCheckbox({required this.value, this.selected});

  int value;

  bool? selected;

  @override
  List<Object?> get props => [
        value,
        selected,
      ];
}

class ResetCBs extends AddRearedLivestockDialogBeeEvent {
  ResetCBs();

  @override
  List<Object?> get props => [];
}

class AddAGs extends AddRearedLivestockDialogBeeEvent {
  AddAGs({
    required this.models,
  });

  List<FeedsModel> models;
  @override
  List<Object?> get props => [
        models,
      ];
}

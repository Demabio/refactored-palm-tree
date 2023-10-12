// ignore_for_file: must_be_immutable

part of 'add_farmtechandassets_four_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddFarmtechandassetsFour widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddFarmtechandassetsFourEvent extends Equatable {}

/// Event that is dispatched when the AddFarmtechandassetsFour widget is first created.
class AddFarmtechandassetsFourInitialEvent
    extends AddFarmtechandassetsFourEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing checkbox
class ChangeCheckBox13Event extends AddFarmtechandassetsFourEvent {
  ChangeCheckBox13Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ResetCBs extends AddFarmtechandassetsFourEvent {
  ResetCBs();

  @override
  List<Object?> get props => [];
}

class AddCBs extends AddFarmtechandassetsFourEvent {
  AddCBs({
    required this.models,
    this.createFailed,
    this.createSuccessful,
  });
  Function? createSuccessful;

  Function? createFailed;
  List<CheckBoxList> models;
  @override
  List<Object?> get props => [
        models,
        createFailed,
        createSuccessful,
      ];
}

class ChangeCheckbox extends AddFarmtechandassetsFourEvent {
  ChangeCheckbox({required this.value, this.selected});

  int value;

  bool? selected;

  @override
  List<Object?> get props => [
        value,
        selected,
      ];
}

// ignore_for_file: must_be_immutable

part of 'add_reared_livestock_dialog_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddRearedLivestockDialogOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddRearedLivestockDialogOneEvent extends Equatable {}

/// Event that is dispatched when the AddRearedLivestockDialogOne widget is first created.
class AddRearedLivestockDialogOneInitialEvent
    extends AddRearedLivestockDialogOneEvent {
  @override
  List<Object?> get props => [];
}

class ChangeCheckbox extends AddRearedLivestockDialogOneEvent {
  ChangeCheckbox({required this.value, this.selected});

  int value;

  bool? selected;

  @override
  List<Object?> get props => [
        value,
        selected,
      ];
}

class ResetCBs extends AddRearedLivestockDialogOneEvent {
  ResetCBs();

  @override
  List<Object?> get props => [];
}

class AddCBs extends AddRearedLivestockDialogOneEvent {
  AddCBs({
    required this.models,
  });

  List<FeedsModel> models;
  @override
  List<Object?> get props => [
        models,
      ];
}

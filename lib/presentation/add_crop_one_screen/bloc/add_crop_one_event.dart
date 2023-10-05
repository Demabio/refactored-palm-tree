// ignore_for_file: must_be_immutable

part of 'add_crop_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddCropOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddCropOneEvent extends Equatable {}

/// Event that is dispatched when the AddCropOne widget is first created.
class AddCropOneInitialEvent extends AddCropOneEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing ChipView selection
class UpdateChipViewEvent extends AddCropOneEvent {
  UpdateChipViewEvent({
    required this.index,
    this.isSelected,
    this.model,
  });

  int index;

  bool? isSelected;

  ChipviewalbertItemModel? model;

  @override
  List<Object?> get props => [
        index,
        isSelected,
        model,
      ];
}

///event for dropdown selection
class ChangeDropDownEvent extends AddCropOneEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends AddCropOneEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown2Event extends AddCropOneEvent {
  ChangeDropDown2Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepUpEvent extends AddCropOneEvent {
  StepUpEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepDownEvent extends AddCropOneEvent {
  StepDownEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class OnSteppedEvent extends AddCropOneEvent {
  OnSteppedEvent({this.value});

  int? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class SearchEventCrop extends AddCropOneEvent {
  SearchEventCrop({required this.value});

  String value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ReturnCommonEventCrop extends AddCropOneEvent {
  ReturnCommonEventCrop({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

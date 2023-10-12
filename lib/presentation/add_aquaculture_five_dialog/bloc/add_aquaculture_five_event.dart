// ignore_for_file: must_be_immutable

part of 'add_aquaculture_five_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddAquacultureFive widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddAquacultureFiveEvent extends Equatable {}

/// Event that is dispatched when the AddAquacultureFive widget is first created.
class AddAquacultureFiveInitialEvent extends AddAquacultureFiveEvent {
  @override
  List<Object?> get props => [];
}

class AddCBs extends AddAquacultureFiveEvent {
  AddCBs({
    this.createFailed,
    this.createSuccessful,
  });
  Function? createSuccessful;

  Function? createFailed;
  @override
  List<Object?> get props => [
        createFailed,
        createSuccessful,
      ];
}

///event for dropdown selection
class ChangeDropDownEvent extends AddAquacultureFiveEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends AddAquacultureFiveEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing ChipView selection
class UpdateChipViewEvent extends AddAquacultureFiveEvent {
  UpdateChipViewEvent({
    required this.index,
    this.isSelected,
    this.model,
  });

  int index;
  ChipviewayItemModel? model;
  bool? isSelected;

  @override
  List<Object?> get props => [
        index,
        isSelected,
        model,
      ];
}

///event for dropdown selection
class ChangeDropDown2Event extends AddAquacultureFiveEvent {
  ChangeDropDown2Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class SearchEventFish extends AddAquacultureFiveEvent {
  SearchEventFish({required this.value});

  String value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ReturnCommonEvent extends AddAquacultureFiveEvent {
  ReturnCommonEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

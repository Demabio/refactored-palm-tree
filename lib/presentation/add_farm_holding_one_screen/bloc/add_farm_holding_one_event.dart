// ignore_for_file: must_be_immutable

part of 'add_farm_holding_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddFarmHoldingOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddFarmHoldingOneEvent extends Equatable {}

/// Event that is dispatched when the AddFarmHoldingOne widget is first created.
class AddFarmHoldingOneInitialEvent extends AddFarmHoldingOneEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends AddFarmHoldingOneEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

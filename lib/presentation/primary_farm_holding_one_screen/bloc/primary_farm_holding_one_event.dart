// ignore_for_file: must_be_immutable

part of 'primary_farm_holding_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///PrimaryFarmHoldingOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class PrimaryFarmHoldingOneEvent extends Equatable {}

/// Event that is dispatched when the PrimaryFarmHoldingOne widget is first created.
class PrimaryFarmHoldingOneInitialEvent extends PrimaryFarmHoldingOneEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends PrimaryFarmHoldingOneEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

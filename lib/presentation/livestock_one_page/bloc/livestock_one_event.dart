// ignore_for_file: must_be_immutable

part of 'livestock_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///LivestockOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LivestockOneEvent extends Equatable {}

/// Event that is dispatched when the LivestockOne widget is first created.
class LivestockOneInitialEvent extends LivestockOneEvent {
  @override
  List<Object?> get props => [];
}

class AddEditEvent extends LivestockOneEvent {
  AddEditEvent({
    this.createFailed,
    this.createSuccessful,
    this.value,
    this.crop,
  });

  int? value;
  int? crop;
  Function? createSuccessful;

  Function? createFailed;
  @override
  List<Object?> get props => [
        value,
        createFailed,
        createSuccessful,
        crop,
      ];
}

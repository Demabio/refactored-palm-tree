// ignore_for_file: must_be_immutable

part of 'landandwatermgmt_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Landandwatermgmt widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LandandwatermgmtEvent extends Equatable {}

/// Event that is dispatched when the Landandwatermgmt widget is first created.
class LandandwatermgmtInitialEvent extends LandandwatermgmtEvent {
  @override
  List<Object?> get props => [];
}

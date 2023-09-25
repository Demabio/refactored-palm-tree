// ignore_for_file: must_be_immutable

part of 'recover_account_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///RecoverAccount widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RecoverAccountEvent extends Equatable {}

/// Event that is dispatched when the RecoverAccount widget is first created.
class RecoverAccountInitialEvent extends RecoverAccountEvent {
  @override
  List<Object?> get props => [];
}

// ignore_for_file: must_be_immutable

part of 'accounts_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Accounts widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AccountsEvent extends Equatable {}

/// Event that is dispatched when the Accounts widget is first created.
class AccountsInitialEvent extends AccountsEvent {
  @override
  List<Object?> get props => [];
}

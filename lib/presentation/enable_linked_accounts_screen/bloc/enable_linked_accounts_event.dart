// ignore_for_file: must_be_immutable

part of 'enable_linked_accounts_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///EnableLinkedAccounts widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class EnableLinkedAccountsEvent extends Equatable {}

/// Event that is dispatched when the EnableLinkedAccounts widget is first created.
class EnableLinkedAccountsInitialEvent extends EnableLinkedAccountsEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing switch
class ChangeSwitchEvent extends EnableLinkedAccountsEvent {
  ChangeSwitchEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing switch
class ChangeSwitch1Event extends EnableLinkedAccountsEvent {
  ChangeSwitch1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing switch
class ChangeSwitch2Event extends EnableLinkedAccountsEvent {
  ChangeSwitch2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing switch
class ChangeSwitch3Event extends EnableLinkedAccountsEvent {
  ChangeSwitch3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing switch
class ChangeSwitch4Event extends EnableLinkedAccountsEvent {
  ChangeSwitch4Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

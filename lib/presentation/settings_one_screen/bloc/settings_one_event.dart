// ignore_for_file: must_be_immutable

part of 'settings_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SettingsOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SettingsOneEvent extends Equatable {}

/// Event that is dispatched when the SettingsOne widget is first created.
class SettingsOneInitialEvent extends SettingsOneEvent {
  @override
  List<Object?> get props => [];
}

// ignore_for_file: must_be_immutable

part of 'profile_security_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ProfileSecurity widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProfileSecurityEvent extends Equatable {}

/// Event that is dispatched when the ProfileSecurity widget is first created.
class ProfileSecurityInitialEvent extends ProfileSecurityEvent {
  @override
  List<Object?> get props => [];
}

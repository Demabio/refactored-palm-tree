// ignore_for_file: must_be_immutable

part of 'profile_profile_info_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ProfileProfileInfo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProfileProfileInfoEvent extends Equatable {}

/// Event that is dispatched when the ProfileProfileInfo widget is first created.
class ProfileProfileInfoInitialEvent extends ProfileProfileInfoEvent {
  @override
  List<Object?> get props => [];
}

// ignore_for_file: must_be_immutable

part of 'profile_profile_info_tab_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ProfileProfileInfoTabContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProfileProfileInfoTabContainerEvent extends Equatable {}

/// Event that is dispatched when the ProfileProfileInfoTabContainer widget is first created.
class ProfileProfileInfoTabContainerInitialEvent
    extends ProfileProfileInfoTabContainerEvent {
  @override
  List<Object?> get props => [];
}

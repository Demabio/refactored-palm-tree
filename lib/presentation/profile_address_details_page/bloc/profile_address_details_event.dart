// ignore_for_file: must_be_immutable

part of 'profile_address_details_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ProfileAddressDetails widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProfileAddressDetailsEvent extends Equatable {}

/// Event that is dispatched when the ProfileAddressDetails widget is first created.
class ProfileAddressDetailsInitialEvent extends ProfileAddressDetailsEvent {
  @override
  List<Object?> get props => [];
}

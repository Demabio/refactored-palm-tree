// ignore_for_file: must_be_immutable

part of 'farmer_registration_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///FarmerRegistrationOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class FarmerRegistrationOneEvent extends Equatable {}

/// Event that is dispatched when the FarmerRegistrationOne widget is first created.
class FarmerRegistrationOneInitialEvent extends FarmerRegistrationOneEvent {
  @override
  List<Object?> get props => [];
}

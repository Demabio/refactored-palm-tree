// ignore_for_file: must_be_immutable

part of 'home_farmer_found_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///HomeFarmerFound widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class HomeFarmerFoundEvent extends Equatable {}

/// Event that is dispatched when the HomeFarmerFound widget is first created.
class HomeFarmerFoundInitialEvent extends HomeFarmerFoundEvent {
  @override
  List<Object?> get props => [];
}

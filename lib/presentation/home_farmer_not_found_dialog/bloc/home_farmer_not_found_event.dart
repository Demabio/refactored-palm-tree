// ignore_for_file: must_be_immutable

part of 'home_farmer_not_found_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///HomeFarmerNotFound widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class HomeFarmerNotFoundEvent extends Equatable {}

/// Event that is dispatched when the HomeFarmerNotFound widget is first created.
class HomeFarmerNotFoundInitialEvent extends HomeFarmerNotFoundEvent {
  @override
  List<Object?> get props => [];
}

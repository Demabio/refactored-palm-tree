// ignore_for_file: must_be_immutable

part of 'search_farmer_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SearchFarmer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SearchFarmerEvent extends Equatable {}

/// Event that is dispatched when the SearchFarmer widget is first created.
class SearchFarmerInitialEvent extends SearchFarmerEvent {
  @override
  List<Object?> get props => [];
}

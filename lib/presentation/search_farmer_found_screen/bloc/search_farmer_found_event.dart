// ignore_for_file: must_be_immutable

part of 'search_farmer_found_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SearchFarmerFound widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SearchFarmerFoundEvent extends Equatable {}

/// Event that is dispatched when the SearchFarmerFound widget is first created.
class SearchFarmerFoundInitialEvent extends SearchFarmerFoundEvent {
  @override
  List<Object?> get props => [];
}

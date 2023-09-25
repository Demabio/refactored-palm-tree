// ignore_for_file: must_be_immutable

part of 'search_farmer_not_found_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SearchFarmerNotFound widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SearchFarmerNotFoundEvent extends Equatable {}

/// Event that is dispatched when the SearchFarmerNotFound widget is first created.
class SearchFarmerNotFoundInitialEvent extends SearchFarmerNotFoundEvent {
  @override
  List<Object?> get props => [];
}

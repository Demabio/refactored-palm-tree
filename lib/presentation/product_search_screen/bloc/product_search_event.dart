// ignore_for_file: must_be_immutable

part of 'product_search_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ProductSearch widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProductSearchEvent extends Equatable {}

/// Event that is dispatched when the ProductSearch widget is first created.
class ProductSearchInitialEvent extends ProductSearchEvent {
  @override
  List<Object?> get props => [];
}

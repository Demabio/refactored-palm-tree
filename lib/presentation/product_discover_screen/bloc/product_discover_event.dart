// ignore_for_file: must_be_immutable

part of 'product_discover_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ProductDiscover widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProductDiscoverEvent extends Equatable {}

/// Event that is dispatched when the ProductDiscover widget is first created.
class ProductDiscoverInitialEvent extends ProductDiscoverEvent {
  @override
  List<Object?> get props => [];
}

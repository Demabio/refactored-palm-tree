// ignore_for_file: must_be_immutable

part of 'product_page_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ProductPage widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProductPageEvent extends Equatable {}

/// Event that is dispatched when the ProductPage widget is first created.
class ProductPageInitialEvent extends ProductPageEvent {
  @override
  List<Object?> get props => [];
}

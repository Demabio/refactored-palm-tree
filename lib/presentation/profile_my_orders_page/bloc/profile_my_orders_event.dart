// ignore_for_file: must_be_immutable

part of 'profile_my_orders_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ProfileMyOrders widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ProfileMyOrdersEvent extends Equatable {}

/// Event that is dispatched when the ProfileMyOrders widget is first created.
class ProfileMyOrdersInitialEvent extends ProfileMyOrdersEvent {
  @override
  List<Object?> get props => [];
}

// ignore_for_file: must_be_immutable

part of 'transfer_amount_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///TransferAmount widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class TransferAmountEvent extends Equatable {}

/// Event that is dispatched when the TransferAmount widget is first created.
class TransferAmountInitialEvent extends TransferAmountEvent {
  @override
  List<Object?> get props => [];
}

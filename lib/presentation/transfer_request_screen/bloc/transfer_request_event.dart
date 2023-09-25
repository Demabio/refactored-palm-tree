// ignore_for_file: must_be_immutable

part of 'transfer_request_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///TransferRequest widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class TransferRequestEvent extends Equatable {}

/// Event that is dispatched when the TransferRequest widget is first created.
class TransferRequestInitialEvent extends TransferRequestEvent {
  @override
  List<Object?> get props => [];
}

// ignore_for_file: must_be_immutable

part of 'updatedb_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///HomeFarmerNotFound widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class UpdateDBEvent extends Equatable {}

/// Event that is dispatched when the HomeFarmerNotFound widget is first created.
class UpdateDBInitialEvent extends UpdateDBEvent {
  @override
  List<Object?> get props => [];
}

class FetchGetOrdersEvent extends UpdateDBEvent {
  FetchGetOrdersEvent();

  @override
  List<Object?> get props => [];
}

class InnitDBwithDataEvent extends UpdateDBEvent {
  InnitDBwithDataEvent({
    this.onSuccess,
    this.onFailed,
  });
  Function? onSuccess;
  Function? onFailed;
  @override
  List<Object?> get props => [
        onSuccess,
        onFailed,
      ];
}

class InnitDBwithDataFailedEvent extends UpdateDBEvent {
  InnitDBwithDataFailedEvent();

  @override
  List<Object?> get props => [];
}

class InnitDBwithDataSuccessEvent extends UpdateDBEvent {
  InnitDBwithDataSuccessEvent();

  @override
  List<Object?> get props => [];
}

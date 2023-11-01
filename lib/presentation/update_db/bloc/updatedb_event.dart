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

class InnitDBwithDataEvent2 extends UpdateDBEvent {
  InnitDBwithDataEvent2({
    this.onSuccess2,
    this.onFailed2,
  });

  Function? onSuccess2;
  Function? onFailed2;
  @override
  List<Object?> get props => [
        onSuccess2,
        onFailed2,
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

class InnitDBwithDataFailedEvent2 extends UpdateDBEvent {
  InnitDBwithDataFailedEvent2();

  @override
  List<Object?> get props => [];
}

class InnitDBwithDataSuccessEvent2 extends UpdateDBEvent {
  InnitDBwithDataSuccessEvent2();

  @override
  List<Object?> get props => [];
}

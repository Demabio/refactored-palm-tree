// ignore_for_file: must_be_immutable

part of 'home_farmer_not_found_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///HomeFarmerNotFound widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class HomeFarmerNotFoundEvent extends Equatable {}

/// Event that is dispatched when the HomeFarmerNotFound widget is first created.
class HomeFarmerNotFoundInitialEvent extends HomeFarmerNotFoundEvent {
  @override
  List<Object?> get props => [];
}

class FetchGetOrdersEvent extends HomeFarmerNotFoundEvent {
  FetchGetOrdersEvent();

  @override
  List<Object?> get props => [];
}

class InnitDBwithDataEvent extends HomeFarmerNotFoundEvent {
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

class InnitDBwithDataFailedEvent extends HomeFarmerNotFoundEvent {
  InnitDBwithDataFailedEvent();

  @override
  List<Object?> get props => [];
}

class InnitDBwithDataSuccessEvent extends HomeFarmerNotFoundEvent {
  InnitDBwithDataSuccessEvent();

  @override
  List<Object?> get props => [];
}

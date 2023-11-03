// ignore_for_file: must_be_immutable

part of 'enum_db_download_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///HomeFarmerNotFound widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class EnumDbDownloadEvent extends Equatable {}

/// Event that is dispatched when the HomeFarmerNotFound widget is first created.
class EnumDbDownloadInitialEvent extends EnumDbDownloadEvent {
  @override
  List<Object?> get props => [];
}

class FetchGetOrdersEvent extends EnumDbDownloadEvent {
  FetchGetOrdersEvent();

  @override
  List<Object?> get props => [];
}

class InnitDBwithDataEvent extends EnumDbDownloadEvent {
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

class InnitDBwithDataFailedEvent extends EnumDbDownloadEvent {
  InnitDBwithDataFailedEvent();

  @override
  List<Object?> get props => [];
}

class InnitDBwithDataSuccessEvent extends EnumDbDownloadEvent {
  InnitDBwithDataSuccessEvent();

  @override
  List<Object?> get props => [];
}

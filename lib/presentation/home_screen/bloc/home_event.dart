// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Home widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class HomeEvent extends Equatable {}

/// Event that is dispatched when the Home widget is first created.
class HomeInitialEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class DBCheckEvent extends HomeEvent {
  DBCheckEvent({this.onError, this.onSuccess});
  Function? onSuccess;

  Function? onError;

  @override
  List<Object?> get props => [onSuccess, onError];
}

class LoadGraphs extends HomeEvent {
  LoadGraphs({this.onError, this.onSuccess});
  Function? onSuccess;

  Function? onError;

  @override
  List<Object?> get props => [onSuccess, onError];
}

class LoadDash extends HomeEvent {
  LoadDash({this.onError, this.onSuccess});
  Function? onSuccess;

  Function? onError;

  @override
  List<Object?> get props => [onSuccess, onError];
}

class FarmerSearchEvent extends HomeEvent {
  FarmerSearchEvent({
    this.onError,
    this.onSuccess,
    this.idNo,
  });
  Function? onSuccess;

  Function? onError;
  String? idNo;
  @override
  List<Object?> get props => [
        onSuccess,
        onError,
        idNo,
      ];
}

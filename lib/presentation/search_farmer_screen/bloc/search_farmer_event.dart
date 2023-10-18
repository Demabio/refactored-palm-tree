// ignore_for_file: must_be_immutable

part of 'search_farmer_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SearchFarmer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SearchFarmerEvent extends Equatable {}

/// Event that is dispatched when the SearchFarmer widget is first created.
class SearchFarmerInitialEvent extends SearchFarmerEvent {
  @override
  List<Object?> get props => [];
}

class FarmerSearchEvent extends SearchFarmerEvent {
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

class AddEditEvent extends SearchFarmerEvent {
  AddEditEvent({
    this.createFailed,
    this.createSuccessful,
    this.value,
    this.crop,
  });

  int? value;
  int? crop;
  Function? createSuccessful;

  Function? createFailed;
  @override
  List<Object?> get props => [
        value,
        createFailed,
        createSuccessful,
        crop,
      ];
}

class DeleteEvent extends SearchFarmerEvent {
  DeleteEvent({
    this.createFailed,
    this.createSuccessful,
    this.value,
    this.crop,
  });

  int? value;
  int? crop;
  Function? createSuccessful;

  Function? createFailed;
  @override
  List<Object?> get props => [
        value,
        createFailed,
        createSuccessful,
        crop,
      ];
}

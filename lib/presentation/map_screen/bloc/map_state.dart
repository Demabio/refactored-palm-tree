// ignore_for_file: must_be_immutable

part of 'map_bloc.dart';

/// Represents the state of Map in the application.
class MapState extends Equatable {
  MapState({this.mapModelObj});

  MapModel? mapModelObj;

  @override
  List<Object?> get props => [
        mapModelObj,
      ];
  MapState copyWith({MapModel? mapModelObj}) {
    return MapState(
      mapModelObj: mapModelObj ?? this.mapModelObj,
    );
  }
}

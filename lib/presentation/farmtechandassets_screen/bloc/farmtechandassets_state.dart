// ignore_for_file: must_be_immutable

part of 'farmtechandassets_bloc.dart';

/// Represents the state of Farmtechandassets in the application.
class FarmtechandassetsState extends Equatable {
  FarmtechandassetsState({this.farmtechandassetsModelObj});

  FarmtechandassetsModel? farmtechandassetsModelObj;

  @override
  List<Object?> get props => [
        farmtechandassetsModelObj,
      ];
  FarmtechandassetsState copyWith(
      {FarmtechandassetsModel? farmtechandassetsModelObj}) {
    return FarmtechandassetsState(
      farmtechandassetsModelObj:
          farmtechandassetsModelObj ?? this.farmtechandassetsModelObj,
    );
  }
}

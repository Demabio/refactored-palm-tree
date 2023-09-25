// ignore_for_file: must_be_immutable

part of 'aquaculture_bloc.dart';

/// Represents the state of Aquaculture in the application.
class AquacultureState extends Equatable {
  AquacultureState({this.aquacultureModelObj});

  AquacultureModel? aquacultureModelObj;

  @override
  List<Object?> get props => [
        aquacultureModelObj,
      ];
  AquacultureState copyWith({AquacultureModel? aquacultureModelObj}) {
    return AquacultureState(
      aquacultureModelObj: aquacultureModelObj ?? this.aquacultureModelObj,
    );
  }
}

// ignore_for_file: must_be_immutable

part of 'crop_agriculture_bloc.dart';

/// Represents the state of CropAgriculture in the application.
class CropAgricultureState extends Equatable {
  CropAgricultureState({this.cropAgricultureModelObj});

  CropAgricultureModel? cropAgricultureModelObj;

  @override
  List<Object?> get props => [
        cropAgricultureModelObj,
      ];
  CropAgricultureState copyWith(
      {CropAgricultureModel? cropAgricultureModelObj}) {
    return CropAgricultureState(
      cropAgricultureModelObj:
          cropAgricultureModelObj ?? this.cropAgricultureModelObj,
    );
  }
}

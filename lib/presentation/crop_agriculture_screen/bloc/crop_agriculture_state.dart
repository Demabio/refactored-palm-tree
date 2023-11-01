// ignore_for_file: must_be_immutable

part of 'crop_agriculture_bloc.dart';

/// Represents the state of CropAgriculture in the application.
class CropAgricultureState extends Equatable {
  CropAgricultureState({
    this.cropAgricultureModelObj,
    this.done = false,
    this.next = false,
    this.prev = false,
  });

  CropAgricultureModel? cropAgricultureModelObj;
  bool done;
  bool next;
  bool prev;
  @override
  List<Object?> get props => [
        cropAgricultureModelObj,
        done,
        next,
        prev,
      ];
  CropAgricultureState copyWith({
    CropAgricultureModel? cropAgricultureModelObj,
    bool? done,
    bool? next,
    bool? prev,
  }) {
    return CropAgricultureState(
      cropAgricultureModelObj:
          cropAgricultureModelObj ?? this.cropAgricultureModelObj,
      done: done ?? this.done,
      next: next ?? this.next,
      prev: prev ?? this.prev,
    );
  }
}

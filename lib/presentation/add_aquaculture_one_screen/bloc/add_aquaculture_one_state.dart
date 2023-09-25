// ignore_for_file: must_be_immutable

part of 'add_aquaculture_one_bloc.dart';

/// Represents the state of AddAquacultureOne in the application.
class AddAquacultureOneState extends Equatable {
  AddAquacultureOneState({this.addAquacultureOneModelObj});

  AddAquacultureOneModel? addAquacultureOneModelObj;

  @override
  List<Object?> get props => [
        addAquacultureOneModelObj,
      ];
  AddAquacultureOneState copyWith(
      {AddAquacultureOneModel? addAquacultureOneModelObj}) {
    return AddAquacultureOneState(
      addAquacultureOneModelObj:
          addAquacultureOneModelObj ?? this.addAquacultureOneModelObj,
    );
  }
}

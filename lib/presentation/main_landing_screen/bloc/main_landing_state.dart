// ignore_for_file: must_be_immutable

part of 'main_landing_bloc.dart';

/// Represents the state of MainLanding in the application.
class MainLandingState extends Equatable {
  MainLandingState({
    this.emailController,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.selectedDropDownValue2,
    this.mainLandingModelObj,
  });

  TextEditingController? emailController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  MainLandingModel? mainLandingModelObj;

  @override
  List<Object?> get props => [
        emailController,
        selectedDropDownValue,
        selectedDropDownValue1,
        selectedDropDownValue2,
        mainLandingModelObj,
      ];
  MainLandingState copyWith({
    TextEditingController? emailController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    MainLandingModel? mainLandingModelObj,
  }) {
    return MainLandingState(
      emailController: emailController ?? this.emailController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      selectedDropDownValue2:
          selectedDropDownValue2 ?? this.selectedDropDownValue2,
      mainLandingModelObj: mainLandingModelObj ?? this.mainLandingModelObj,
    );
  }
}

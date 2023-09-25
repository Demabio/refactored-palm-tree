// ignore_for_file: must_be_immutable

part of 'add_reared_livestock_dialog_three_bloc.dart';

/// Represents the state of AddRearedLivestockDialogThree in the application.
class AddRearedLivestockDialogThreeState extends Equatable {
  AddRearedLivestockDialogThreeState({
    this.twotosixmonthsmController,
    this.femalesController,
    this.twotosixmonthsmController1,
    this.femalesoneController,
    this.twotosixmonthsmController2,
    this.femalestwoController,
    this.lessThanThreeWe = false,
    this.threeToEightWee = false,
    this.lessThanTwoMont = false,
    this.twoToSixMonths = false,
    this.sixToTwelveMont = false,
    this.oneToTwoYears = false,
    this.twoToFourYears = false,
    this.fourYearsOrOlde = false,
    this.addRearedLivestockDialogThreeModelObj,
  });

  TextEditingController? twotosixmonthsmController;

  TextEditingController? femalesController;

  TextEditingController? twotosixmonthsmController1;

  TextEditingController? femalesoneController;

  TextEditingController? twotosixmonthsmController2;

  TextEditingController? femalestwoController;

  AddRearedLivestockDialogThreeModel? addRearedLivestockDialogThreeModelObj;

  bool lessThanThreeWe;

  bool threeToEightWee;

  bool lessThanTwoMont;

  bool twoToSixMonths;

  bool sixToTwelveMont;

  bool oneToTwoYears;

  bool twoToFourYears;

  bool fourYearsOrOlde;

  @override
  List<Object?> get props => [
        twotosixmonthsmController,
        femalesController,
        twotosixmonthsmController1,
        femalesoneController,
        twotosixmonthsmController2,
        femalestwoController,
        lessThanThreeWe,
        threeToEightWee,
        lessThanTwoMont,
        twoToSixMonths,
        sixToTwelveMont,
        oneToTwoYears,
        twoToFourYears,
        fourYearsOrOlde,
        addRearedLivestockDialogThreeModelObj,
      ];
  AddRearedLivestockDialogThreeState copyWith({
    TextEditingController? twotosixmonthsmController,
    TextEditingController? femalesController,
    TextEditingController? twotosixmonthsmController1,
    TextEditingController? femalesoneController,
    TextEditingController? twotosixmonthsmController2,
    TextEditingController? femalestwoController,
    bool? lessThanThreeWe,
    bool? threeToEightWee,
    bool? lessThanTwoMont,
    bool? twoToSixMonths,
    bool? sixToTwelveMont,
    bool? oneToTwoYears,
    bool? twoToFourYears,
    bool? fourYearsOrOlde,
    AddRearedLivestockDialogThreeModel? addRearedLivestockDialogThreeModelObj,
  }) {
    return AddRearedLivestockDialogThreeState(
      twotosixmonthsmController:
          twotosixmonthsmController ?? this.twotosixmonthsmController,
      femalesController: femalesController ?? this.femalesController,
      twotosixmonthsmController1:
          twotosixmonthsmController1 ?? this.twotosixmonthsmController1,
      femalesoneController: femalesoneController ?? this.femalesoneController,
      twotosixmonthsmController2:
          twotosixmonthsmController2 ?? this.twotosixmonthsmController2,
      femalestwoController: femalestwoController ?? this.femalestwoController,
      lessThanThreeWe: lessThanThreeWe ?? this.lessThanThreeWe,
      threeToEightWee: threeToEightWee ?? this.threeToEightWee,
      lessThanTwoMont: lessThanTwoMont ?? this.lessThanTwoMont,
      twoToSixMonths: twoToSixMonths ?? this.twoToSixMonths,
      sixToTwelveMont: sixToTwelveMont ?? this.sixToTwelveMont,
      oneToTwoYears: oneToTwoYears ?? this.oneToTwoYears,
      twoToFourYears: twoToFourYears ?? this.twoToFourYears,
      fourYearsOrOlde: fourYearsOrOlde ?? this.fourYearsOrOlde,
      addRearedLivestockDialogThreeModelObj:
          addRearedLivestockDialogThreeModelObj ??
              this.addRearedLivestockDialogThreeModelObj,
    );
  }
}

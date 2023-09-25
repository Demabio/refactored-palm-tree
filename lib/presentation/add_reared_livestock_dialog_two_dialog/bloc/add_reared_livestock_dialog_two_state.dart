// ignore_for_file: must_be_immutable

part of 'add_reared_livestock_dialog_two_bloc.dart';

/// Represents the state of AddRearedLivestockDialogTwo in the application.
class AddRearedLivestockDialogTwoState extends Equatable {
  AddRearedLivestockDialogTwoState({
    this.lessThanThreeWe = false,
    this.threeToEightWee = false,
    this.lessThanTwoMont = false,
    this.twoToSixMonths = false,
    this.sixToTwelveMont = false,
    this.oneToTwoYears = false,
    this.twoToFourYears = false,
    this.fourYearsOrOlde = false,
    this.addRearedLivestockDialogTwoModelObj,
  });

  AddRearedLivestockDialogTwoModel? addRearedLivestockDialogTwoModelObj;

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
        lessThanThreeWe,
        threeToEightWee,
        lessThanTwoMont,
        twoToSixMonths,
        sixToTwelveMont,
        oneToTwoYears,
        twoToFourYears,
        fourYearsOrOlde,
        addRearedLivestockDialogTwoModelObj,
      ];
  AddRearedLivestockDialogTwoState copyWith({
    bool? lessThanThreeWe,
    bool? threeToEightWee,
    bool? lessThanTwoMont,
    bool? twoToSixMonths,
    bool? sixToTwelveMont,
    bool? oneToTwoYears,
    bool? twoToFourYears,
    bool? fourYearsOrOlde,
    AddRearedLivestockDialogTwoModel? addRearedLivestockDialogTwoModelObj,
  }) {
    return AddRearedLivestockDialogTwoState(
      lessThanThreeWe: lessThanThreeWe ?? this.lessThanThreeWe,
      threeToEightWee: threeToEightWee ?? this.threeToEightWee,
      lessThanTwoMont: lessThanTwoMont ?? this.lessThanTwoMont,
      twoToSixMonths: twoToSixMonths ?? this.twoToSixMonths,
      sixToTwelveMont: sixToTwelveMont ?? this.sixToTwelveMont,
      oneToTwoYears: oneToTwoYears ?? this.oneToTwoYears,
      twoToFourYears: twoToFourYears ?? this.twoToFourYears,
      fourYearsOrOlde: fourYearsOrOlde ?? this.fourYearsOrOlde,
      addRearedLivestockDialogTwoModelObj:
          addRearedLivestockDialogTwoModelObj ??
              this.addRearedLivestockDialogTwoModelObj,
    );
  }
}

// ignore_for_file: must_be_immutable

part of 'add_reared_livestock_dialog_two_bloc.dart';

/// Represents the state of AddRearedLivestockDialogTwo in the application.
class AddRearedLivestockDialogTwoState extends Equatable {
  AddRearedLivestockDialogTwoState({
    this.lessThanThreeWe = false,
    this.threeToEightWee = false,
    this.addRearedLivestockDialogTwoModelObj,
  });

  AddRearedLivestockDialogTwoModel? addRearedLivestockDialogTwoModelObj;

  bool lessThanThreeWe;

  bool threeToEightWee;

  @override
  List<Object?> get props => [
        lessThanThreeWe,
        threeToEightWee,
        addRearedLivestockDialogTwoModelObj,
      ];
  AddRearedLivestockDialogTwoState copyWith({
    bool? lessThanThreeWe,
    bool? threeToEightWee,
    AddRearedLivestockDialogTwoModel? addRearedLivestockDialogTwoModelObj,
  }) {
    return AddRearedLivestockDialogTwoState(
      lessThanThreeWe: lessThanThreeWe ?? this.lessThanThreeWe,
      threeToEightWee: threeToEightWee ?? this.threeToEightWee,
      addRearedLivestockDialogTwoModelObj:
          addRearedLivestockDialogTwoModelObj ??
              this.addRearedLivestockDialogTwoModelObj,
    );
  }
}

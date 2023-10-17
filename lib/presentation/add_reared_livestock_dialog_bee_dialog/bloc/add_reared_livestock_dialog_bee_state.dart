// ignore_for_file: must_be_immutable

part of 'add_reared_livestock_dialog_bee_bloc.dart';

/// Represents the state of AddRearedLivestockDialogTwo in the application.
class AddRearedLivestockDialogBeeState extends Equatable {
  AddRearedLivestockDialogBeeState({
    this.lessThanThreeWe = false,
    this.threeToEightWee = false,
    this.addRearedLivestockDialogTwoModelObj,
  });

  AddRearedLivestockDialogBeeModel? addRearedLivestockDialogTwoModelObj;

  bool lessThanThreeWe;

  bool threeToEightWee;

  @override
  List<Object?> get props => [
        lessThanThreeWe,
        threeToEightWee,
        addRearedLivestockDialogTwoModelObj,
      ];
  AddRearedLivestockDialogBeeState copyWith({
    bool? lessThanThreeWe,
    bool? threeToEightWee,
    AddRearedLivestockDialogBeeModel? addRearedLivestockDialogTwoModelObj,
  }) {
    return AddRearedLivestockDialogBeeState(
      lessThanThreeWe: lessThanThreeWe ?? this.lessThanThreeWe,
      threeToEightWee: threeToEightWee ?? this.threeToEightWee,
      addRearedLivestockDialogTwoModelObj:
          addRearedLivestockDialogTwoModelObj ??
              this.addRearedLivestockDialogTwoModelObj,
    );
  }
}

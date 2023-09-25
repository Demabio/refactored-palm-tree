// ignore_for_file: must_be_immutable

part of 'add_reared_livestock_dialog_one_bloc.dart';

/// Represents the state of AddRearedLivestockDialogOne in the application.
class AddRearedLivestockDialogOneState extends Equatable {
  AddRearedLivestockDialogOneState({
    this.calfPellets = false,
    this.chickMarsh = false,
    this.homeMadeFeedMix = false,
    this.improvedPasture = false,
    this.manufacturedMea = false,
    this.mineralSalts = false,
    this.ownGrownHay = false,
    this.trash = false,
    this.purchasedFodder = false,
    this.purchasedHay = false,
    this.addRearedLivestockDialogOneModelObj,
  });

  AddRearedLivestockDialogOneModel? addRearedLivestockDialogOneModelObj;

  bool calfPellets;

  bool chickMarsh;

  bool homeMadeFeedMix;

  bool improvedPasture;

  bool manufacturedMea;

  bool mineralSalts;

  bool ownGrownHay;

  bool trash;

  bool purchasedFodder;

  bool purchasedHay;

  @override
  List<Object?> get props => [
        calfPellets,
        chickMarsh,
        homeMadeFeedMix,
        improvedPasture,
        manufacturedMea,
        mineralSalts,
        ownGrownHay,
        trash,
        purchasedFodder,
        purchasedHay,
        addRearedLivestockDialogOneModelObj,
      ];
  AddRearedLivestockDialogOneState copyWith({
    bool? calfPellets,
    bool? chickMarsh,
    bool? homeMadeFeedMix,
    bool? improvedPasture,
    bool? manufacturedMea,
    bool? mineralSalts,
    bool? ownGrownHay,
    bool? trash,
    bool? purchasedFodder,
    bool? purchasedHay,
    AddRearedLivestockDialogOneModel? addRearedLivestockDialogOneModelObj,
  }) {
    return AddRearedLivestockDialogOneState(
      calfPellets: calfPellets ?? this.calfPellets,
      chickMarsh: chickMarsh ?? this.chickMarsh,
      homeMadeFeedMix: homeMadeFeedMix ?? this.homeMadeFeedMix,
      improvedPasture: improvedPasture ?? this.improvedPasture,
      manufacturedMea: manufacturedMea ?? this.manufacturedMea,
      mineralSalts: mineralSalts ?? this.mineralSalts,
      ownGrownHay: ownGrownHay ?? this.ownGrownHay,
      trash: trash ?? this.trash,
      purchasedFodder: purchasedFodder ?? this.purchasedFodder,
      purchasedHay: purchasedHay ?? this.purchasedHay,
      addRearedLivestockDialogOneModelObj:
          addRearedLivestockDialogOneModelObj ??
              this.addRearedLivestockDialogOneModelObj,
    );
  }
}

// ignore_for_file: must_be_immutable

part of 'add_farmtechandassets_five_bloc.dart';

/// Represents the state of AddFarmtechandassetsFive in the application.
class AddFarmtechandassetsFiveState extends Equatable {
  AddFarmtechandassetsFiveState({
    this.animalDraft = false,
    this.gridElectricity = false,
    this.manualvalue = false,
    this.trash = false,
    this.othervalue = false,
    this.solarvalue = false,
    this.windvalue = false,
    this.addFarmtechandassetsFiveModelObj,
  });

  AddFarmtechandassetsFiveModel? addFarmtechandassetsFiveModelObj;

  bool animalDraft;

  bool gridElectricity;

  bool manualvalue;

  bool trash;

  bool othervalue;

  bool solarvalue;

  bool windvalue;

  @override
  List<Object?> get props => [
        animalDraft,
        gridElectricity,
        manualvalue,
        trash,
        othervalue,
        solarvalue,
        windvalue,
        addFarmtechandassetsFiveModelObj,
      ];
  AddFarmtechandassetsFiveState copyWith({
    bool? animalDraft,
    bool? gridElectricity,
    bool? manualvalue,
    bool? trash,
    bool? othervalue,
    bool? solarvalue,
    bool? windvalue,
    AddFarmtechandassetsFiveModel? addFarmtechandassetsFiveModelObj,
  }) {
    return AddFarmtechandassetsFiveState(
      animalDraft: animalDraft ?? this.animalDraft,
      gridElectricity: gridElectricity ?? this.gridElectricity,
      manualvalue: manualvalue ?? this.manualvalue,
      trash: trash ?? this.trash,
      othervalue: othervalue ?? this.othervalue,
      solarvalue: solarvalue ?? this.solarvalue,
      windvalue: windvalue ?? this.windvalue,
      addFarmtechandassetsFiveModelObj: addFarmtechandassetsFiveModelObj ??
          this.addFarmtechandassetsFiveModelObj,
    );
  }
}

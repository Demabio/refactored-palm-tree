// ignore_for_file: must_be_immutable

part of 'add_farmtechandassets_two_bloc.dart';

/// Represents the state of AddFarmtechandassetsTwo in the application.
class AddFarmtechandassetsTwoState extends Equatable {
  AddFarmtechandassetsTwoState({
    this.animalDraft = false,
    this.gridElectricity = false,
    this.manualvalue = false,
    this.trash = false,
    this.othervalue = false,
    this.solarvalue = false,
    this.windvalue = false,
    this.addFarmtechandassetsTwoModelObj,
  });

  AddFarmtechandassetsTwoModel? addFarmtechandassetsTwoModelObj;

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
        addFarmtechandassetsTwoModelObj,
      ];
  AddFarmtechandassetsTwoState copyWith({
    bool? animalDraft,
    bool? gridElectricity,
    bool? manualvalue,
    bool? trash,
    bool? othervalue,
    bool? solarvalue,
    bool? windvalue,
    AddFarmtechandassetsTwoModel? addFarmtechandassetsTwoModelObj,
  }) {
    return AddFarmtechandassetsTwoState(
      animalDraft: animalDraft ?? this.animalDraft,
      gridElectricity: gridElectricity ?? this.gridElectricity,
      manualvalue: manualvalue ?? this.manualvalue,
      trash: trash ?? this.trash,
      othervalue: othervalue ?? this.othervalue,
      solarvalue: solarvalue ?? this.solarvalue,
      windvalue: windvalue ?? this.windvalue,
      addFarmtechandassetsTwoModelObj: addFarmtechandassetsTwoModelObj ??
          this.addFarmtechandassetsTwoModelObj,
    );
  }
}

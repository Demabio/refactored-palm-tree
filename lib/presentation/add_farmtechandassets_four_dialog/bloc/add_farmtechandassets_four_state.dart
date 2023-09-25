// ignore_for_file: must_be_immutable

part of 'add_farmtechandassets_four_bloc.dart';

/// Represents the state of AddFarmtechandassetsFour in the application.
class AddFarmtechandassetsFourState extends Equatable {
  AddFarmtechandassetsFourState({
    this.animalDip = false,
    this.animalCrush = false,
    this.apiaryvalue = false,
    this.beeHouse = false,
    this.catteBoma = false,
    this.feedStore = false,
    this.generalStore = false,
    this.greenHouse = false,
    this.hatcheryvalue = false,
    this.hayBailers = false,
    this.hayStore = false,
    this.loadingRamp = false,
    this.milkingParlor = false,
    this.traditionalGran = false,
    this.addFarmtechandassetsFourModelObj,
  });

  AddFarmtechandassetsFourModel? addFarmtechandassetsFourModelObj;

  bool animalDip;

  bool animalCrush;

  bool apiaryvalue;

  bool beeHouse;

  bool catteBoma;

  bool feedStore;

  bool generalStore;

  bool greenHouse;

  bool hatcheryvalue;

  bool hayBailers;

  bool hayStore;

  bool loadingRamp;

  bool milkingParlor;

  bool traditionalGran;

  @override
  List<Object?> get props => [
        animalDip,
        animalCrush,
        apiaryvalue,
        beeHouse,
        catteBoma,
        feedStore,
        generalStore,
        greenHouse,
        hatcheryvalue,
        hayBailers,
        hayStore,
        loadingRamp,
        milkingParlor,
        traditionalGran,
        addFarmtechandassetsFourModelObj,
      ];
  AddFarmtechandassetsFourState copyWith({
    bool? animalDip,
    bool? animalCrush,
    bool? apiaryvalue,
    bool? beeHouse,
    bool? catteBoma,
    bool? feedStore,
    bool? generalStore,
    bool? greenHouse,
    bool? hatcheryvalue,
    bool? hayBailers,
    bool? hayStore,
    bool? loadingRamp,
    bool? milkingParlor,
    bool? traditionalGran,
    AddFarmtechandassetsFourModel? addFarmtechandassetsFourModelObj,
  }) {
    return AddFarmtechandassetsFourState(
      animalDip: animalDip ?? this.animalDip,
      animalCrush: animalCrush ?? this.animalCrush,
      apiaryvalue: apiaryvalue ?? this.apiaryvalue,
      beeHouse: beeHouse ?? this.beeHouse,
      catteBoma: catteBoma ?? this.catteBoma,
      feedStore: feedStore ?? this.feedStore,
      generalStore: generalStore ?? this.generalStore,
      greenHouse: greenHouse ?? this.greenHouse,
      hatcheryvalue: hatcheryvalue ?? this.hatcheryvalue,
      hayBailers: hayBailers ?? this.hayBailers,
      hayStore: hayStore ?? this.hayStore,
      loadingRamp: loadingRamp ?? this.loadingRamp,
      milkingParlor: milkingParlor ?? this.milkingParlor,
      traditionalGran: traditionalGran ?? this.traditionalGran,
      addFarmtechandassetsFourModelObj: addFarmtechandassetsFourModelObj ??
          this.addFarmtechandassetsFourModelObj,
    );
  }
}

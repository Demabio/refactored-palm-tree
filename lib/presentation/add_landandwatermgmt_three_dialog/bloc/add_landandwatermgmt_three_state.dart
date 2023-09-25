// ignore_for_file: must_be_immutable

part of 'add_landandwatermgmt_three_bloc.dart';

/// Represents the state of AddLandandwatermgmtThree in the application.
class AddLandandwatermgmtThreeState extends Equatable {
  AddLandandwatermgmtThreeState({
    this.biogasProductio = false,
    this.mulchingvalue = false,
    this.trash = false,
    this.terracingvalue = false,
    this.waterHarvesting = false,
    this.fymCompostManur = false,
    this.zaiPits = false,
    this.cutOffDrains = false,
    this.trashone = false,
    this.trashtwo = false,
    this.minimumTillage = false,
    this.deepRipping = false,
    this.manuringCompost = false,
    this.grassStrips = false,
    this.addLandandwatermgmtThreeModelObj,
  });

  AddLandandwatermgmtThreeModel? addLandandwatermgmtThreeModelObj;

  bool biogasProductio;

  bool mulchingvalue;

  bool trash;

  bool terracingvalue;

  bool waterHarvesting;

  bool fymCompostManur;

  bool zaiPits;

  bool cutOffDrains;

  bool trashone;

  bool trashtwo;

  bool minimumTillage;

  bool deepRipping;

  bool manuringCompost;

  bool grassStrips;

  @override
  List<Object?> get props => [
        biogasProductio,
        mulchingvalue,
        trash,
        terracingvalue,
        waterHarvesting,
        fymCompostManur,
        zaiPits,
        cutOffDrains,
        trashone,
        trashtwo,
        minimumTillage,
        deepRipping,
        manuringCompost,
        grassStrips,
        addLandandwatermgmtThreeModelObj,
      ];
  AddLandandwatermgmtThreeState copyWith({
    bool? biogasProductio,
    bool? mulchingvalue,
    bool? trash,
    bool? terracingvalue,
    bool? waterHarvesting,
    bool? fymCompostManur,
    bool? zaiPits,
    bool? cutOffDrains,
    bool? trashone,
    bool? trashtwo,
    bool? minimumTillage,
    bool? deepRipping,
    bool? manuringCompost,
    bool? grassStrips,
    AddLandandwatermgmtThreeModel? addLandandwatermgmtThreeModelObj,
  }) {
    return AddLandandwatermgmtThreeState(
      biogasProductio: biogasProductio ?? this.biogasProductio,
      mulchingvalue: mulchingvalue ?? this.mulchingvalue,
      trash: trash ?? this.trash,
      terracingvalue: terracingvalue ?? this.terracingvalue,
      waterHarvesting: waterHarvesting ?? this.waterHarvesting,
      fymCompostManur: fymCompostManur ?? this.fymCompostManur,
      zaiPits: zaiPits ?? this.zaiPits,
      cutOffDrains: cutOffDrains ?? this.cutOffDrains,
      trashone: trashone ?? this.trashone,
      trashtwo: trashtwo ?? this.trashtwo,
      minimumTillage: minimumTillage ?? this.minimumTillage,
      deepRipping: deepRipping ?? this.deepRipping,
      manuringCompost: manuringCompost ?? this.manuringCompost,
      grassStrips: grassStrips ?? this.grassStrips,
      addLandandwatermgmtThreeModelObj: addLandandwatermgmtThreeModelObj ??
          this.addLandandwatermgmtThreeModelObj,
    );
  }
}

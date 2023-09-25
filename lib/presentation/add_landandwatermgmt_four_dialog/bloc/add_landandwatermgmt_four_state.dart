// ignore_for_file: must_be_immutable

part of 'add_landandwatermgmt_four_bloc.dart';

/// Represents the state of AddLandandwatermgmtFour in the application.
class AddLandandwatermgmtFourState extends Equatable {
  AddLandandwatermgmtFourState({
    this.trash = false,
    this.adjacentWaterBo = false,
    this.localityWaterSu = false,
    this.manMadeDam = false,
    this.waterPan = false,
    this.trashone = false,
    this.roadRunoff = false,
    this.othervalue = false,
    this.rainvalue = false,
    this.harvestedWater = false,
    this.trashtwo = false,
    this.waterTrucking = false,
    this.addLandandwatermgmtFourModelObj,
  });

  AddLandandwatermgmtFourModel? addLandandwatermgmtFourModelObj;

  bool trash;

  bool adjacentWaterBo;

  bool localityWaterSu;

  bool manMadeDam;

  bool waterPan;

  bool trashone;

  bool roadRunoff;

  bool othervalue;

  bool rainvalue;

  bool harvestedWater;

  bool trashtwo;

  bool waterTrucking;

  @override
  List<Object?> get props => [
        trash,
        adjacentWaterBo,
        localityWaterSu,
        manMadeDam,
        waterPan,
        trashone,
        roadRunoff,
        othervalue,
        rainvalue,
        harvestedWater,
        trashtwo,
        waterTrucking,
        addLandandwatermgmtFourModelObj,
      ];
  AddLandandwatermgmtFourState copyWith({
    bool? trash,
    bool? adjacentWaterBo,
    bool? localityWaterSu,
    bool? manMadeDam,
    bool? waterPan,
    bool? trashone,
    bool? roadRunoff,
    bool? othervalue,
    bool? rainvalue,
    bool? harvestedWater,
    bool? trashtwo,
    bool? waterTrucking,
    AddLandandwatermgmtFourModel? addLandandwatermgmtFourModelObj,
  }) {
    return AddLandandwatermgmtFourState(
      trash: trash ?? this.trash,
      adjacentWaterBo: adjacentWaterBo ?? this.adjacentWaterBo,
      localityWaterSu: localityWaterSu ?? this.localityWaterSu,
      manMadeDam: manMadeDam ?? this.manMadeDam,
      waterPan: waterPan ?? this.waterPan,
      trashone: trashone ?? this.trashone,
      roadRunoff: roadRunoff ?? this.roadRunoff,
      othervalue: othervalue ?? this.othervalue,
      rainvalue: rainvalue ?? this.rainvalue,
      harvestedWater: harvestedWater ?? this.harvestedWater,
      trashtwo: trashtwo ?? this.trashtwo,
      waterTrucking: waterTrucking ?? this.waterTrucking,
      addLandandwatermgmtFourModelObj: addLandandwatermgmtFourModelObj ??
          this.addLandandwatermgmtFourModelObj,
    );
  }
}

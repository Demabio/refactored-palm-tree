// ignore_for_file: must_be_immutable

part of 'add_financialandservices_eight_bloc.dart';

/// Represents the state of AddFinancialandservicesEight in the application.
class AddFinancialandservicesEightState extends Equatable {
  AddFinancialandservicesEightState({
    this.eExtension = false,
    this.faceToFace = false,
    this.farmerFieldScho = false,
    this.trash = false,
    this.peerToPeer = false,
    this.othervalue = false,
    this.addFinancialandservicesEightModelObj,
  });

  AddFinancialandservicesEightModel? addFinancialandservicesEightModelObj;

  bool eExtension;

  bool faceToFace;

  bool farmerFieldScho;

  bool trash;

  bool peerToPeer;

  bool othervalue;

  @override
  List<Object?> get props => [
        eExtension,
        faceToFace,
        farmerFieldScho,
        trash,
        peerToPeer,
        othervalue,
        addFinancialandservicesEightModelObj,
      ];
  AddFinancialandservicesEightState copyWith({
    bool? eExtension,
    bool? faceToFace,
    bool? farmerFieldScho,
    bool? trash,
    bool? peerToPeer,
    bool? othervalue,
    AddFinancialandservicesEightModel? addFinancialandservicesEightModelObj,
  }) {
    return AddFinancialandservicesEightState(
      eExtension: eExtension ?? this.eExtension,
      faceToFace: faceToFace ?? this.faceToFace,
      farmerFieldScho: farmerFieldScho ?? this.farmerFieldScho,
      trash: trash ?? this.trash,
      peerToPeer: peerToPeer ?? this.peerToPeer,
      othervalue: othervalue ?? this.othervalue,
      addFinancialandservicesEightModelObj:
          addFinancialandservicesEightModelObj ??
              this.addFinancialandservicesEightModelObj,
    );
  }
}

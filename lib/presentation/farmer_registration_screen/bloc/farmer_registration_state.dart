// ignore_for_file: must_be_immutable

part of 'farmer_registration_bloc.dart';

/// Represents the state of FarmerRegistration in the application.
class FarmerRegistrationState extends Equatable {
  FarmerRegistrationState({
    this.farmerRegistrationModelObj,
    this.fi = false,
    this.fh = false,
    this.ca = false,
    this.ls = false,
    this.ff = false,
    this.at = false,
    this.lw = false,
    this.fs = false,
    this.crop = false,
    this.live = false,
    this.fish = false,
  });

  FarmerRegistrationModel? farmerRegistrationModelObj;
  bool fi;
  bool fh;
  bool ca;
  bool ls;
  bool ff;
  bool at;
  bool lw;
  bool fs;
  bool crop;
  bool live;
  bool fish;

  @override
  List<Object?> get props => [
        farmerRegistrationModelObj,
        fi,
        fh,
        ca,
        ls,
        ff,
        at,
        lw,
        fs,
        fish,
        crop,
        live,
      ];
  FarmerRegistrationState copyWith({
    FarmerRegistrationModel? farmerRegistrationModelObj,
    bool? fi,
    bool? fh,
    bool? ca,
    bool? ls,
    bool? ff,
    bool? at,
    bool? lw,
    bool? fs,
    bool? crop,
    bool? live,
    bool? fish,
  }) {
    return FarmerRegistrationState(
      farmerRegistrationModelObj:
          farmerRegistrationModelObj ?? this.farmerRegistrationModelObj,
      fi: fi ?? this.fi,
      fh: fh ?? this.fh,
      ca: ca ?? this.ca,
      ls: ls ?? this.ls,
      ff: ff ?? this.ff,
      at: at ?? this.at,
      lw: lw ?? this.lw,
      fs: fs ?? this.fs,
      crop: crop ?? this.crop,
      live: live ?? this.live,
      fish: fish ?? this.fish,
    );
  }
}

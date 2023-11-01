// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/process_status.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';

/// This class defines the variables used in the [farmer_registration_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FarmerRegistrationModel extends Equatable {
  FarmerRegistrationModel({
    this.processStatus,
    this.farm,
    this.currentStep = 0,
    this.fi = false,
    this.fh = false,
    this.ca = false,
    this.ls = false,
    this.ff = false,
    this.at = false,
    this.lw = false,
    this.fs = false,
    this.fi2 = false,
    this.fh2 = false,
    this.ca2 = false,
    this.ls2 = false,
    this.ff2 = false,
    this.at2 = false,
    this.lw2 = false,
    this.fs2 = false,
    this.crop = StepState.indexed,
    this.live = StepState.indexed,
    this.fish = StepState.indexed,
    this.fid = StepState.indexed,
    this.fsv = StepState.indexed,
    this.land = StepState.indexed,
    this.finance = StepState.indexed,
    this.tech = StepState.indexed,
  });

  ProcessStatus? processStatus;

  FarmerFarm? farm;
  bool fi;
  bool fh;
  bool ca;
  bool ls;
  bool ff;
  bool at;
  bool lw;
  bool fs;
  bool fi2;
  bool fh2;
  bool ca2;
  bool ls2;
  bool ff2;
  bool at2;
  bool lw2;
  bool fs2;
  StepState crop;
  StepState live;
  StepState fish;
  StepState tech;
  StepState land;
  StepState finance;
  StepState fid;
  StepState fsv;

  int currentStep;
  FarmerRegistrationModel copyWith({
    ProcessStatus? processStatus,
    FarmerFarm? farmer,
    int? currentStep,
    bool? fi,
    bool? fh,
    bool? ca,
    bool? ls,
    bool? ff,
    bool? at,
    bool? lw,
    bool? fs,
    bool? fi2,
    bool? fh2,
    bool? ca2,
    bool? ls2,
    bool? ff2,
    bool? at2,
    bool? lw2,
    bool? fs2,
    StepState? crop,
    StepState? live,
    StepState? fish,
    StepState? tech,
    StepState? land,
    StepState? finance,
    StepState? fid,
    StepState? fsv,
  }) {
    return FarmerRegistrationModel(
      processStatus: processStatus ?? this.processStatus,
      farm: farm ?? this.farm,
      currentStep: currentStep ?? this.currentStep,
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
      tech: tech ?? this.tech,
      land: land ?? this.land,
      finance: finance ?? this.finance,
      fi2: fi2 ?? this.fi2,
      fh2: fh2 ?? this.fh2,
      ca2: ca2 ?? this.ca2,
      ls2: ls2 ?? this.ls2,
      ff2: ff2 ?? this.ff2,
      at2: at2 ?? this.at2,
      lw2: lw2 ?? this.lw2,
      fs2: fs2 ?? this.fs2,
      fid: fid ?? this.fid,
      fsv: fsv ?? this.fsv,
    );
  }

  @override
  List<Object?> get props => [
        finance,
        land,
        tech,
        processStatus,
        farm,
        currentStep,
        fi,
        fh,
        ca,
        ls,
        ff,
        at,
        lw,
        fs,
        fi2,
        fh2,
        ca2,
        ls2,
        ff2,
        at2,
        lw2,
        fs2,
        fish,
        crop,
        live,
        fid,
        fsv,
      ];
}

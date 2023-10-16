import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/aqua_progress.dart';
import 'package:kiamis_app/data/models/dbModels/processes/assets_tech_progress.dart';
import 'package:kiamis_app/data/models/dbModels/processes/crop_agri.dart';
import 'package:kiamis_app/data/models/dbModels/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/data/models/dbModels/processes/livestock_progress.dart';
import 'package:kiamis_app/data/models/dbModels/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/models/dbModels/processes/process_status.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/crops/crop.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestock.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/aqua_progress.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/assets_tech_progress.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/crop_agri.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/financial_services.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/land_water_progress.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/livestock_input.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/livestock_progress.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/process_status.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/crop/crops.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farm.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/livestock.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/farmer_registration_screen/models/farmer_registration_model.dart';
part 'farmer_registration_event.dart';
part 'farmer_registration_state.dart';

/// A bloc that manages the state of a FarmerRegistration according to the event that is dispatched to it.
class FarmerRegistrationBloc
    extends Bloc<FarmerRegistrationEvent, FarmerRegistrationState> {
  FarmerRegistrationBloc(FarmerRegistrationState initialState)
      : super(initialState) {
    on<FarmerRegistrationInitialEvent>(_onInitialize);
    on<StepDownEvent>(_onSteppedDown);
    on<OnSteppedEvent>(_onStepped);
    on<StepUpEvent>(_onSteppedUp);
    on<CompleteEvent>(_completeRegistration);
  }

  ProcessStatus getRegProgress() {
    if (PrefUtils().getAddorEdit()) {
      int farmerid = PrefUtils().getFarmerId();
      if (farmerid != 0) {
        ProcessStatusDB processStatusDB = ProcessStatusDB();
        processStatusDB.fetchByFarmerId(farmerid).then((value) {
          return ProcessStatus(
            farmerId: value.farmerId,
            farmeridentification: value.farmeridentification,
            primaryfarmholding: value.primaryfarmholding,
            cropAgriculture: value.cropAgriculture,
            livestock: value.cropAgriculture,
            aquaculture: value.aquaculture,
            farmAssets: value.farmAssets,
            landWater: value.landWater,
            financialServices: value.financialServices,
          );
        });
      }
    }

    return ProcessStatus(
      farmerId: 0,
      farmeridentification: 0,
      primaryfarmholding: 0,
      cropAgriculture: 0,
      livestock: 0,
      aquaculture: 0,
      farmAssets: 0,
      landWater: 0,
      financialServices: 0,
    );
  }

  Farmer getFarmer() {
    if (PrefUtils().getAddorEdit()) {
      int farmerid = PrefUtils().getFarmerId();
      if (farmerid != 0) {
        FarmerDB farmerDB = FarmerDB();
        farmerDB.fetchByFarmerId(farmerid).then((value) {
          return Farmer(
            farmerId: value!.farmerId,
            farmerName: value.farmerName,
            cropProd: value.cropProd,
            livestockProd: value.livestockProd,
            fishFarming: value.fishFarming,
          );
        });
      }
    }

    return Farmer(
      farmerId: 0,
      farmerName: "NA",
    );
  }

  _onSteppedDown(
    StepDownEvent event,
    Emitter<FarmerRegistrationState> emit,
  ) {
    emit(
      state.copyWith(
        farmerRegistrationModelObj: state.farmerRegistrationModelObj?.copyWith(
          currentStep: --state.farmerRegistrationModelObj?.currentStep,
        ),
      ),
    );
  }

  _onSteppedUp(
    StepUpEvent event,
    Emitter<FarmerRegistrationState> emit,
  ) {
    emit(
      state.copyWith(
        farmerRegistrationModelObj: state.farmerRegistrationModelObj?.copyWith(
          currentStep: ++state.farmerRegistrationModelObj?.currentStep,
        ),
      ),
    );
  }

  _onStepped(
    OnSteppedEvent event,
    Emitter<FarmerRegistrationState> emit,
  ) {
    emit(
      state.copyWith(
        farmerRegistrationModelObj: state.farmerRegistrationModelObj?.copyWith(
          currentStep: event.value,
        ),
      ),
    );
  }

  Future<CAProgress?> getCAProgress(int? id) async {
    // int cropid = PrefUtils().getCropId();
    CAProgressDB caProgressDB = CAProgressDB();
    return id != null ? await caProgressDB.fetchByCropId(id) : null;
  }

  Future<PFProgress?> getFHProgress() async {
    int id = PrefUtils().getFarmId();
    PFProgressDB pfProgressDB = PFProgressDB();
    return await pfProgressDB.fetchByFarmId(id);
  }

  Future<FIProgress?> getFIProgress() async {
    int farmerid = PrefUtils().getFarmerId();
    FIProgressDB fiProgressDB = FIProgressDB();
    return await fiProgressDB.fetchByFarmerId(farmerid);
  }

  Future<FSProgress?> getFSProgress() async {
    int farmerid = PrefUtils().getFarmId();
    FSProgressDB pfProgressDB = FSProgressDB();
    return await pfProgressDB.fetchByFarm(farmerid);
  }

  Future<FarmerFarm?> getFarm() async {
    int id = PrefUtils().getFarmerId();
    FarmerFarmDB farmerFishProductionLevelsDB = FarmerFarmDB();
    return await farmerFishProductionLevelsDB.fetchByFarmerFarmId(id);
  }

  _completeRegistration(
      CompleteEvent event, Emitter<FarmerRegistrationState> emit) async {
    int id = PrefUtils().getFarmerId();
    FarmerFarmDB farmerFishProductionLevelsDB = FarmerFarmDB();
    int complete = await farmerFishProductionLevelsDB.completed(id);
    if (complete > 0) {
      event.onSuccess!.call();
    } else {
      event.onFailed!.call();
    }
  }

  Future<List<FarmerCrop>?> getCrops() async {
    int id = PrefUtils().getFarmerId();
    FarmerCropsDB farmerFishProductionLevelsDB = FarmerCropsDB();
    return await farmerFishProductionLevelsDB.fetchAllByFarm(id);
  }

  Future<List<FarmerLivestock>?> getLuvestocks() async {
    int id = PrefUtils().getFarmId();
    FarmerLivestockDB farmerFishProductionLevelsDB = FarmerLivestockDB();
    return await farmerFishProductionLevelsDB.fetchByFarm(id);
  }

  Future<LSProgress?> getLSProgress(int? id) async {
    //int id = PrefUtils().getFarmId();
    LSProgressDB pfProgressDB = LSProgressDB();
    return id != null ? await pfProgressDB.fetchByLivestock(id) : null;
  }

  Future<PFProgress?> getLSIProgress() async {
    int id = PrefUtils().getFarmId();
    LSIProgressDB pfProgressDB = LSIProgressDB();
    return await pfProgressDB.fetchByFarmId(id);
  }

  Future<AQProgress?> getAQProgress() async {
    int id = PrefUtils().getFarmId();
    AQProgressDB pfProgressDB = AQProgressDB();
    return await pfProgressDB.fetchByFarmId(id);
  }

  Future<ATProgress?> getATProgress() async {
    int farmerid = PrefUtils().getFarmId();
    ATProgressDB pfProgressDB = ATProgressDB();
    return await pfProgressDB.fetchByFarm(farmerid);
  }

  Future<LWProgress?> getLWProgress() async {
    int id = PrefUtils().getFarmId();
    LWProgressDB pfProgressDB = LWProgressDB();
    return await pfProgressDB.fetchByFarm(id);
  }

  _onInitialize(
    FarmerRegistrationInitialEvent event,
    Emitter<FarmerRegistrationState> emit,
  ) async {
    List<FarmerCrop>? crops = await getCrops();

    List<FarmerLivestock>? livestock = await getLuvestocks();

    int? livestockid =
        livestock != null ? livestock.last.farmerLivestockId : null;

    int? cropid = crops != null ? crops?.last.farmerCropId : null;

    LWProgress lwProgress = await getLWProgress() ??
        LWProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    ATProgress atProgress = await getATProgress() ??
        ATProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    AQProgress aqProgress = await getAQProgress() ??
        AQProgress(
          farmId: PrefUtils().getFarmId(),
          pageOne: 0,
          pageTwo: 0,
        );
    FarmerFarm farm = await getFarm() ??
        FarmerFarm(
          farmerId: 0,
          farmerFarmId: 0,
          cropProd: false,
          livestockProd: false,
          fishFarming: false,
        );
    LSProgress lsProgress = await getLSProgress(livestockid) ??
        LSProgress(
          livestockId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    CAProgress caProgress = await getCAProgress(cropid) ??
        CAProgress(
          cropId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    PFProgress fhProgress = await getFHProgress() ??
        PFProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    FSProgress fsProgress = await getFSProgress() ??
        FSProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    FIProgress fiProgress = await getFIProgress() ??
        FIProgress(
          farmerId: 0,
          pageOne: 0,
          pageTwo: 0,
          pageThree: 0,
          pageFour: 0,
        );
    PFProgress lsiProgress = await getLSIProgress() ??
        PFProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    StepState a = StepState.indexed;
    StepState b = StepState.indexed;
    StepState c = StepState.indexed;
    StepState d = StepState.indexed;
    if (farm.cropProd!) {
      if (caProgress.pageOne == 1 && caProgress.pageTwo == 1) {
        a = StepState.complete;
      }
    } else {
      a = StepState.disabled;
    }
    if (farm.livestockProd!) {
      if (lsProgress.pageOne == 1 && lsiProgress.pageOne == 1) {
        b = StepState.complete;
      }
    } else {
      b = StepState.disabled;
    }
    if (farm.fishFarming!) {
      if (aqProgress.pageOne == 1 && aqProgress.pageTwo == 1) {
        c = StepState.complete;
      }
    } else {
      c = StepState.disabled;
    }
    if (!PrefUtils().getFound()) {
      if (fiProgress.pageOne == 1 ||
          fiProgress.pageTwo == 1 ||
          fiProgress.pageThree == 1) {
        d = StepState.complete;
      }
    } else {
      d = StepState.disabled;
    }
    emit(state.copyWith(
        farmerRegistrationModelObj: state.farmerRegistrationModelObj?.copyWith(
      processStatus: getRegProgress(),
      fi: (fiProgress.pageOne == 1 ||
          fiProgress.pageTwo == 1 ||
          fiProgress.pageThree == 1),
      fh: (fhProgress.pageOne == 1 || fhProgress.pageTwo == 1),
      ca: (caProgress.pageOne == 1 || caProgress.pageTwo == 1 || crops != null),
      ls: (lsProgress.pageOne == 1 ||
          lsiProgress.pageOne == 1 ||
          livestock != null),
      ff: (aqProgress.pageOne == 1 || aqProgress.pageTwo == 1),
      at: (atProgress.pageOne == 1 || atProgress.pageTwo == 1),
      lw: (lwProgress.pageOne == 1 || lwProgress.pageTwo == 1),
      fs: (fsProgress.pageOne == 1 || fsProgress.pageTwo == 1),
      crop: a,
      fish: c,
      live: b, fid: d,
      fi2: (fiProgress.pageOne == 1 &&
          fiProgress.pageTwo == 1 &&
          fiProgress.pageOne == 1),
      fh2: (fhProgress.pageOne == 1 && fhProgress.pageTwo == 1),
      ca2: (caProgress.pageOne == 1 && caProgress.pageTwo == 1),
      ls2: (lsProgress.pageOne == 1 && lsiProgress.pageOne == 1),
      ff2: (aqProgress.pageOne == 1 && aqProgress.pageTwo == 1),
      at2: (atProgress.pageOne == 1 && atProgress.pageTwo == 1),
      lw2: (lwProgress.pageOne == 1 && lwProgress.pageTwo == 1),
      fs2: (fsProgress.pageOne == 1 && fsProgress.pageTwo == 1),
      //farmer: getFarmer(),
    )));
  }
}

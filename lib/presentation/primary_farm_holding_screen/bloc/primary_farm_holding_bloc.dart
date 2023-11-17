import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/crops/cropareaunit.dart';
import 'package:kiamis_app/data/models/dbModels/farm/farmownership.dart';
import 'package:kiamis_app/data/models/dbModels/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/enterprise.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropareaunit.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmownership.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/enterpirses.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farm.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/enterprise.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/enterprisesmodel.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_screen/models/primary_farm_holding_model.dart';
part 'primary_farm_holding_event.dart';
part 'primary_farm_holding_state.dart';

/// A bloc that manages the state of a PrimaryFarmHolding according to the event that is dispatched to it.
class PrimaryFarmHoldingBloc
    extends Bloc<PrimaryFarmHoldingEvent, PrimaryFarmHoldingState> {
  PrimaryFarmHoldingBloc(PrimaryFarmHoldingState initialState)
      : super(initialState) {
    on<PrimaryFarmHoldingInitialEvent>(_onInitialize);
  }

  Future<FarmerFarm?> getFarm() async {
    int farmid = PrefUtils().getFarmId();
    FarmerFarmDB farmDB = FarmerFarmDB();
    return await farmDB.fetchByFarmerFarmId(farmid);
  }

  Future<PFProgress?> getProgress() async {
    int id = PrefUtils().getFarmId();
    PFProgressDB pfProgressDB = PFProgressDB();
    return await pfProgressDB.fetchByFarmId(id);
  }

  Future<List<FarmerEnterprise>?> getEnterprises() async {
    int farmid = PrefUtils().getFarmId();
    FarmerEnterprisesDB farmerEnterprisesDB = FarmerEnterprisesDB();
    return await farmerEnterprisesDB.fetchAllByFarmId(farmid);
  }

  Future<FarmerFarmOwnership?> getOwner(int id) async {
    FarmerFarmOwnershipDB farmOwnershipDB = FarmerFarmOwnershipDB();

    return farmOwnershipDB.fetchByOwnershipId(id);
  }

  Future<CropAreaUnit?> getArea(int id) async {
    CropAreaUnitDB cropAreaUnitDB = CropAreaUnitDB();

    return cropAreaUnitDB.fetchByAreaUnitId(id);
  }

  Future<List<EnterpriseModel>> fetchEnterprises() async {
    List<EnterpriseModel> list = [];
    EnterprisesDB enterprisesDB = EnterprisesDB();

    await enterprisesDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(EnterpriseModel(
          title: value[i].enterpriseDesc,
          enterpriseId: value[i].enterpriseId,
        ));
      }
    });
    return list;
  }

  Future<PFProgress?> getFHProgress() async {
    int id = PrefUtils().getFarmId();
    PFProgressDB pfProgressDB = PFProgressDB();
    return await pfProgressDB.fetchByFarmId(id);
  }

  _onInitialize(
    PrimaryFarmHoldingInitialEvent event,
    Emitter<PrimaryFarmHoldingState> emit,
  ) async {
    FarmerFarm farm = await getFarm() ??
        FarmerFarm(
          farmerId: 0,
          farmerFarmId: 0,
          ownershipId: 1,
          cropProd: false,
          livestockProd: false,
          fishFarming: false,
          farmSize: 0,
          cropFarmSize: 0,
          livestockFarmSize: 0,
          leasedFarmSize: 0,
          idleFarmSize: 0,
          x: 0,
          y: 0,
          accuracyLevel: 0,
        );
    PFProgress fhProgress = await getFHProgress() ??
        PFProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    CropAreaUnit? level = await getArea(farm.areaUnitId ?? 1);
    FarmerFarmOwnership? relationship = await getOwner(farm.ownershipId ?? 1);

    List<FarmerEnterprise> farments = await getEnterprises() ?? [];
    List<EnterpriseModel> ents = await fetchEnterprises();
    for (var ent in farments) {
      int index =
          ents.indexWhere((obj) => obj.enterpriseId == ent.enterpriseId);

      ents[index].isSelected = true;
    }

    emit(
      state.copyWith(
        next2: farm.livestockProd,
        next: farm.cropProd,
        prev: farm.fishFarming,
        done: fhProgress.pageOne == 1 || fhProgress.pageTwo == 1,
        primaryFarmHoldingModelObj: state.primaryFarmHoldingModelObj?.copyWith(
          farm: farm,
          area: level?.areaUnit ?? "Not Applied",
          owner: relationship?.ownershipDesc ?? "Not Applied",
          enterprises: ents,
        ),
      ),
    );
  }
}

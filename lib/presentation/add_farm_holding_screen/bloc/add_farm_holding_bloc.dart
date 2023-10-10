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
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/otherfarms.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/enterprise.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/enterprisesmodel.dart';
import '../models/farm_item_model.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_farm_holding_screen/models/add_farm_holding_model.dart';
part 'add_farm_holding_event.dart';
part 'add_farm_holding_state.dart';

/// A bloc that manages the state of a AddFarmHolding according to the event that is dispatched to it.
class AddFarmHoldingBloc
    extends Bloc<AddFarmHoldingEvent, AddFarmHoldingState> {
  AddFarmHoldingBloc(AddFarmHoldingState initialState) : super(initialState) {
    on<AddFarmHoldingInitialEvent>(_onInitialize);
    on<AddEditEvent>(_addEdit);
  }

  Future<List<FarmerFarm>?> getFarm() async {
    int farmerid = PrefUtils().getFarmId();
    FarmerOtherFarmDB farmDB = FarmerOtherFarmDB();
    return await farmDB.fetchAllByFarmer(farmerid);
  }

  Future<PFProgress?> getProgress() async {
    int farmerid = PrefUtils().getFarmId();
    PFProgressDB pfProgressDB = PFProgressDB();
    return await pfProgressDB.fetchByFarmerId(farmerid);
  }

  Future<List<FarmerEnterprise>?> getEnterprises(int id) async {
    FarmerEnterprisesDB farmerEnterprisesDB = FarmerEnterprisesDB();
    return await farmerEnterprisesDB.fetchAllByFarmId(id);
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

  _addEdit(
    AddEditEvent event,
    Emitter<AddFarmHoldingState> emit,
  ) {
    if (event.value! == 1) {
      PrefUtils().setCropId(event.crop!);
      event.createSuccessful!.call();
    } else {
      PrefUtils().setCropId(0);
      event.createSuccessful!.call();
    }
  }

  _onInitialize(
    AddFarmHoldingInitialEvent event,
    Emitter<AddFarmHoldingState> emit,
  ) async {
    List<FarmerFarm> farms = await getFarm() ?? [];

    List<FarmdetailsItemModel> farmmodels = [];

    for (var farm in farms) {
      CropAreaUnit? level = await getArea(farm.areaUnitId ?? 1);
      FarmerFarmOwnership? relationship = await getOwner(farm.ownershipId ?? 1);
      List<FarmerEnterprise> farments =
          await getEnterprises(farm.farmerFarmId) ?? [];
      List<EnterpriseModel> ents = await fetchEnterprises();
      for (var ent in farments) {
        int index =
            ents.indexWhere((obj) => obj.enterpriseId == ent.enterpriseId);

        ents[index].isSelected = true;
      }
      farmmodels.add(FarmdetailsItemModel(
        //   crop: crop,
        id: farm.farmerFarmId,
        totalAcreage: farm.farmSize.toString(),
        name: farm!.farmName,
        unitOfArea: level!.areaUnit,
        livestock: farm.livestockFarmSize.toString(),
        crop: farm.cropFarmSize.toString(),
        lease: farm.leasedFarmSize.toString(),
        idle: farm.idleFarmSize.toString(),
        landsize: farm.farmSize.toString(),
        enterprises: ents,
      ));
    }

    emit(state.copyWith(
        addFarmHoldingModelObj: state.addFarmHoldingModelObj?.copyWith(
      farms: farmmodels,
    )));
  }
}

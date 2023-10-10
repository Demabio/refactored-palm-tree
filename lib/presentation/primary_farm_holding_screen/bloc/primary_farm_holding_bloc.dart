import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/enterprise.dart';
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
    int farmerid = PrefUtils().getFarmId();
    PFProgressDB pfProgressDB = PFProgressDB();
    return await pfProgressDB.fetchByFarmerId(farmerid);
  }

  Future<List<FarmerEnterprise>?> getEnterprises() async {
    int farmid = PrefUtils().getFarmId();
    FarmerEnterprisesDB farmerEnterprisesDB = FarmerEnterprisesDB();
    return await farmerEnterprisesDB.fetchAllByFarmId(farmid);
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

  _onInitialize(
    PrimaryFarmHoldingInitialEvent event,
    Emitter<PrimaryFarmHoldingState> emit,
  ) async {}
}

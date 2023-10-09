import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/other/educationlevel.dart';
import 'package:kiamis_app/data/models/dbModels/other/maritalstatus.dart';
import 'package:kiamis_app/data/models/dbModels/other/respondentrelationship.dart';
import 'package:kiamis_app/data/models/dbModels/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/educationlevel.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/maritalstatus.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/respondentrelationship.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/farmers_identification_screen/models/farmers_identification_model.dart';
part 'farmers_identification_event.dart';
part 'farmers_identification_state.dart';

/// A bloc that manages the state of a FarmersIdentification according to the event that is dispatched to it.
class FarmersIdentificationBloc
    extends Bloc<FarmersIdentificationEvent, FarmersIdentificationState> {
  FarmersIdentificationBloc(FarmersIdentificationState initialState)
      : super(initialState) {
    on<FarmersIdentificationInitialEvent>(_onInitialize);
  }

  Future<Farmer?> getFarmer() async {
    int farmerid = PrefUtils().getFarmerId();
    FarmerDB farmerDB = FarmerDB();
    return await farmerDB.fetchByFarmerId(farmerid);
  }

  Future<FIProgress?> getProgress() async {
    int farmerid = PrefUtils().getFarmerId();
    FIProgressDB fiProgressDB = FIProgressDB();
    return await fiProgressDB.fetchByFarmerId(farmerid);
  }

  Future<MaritalStatus?> getMarstatus(int id) async {
    MaritalStatusDB maritalStatusDB = MaritalStatusDB();

    return maritalStatusDB.fetchByMaritalStatusId(id);
  }

  Future<EducationLevel?> getEducation(int id) async {
    EducationLevelDB educationLevelDB = EducationLevelDB();

    return educationLevelDB.fetchByEducationLevelId(id);
  }

  Future<RespondentRelationship?> getRship(int id) async {
    RespondentRelationshipDB maritalStatusDB = RespondentRelationshipDB();

    return maritalStatusDB.fetchByRespondentRelationshipId(id);
  }

  _onInitialize(
    FarmersIdentificationInitialEvent event,
    Emitter<FarmersIdentificationState> emit,
  ) async {
    Farmer farmer = await getFarmer() ??
        Farmer(
          farmerId: 0,
          farmerName: "NA",
        );
    EducationLevel? level = await getEducation(farmer.educationLevelId ?? 0);
    RespondentRelationship? relationship =
        await getRship(farmer.respondentRlshpId ?? 0);
    MaritalStatus? maritalStatus =
        await getMarstatus(farmer.maritalStatusId ?? 0);

    emit(state.copyWith(
      farmersIdentificationModelObj:
          state.farmersIdentificationModelObj?.copyWith(
        farmer: farmer,
        marital: maritalStatus?.maritalStatus ?? "N/A",
        rship: relationship?.rlshpToFarmer ?? "N/A",
        ed: level?.educationLevel ?? "N/A",
      ),
    ));
  }
}

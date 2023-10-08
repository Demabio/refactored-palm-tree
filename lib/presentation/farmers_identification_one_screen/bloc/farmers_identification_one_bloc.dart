import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/farmers_identification_one_screen/models/farmers_identification_one_model.dart';
part 'farmers_identification_one_event.dart';
part 'farmers_identification_one_state.dart';

/// A bloc that manages the state of a FarmersIdentificationOne according to the event that is dispatched to it.
class FarmersIdentificationOneBloc
    extends Bloc<FarmersIdentificationOneEvent, FarmersIdentificationOneState> {
  FarmersIdentificationOneBloc(FarmersIdentificationOneState initialState)
      : super(initialState) {
    on<FarmersIdentificationOneInitialEvent>(_onInitialize);
    on<StepDownEvent>(_onSteppedDown);
    on<OnSteppedEvent>(_onStepped);
    on<StepUpEvent>(_onSteppedUp);
    on<NextTapEvent>(_nextTap);
    on<SaveTapEvent>(_saveTap);
  }
  FIProgress getProgress() {
    if (PrefUtils().getAddorEdit()) {
      int farmerid = PrefUtils().getFarmerId();
      if (farmerid != 0) {
        FIProgressDB fiProgressDB = FIProgressDB();
        fiProgressDB.fetchByFarmerId(farmerid).then((value) {
          return FIProgress(
            farmerId: value!.farmerId,
            pageOne: value.pageOne,
            pageTwo: value.pageTwo,
            pageThree: value.pageThree,
            pageFour: value.pageFour,
          );
        });
      }
    }

    return FIProgress(
      farmerId: 0,
      pageOne: 0,
      pageTwo: 0,
      pageThree: 0,
      pageFour: 0,
    );
  }

  _onSteppedDown(
    StepDownEvent event,
    Emitter<FarmersIdentificationOneState> emit,
  ) {
    emit(
      state.copyWith(
        farmersIdentificationOneModelObj:
            state.farmersIdentificationOneModelObj?.copyWith(
          stepped: --state.farmersIdentificationOneModelObj?.stepped,
          page1: state.farmersIdentificationOneModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.farmersIdentificationOneModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.farmersIdentificationOneModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.farmersIdentificationOneModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onSteppedUp(
    StepUpEvent event,
    Emitter<FarmersIdentificationOneState> emit,
  ) {
    emit(
      state.copyWith(
        farmersIdentificationOneModelObj:
            state.farmersIdentificationOneModelObj?.copyWith(
          stepped: ++state.farmersIdentificationOneModelObj?.stepped,
          page1: state.farmersIdentificationOneModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.farmersIdentificationOneModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.farmersIdentificationOneModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.farmersIdentificationOneModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onStepped(
    OnSteppedEvent event,
    Emitter<FarmersIdentificationOneState> emit,
  ) {
    emit(
      state.copyWith(
        farmersIdentificationOneModelObj:
            state.farmersIdentificationOneModelObj?.copyWith(
          stepped: event.value,
          page1: event.value! > 0 ? StepState.complete : StepState.indexed,
          page2: event.value! > 1 ? StepState.complete : StepState.indexed,
          page3: event.value! > 2 ? StepState.complete : StepState.indexed,
          page4: event.value! > 3 ? StepState.complete : StepState.indexed,
        ),
      ),
    );
  }

  _nextTap(
    NextTapEvent event,
    Emitter<FarmersIdentificationOneState> emit,
  ) {
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);
    FarmerDB farmerDB = FarmerDB();
    if (PrefUtils().getAddorEdit()) {
      int farmerid = PrefUtils().getFarmerId();
      if (farmerid != 0) {
        farmerDB.updatePageOne(state.farmersIdentificationOneModelObj!.farmer!);
      }
    }
    try {
      farmerDB
          .insertNonNullable(Farmer(
        farmerId: 0,
        farmerName: state.nameController1!.text,
        villageName: state.nameController?.text ?? "NA",
        shoppingCenter: state.shoppingCenterController?.text ?? "NA",
        idNo: state.areaNumberController!.text,
        dateCreated: DateTime.now(),
        createdBy: userId,
      ))
          .then((value) {
        if (value > 0) {
          PrefUtils().setFarmerId(value);
          event.createSuccessful!.call();
        } else {
          event.createFailed!.call();
        }
      });
    } catch (e) {
      event.createFailed!.call();
    }
  }

  _saveTap(
    SaveTapEvent event,
    Emitter<FarmersIdentificationOneState> emit,
  ) {
    FarmerDB farmerDB = FarmerDB();

    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);

    if (PrefUtils().getAddorEdit()) {
      int farmerid = PrefUtils().getFarmerId();
      if (farmerid != 0) {
        farmerDB.updatePageOne(state.farmersIdentificationOneModelObj!.farmer!);
      }
    }
    try {
      farmerDB
          .insertNonNullable(Farmer(
        farmerId: 0,
        farmerName: state.nameController1!.text,
        idNo: state.areaNumberController!.text,
        villageName: state.nameController?.text ?? "NA",
        shoppingCenter: state.shoppingCenterController?.text ?? "NA",
        dateCreated: DateTime.now(),
        createdBy: userId,
      ))
          .then((value) {
        if (value > 0) {
          PrefUtils().setFarmerId(value);
          event.createSuccessful!.call();
        } else {
          event.createFailed!.call();
        }
      });
    } catch (e) {
      event.createFailed!.call();
    }
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
            villageName: value.villageName,
            shoppingCenter: value.shoppingCenter,
          );
        });
      }
    }

    return Farmer(
      farmerId: 0,
      farmerName: "NA",
    );
  }

  _onInitialize(
    FarmersIdentificationOneInitialEvent event,
    Emitter<FarmersIdentificationOneState> emit,
  ) async {
    emit(
      state.copyWith(
          nameController: TextEditingController(),
          areaNumberController: TextEditingController(),
          shoppingCenterController: TextEditingController(),
          nameController1: TextEditingController(),
          farmersIdentificationOneModelObj:
              state.farmersIdentificationOneModelObj?.copyWith(
            fiProgress: getProgress(),
            farmer: getFarmer(),
          )),
    );
  }
}

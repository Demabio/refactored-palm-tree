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
    on<LoadFarmerDataEvent>(_loadData);
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
    try {
      if (state.farmersIdentificationOneModelObj!.fiProgress!.pageOne == 0) {
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

            farmerDB.updatePageOne(Farmer(
              farmerId: value,
              farmerName: state.nameController1!.text,
              villageName: state.nameController?.text ?? "NA",
              shoppingCenter: state.shoppingCenterController?.text ?? "NA",
              idNo: state.areaNumberController!.text,
              dateCreated: DateTime.now(),
              createdBy: userId,
            ));
            FIProgressDB fiProgressDB = FIProgressDB();
            if (state.farmersIdentificationOneModelObj!.fiProgress!.pageOne ==
                0) {
              fiProgressDB
                  .insert(FIProgress(
                    farmerId: value,
                    pageOne: 1,
                    pageTwo: 0,
                    pageThree: 0,
                    pageFour: 0,
                  ))
                  .then((value) => print("Scope FI" + value.toString()));
            } else {
              fiProgressDB
                  .update(FIProgress(
                    farmerId: value,
                    pageOne: 1,
                    pageTwo: state
                        .farmersIdentificationOneModelObj!.fiProgress!.pageTwo,
                    pageThree: state.farmersIdentificationOneModelObj!
                        .fiProgress!.pageThree,
                    pageFour: state
                        .farmersIdentificationOneModelObj!.fiProgress!.pageFour,
                  ))
                  .then((value) => print("Scope FI" + value.toString()));
            }
          } else {
            event.createFailed!.call();
          }
        });
      }
      if (state.farmersIdentificationOneModelObj!.fiProgress!.pageOne == 1) {
        int farmerid = PrefUtils().getFarmerId();
        if (farmerid != 0) {
          farmerDB
              .updatePageOne(Farmer(
                farmerId: PrefUtils().getFarmerId(),
                farmerName: state.nameController1!.text,
                villageName: state.nameController?.text ?? "NA",
                shoppingCenter: state.shoppingCenterController?.text ?? "NA",
                idNo: state.areaNumberController!.text,
                dateCreated: DateTime.now(),
                createdBy: userId,
              ))
              .then((value) => print(
                    "Updated scop: " + value.toString(),
                  ));
        }
      }
    } catch (e) {
      event.createFailed!.call();
    }

    event.createSuccessful!.call();
  }

  _saveTap(
    SaveTapEvent event,
    Emitter<FarmersIdentificationOneState> emit,
  ) {
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);
    FarmerDB farmerDB = FarmerDB();
    try {
      if (state.farmersIdentificationOneModelObj!.fiProgress!.pageOne == 0) {
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

            farmerDB.updatePageOne(Farmer(
              farmerId: value,
              farmerName: state.nameController1!.text,
              villageName: state.nameController?.text ?? "NA",
              shoppingCenter: state.shoppingCenterController?.text ?? "NA",
              idNo: state.areaNumberController!.text,
              dateCreated: DateTime.now(),
              createdBy: userId,
            ));
            FIProgressDB fiProgressDB = FIProgressDB();
            if (state.farmersIdentificationOneModelObj!.fiProgress!.pageOne ==
                0) {
              fiProgressDB
                  .insert(FIProgress(
                    farmerId: value,
                    pageOne: 1,
                    pageTwo: 0,
                    pageThree: 0,
                    pageFour: 0,
                  ))
                  .then((value) => print("Scope FI" + value.toString()));
            } else {
              fiProgressDB
                  .update(FIProgress(
                    farmerId: value,
                    pageOne: 1,
                    pageTwo: state
                        .farmersIdentificationOneModelObj!.fiProgress!.pageTwo,
                    pageThree: state.farmersIdentificationOneModelObj!
                        .fiProgress!.pageThree,
                    pageFour: state
                        .farmersIdentificationOneModelObj!.fiProgress!.pageFour,
                  ))
                  .then((value) => print("Scope FI" + value.toString()));
            }
          } else {
            event.createFailed!.call();
          }
        });
      }
      if (state.farmersIdentificationOneModelObj!.fiProgress!.pageOne == 1) {
        int farmerid = PrefUtils().getFarmerId();
        if (farmerid != 0) {
          farmerDB
              .updatePageOne(Farmer(
                farmerId: PrefUtils().getFarmerId(),
                farmerName: state.nameController1!.text,
                villageName: state.nameController?.text ?? "NA",
                shoppingCenter: state.shoppingCenterController?.text ?? "NA",
                idNo: state.areaNumberController!.text,
                dateCreated: DateTime.now(),
                createdBy: userId,
              ))
              .then((value) => print(
                    "Updated scop: " + value.toString(),
                  ));
        }
      }
    } catch (e) {
      event.createFailed!.call();
    }

    event.createSuccessful!.call();
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

  _loadData(
    LoadFarmerDataEvent event,
    Emitter<FarmersIdentificationOneState> emit,
  ) {
    if (state.farmersIdentificationOneModelObj!.fiProgress!.pageOne == 1 &&
        state.farmersIdentificationOneModelObj!.farmer!.farmerId != 0) {
      TextEditingController villagename = TextEditingController(
          text: state.farmersIdentificationOneModelObj!.farmer!.villageName);
      TextEditingController center = TextEditingController(
          text: state.farmersIdentificationOneModelObj!.farmer!.shoppingCenter);
      TextEditingController fname = TextEditingController(
          text: state.farmersIdentificationOneModelObj!.farmer!.farmerName);
      TextEditingController idNo = TextEditingController(
          text: state.farmersIdentificationOneModelObj!.farmer!.idNo);

      emit(state.copyWith(
        areaNumberController: idNo,
        nameController1: fname,
        nameController: villagename,
        shoppingCenterController: center,
      ));
    }
  }

  _onInitialize(
    FarmersIdentificationOneInitialEvent event,
    Emitter<FarmersIdentificationOneState> emit,
  ) async {
    Farmer farmer = await getFarmer() ??
        Farmer(
          farmerId: 0,
          farmerName: "NA",
        );
    FIProgress fiProgress = await getProgress() ??
        FIProgress(
          farmerId: 0,
          pageOne: 0,
          pageTwo: 0,
          pageThree: 0,
          pageFour: 0,
        );

    //print(farmer);
    TextEditingController villagename = TextEditingController();
    TextEditingController center = TextEditingController();
    TextEditingController fname = TextEditingController();
    TextEditingController idNo = TextEditingController();
    if (fiProgress.pageOne == 1 && farmer.farmerId != 0) {
      villagename = TextEditingController(text: farmer.villageName);
      center = TextEditingController(text: farmer.shoppingCenter);
      fname = TextEditingController(text: farmer.farmerName);
      idNo = TextEditingController(text: farmer.idNo);
    }
    int stepper = 0;
    if (fiProgress.pageFour == 1) {
      stepper = 4;
    } else if (fiProgress.pageThree == 1) {
      stepper = 3;
    } else if (fiProgress.pageTwo == 1) {
      stepper = 2;
    } else if (fiProgress.pageOne == 1) {
      stepper = 1;
    }
    emit(
      state.copyWith(
          nameController: villagename,
          areaNumberController: idNo,
          shoppingCenterController: center,
          nameController1: fname,
          farmersIdentificationOneModelObj:
              state.farmersIdentificationOneModelObj?.copyWith(
            fiProgress: fiProgress,
            farmer: farmer,
            stepped2: stepper,
          )),
    );
  }
}

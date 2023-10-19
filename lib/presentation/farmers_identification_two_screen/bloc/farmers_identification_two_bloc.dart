import 'dart:math';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/farmers_identification_two_screen/models/farmers_identification_two_model.dart';
part 'farmers_identification_two_event.dart';
part 'farmers_identification_two_state.dart';

/// A bloc that manages the state of a FarmersIdentificationTwo according to the event that is dispatched to it.
class FarmersIdentificationTwoBloc
    extends Bloc<FarmersIdentificationTwoEvent, FarmersIdentificationTwoState> {
  FarmersIdentificationTwoBloc(FarmersIdentificationTwoState initialState)
      : super(initialState) {
    on<FarmersIdentificationTwoInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<NextTapEvent>(_nextTap);
    on<SaveTapEvent>(_saveTap);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<FarmersIdentificationTwoState> emit,
  ) {
    emit(
      state.copyWith(
        selectedDropDownValue: event.value,
        farmersIdentificationTwoModelObj:
            state.farmersIdentificationTwoModelObj?.copyWith(
          selectedDropDownValue: event.value,
          selectedDropDownValue1:
              state.farmersIdentificationTwoModelObj?.selectedDropDownValue1,
        ),
      ),
    );
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<FarmersIdentificationTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
      farmersIdentificationTwoModelObj:
          state.farmersIdentificationTwoModelObj?.copyWith(
        selectedDropDownValue1: event.value,
        selectedDropDownValue:
            state.farmersIdentificationTwoModelObj?.selectedDropDownValue,
      ),
    ));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    int currentYear = DateTime.now().year;
    List<SelectionPopupModel> itemList = [];

    for (int year = currentYear - 18; year >= currentYear - 120; year--) {
      itemList.add(SelectionPopupModel(id: year, title: "$year"));
    }

    return itemList;
  }

  List<SelectionPopupModel> fillDropdownItemList1() {
    return [
      SelectionPopupModel(id: 1, title: "Male", isSelected: true),
      SelectionPopupModel(id: 2, title: "Female"),
    ];
  }

  _nextTap(
    NextTapEvent event,
    Emitter<FarmersIdentificationTwoState> emit,
  ) {
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);
    FarmerDB farmerDB = FarmerDB();
    try {
      if (state.farmersIdentificationTwoModelObj?.fiProgress?.pageOne == 0) {
        farmerDB
            .insertNonNullable(Farmer(
          farmerId: 0,
          farmerName: state.name!.text,
          idNo: state.idnumberoneController!.text,
          dateCreated: DateTime.now(),
          createdBy: userId,
        ))
            .then((value) {
          PrefUtils().setFarmerId(value);
          PrefUtils().setFarmerName(state.name!.text);

          if (value > 0) {
            farmerDB
                .updatePageTwo(Farmer(
                  farmerId: value,
                  farmerName: state.name!.text,
                  idNo: state.idnumberoneController!.text,
                  dob: state.farmersIdentificationTwoModelObj!
                      .selectedDropDownValue?.id,
                  gender: state.farmersIdentificationTwoModelObj!
                      .selectedDropDownValue1?.id,
                  mobile: state.mobileNumberController!.text,
                  email: state.emailController?.text ?? "NA",
                  postalAddress: state.addressController?.text ?? "NA",
                ))
                .then((value) => print("UPdated !!! $value"));

            FIProgressDB fiProgressDB = FIProgressDB();
            fiProgressDB
                .insert(FIProgress(
                  farmerId: value,
                  pageOne: 1,
                  pageTwo: state
                      .farmersIdentificationTwoModelObj!.fiProgress!.pageTwo,
                  pageThree: state
                      .farmersIdentificationTwoModelObj!.fiProgress!.pageThree,
                  pageFour: state
                      .farmersIdentificationTwoModelObj!.fiProgress!.pageFour,
                ))
                .then((value) => print("Scope FI" + value.toString()));
            event.createSuccessful!.call();
          } else {
            event.createFailed!.call();
          }
        });
      } else {
        farmerDB
            .updatePageTwo(Farmer(
              farmerId: PrefUtils().getFarmerId(),
              farmerName: state.name!.text,
              idNo: state.idnumberoneController!.text,
              dob: state
                  .farmersIdentificationTwoModelObj!.selectedDropDownValue?.id,
              gender: state
                  .farmersIdentificationTwoModelObj!.selectedDropDownValue1?.id,
              mobile: state.mobileNumberController!.text,
              email: state.emailController?.text ?? "NA",
              postalAddress: state.addressController?.text ?? "NA",
            ))
            .then((value) => print("UPdated !!! $value"));

        FIProgressDB fiProgressDB = FIProgressDB();
        fiProgressDB
            .update(FIProgress(
              farmerId: PrefUtils().getFarmerId(),
              pageOne: 1,
              pageTwo:
                  state.farmersIdentificationTwoModelObj!.fiProgress!.pageTwo,
              pageThree:
                  state.farmersIdentificationTwoModelObj!.fiProgress!.pageThree,
              pageFour:
                  state.farmersIdentificationTwoModelObj!.fiProgress!.pageFour,
            ))
            .then((value) => print("Scope FI" + value.toString()));
        event.createSuccessful!.call();
      }
    } catch (e) {
      event.createFailed!.call();
    }
  }

  _saveTap(
    SaveTapEvent event,
    Emitter<FarmersIdentificationTwoState> emit,
  ) {
    if (PrefUtils().getYesNo()) {
      final claims = JWT.decode(PrefUtils().getToken());
      int userId = int.parse(claims.payload['nameidentifier']);
      FarmerDB farmerDB = FarmerDB();
      try {
        if (state.farmersIdentificationTwoModelObj?.fiProgress?.pageOne == 0) {
          farmerDB
              .insertNonNullable(Farmer(
            farmerId: 0,
            farmerName: state.name!.text,
            idNo: state.idnumberoneController!.text,
            dateCreated: DateTime.now(),
            createdBy: userId,
          ))
              .then((value) {
            PrefUtils().setFarmerId(value);
            PrefUtils().setFarmerName(state.name!.text);

            if (value > 0) {
              farmerDB
                  .updatePageTwo(Farmer(
                    farmerId: value,
                    farmerName: state.name!.text,
                    idNo: state.idnumberoneController!.text,
                    dob: state.farmersIdentificationTwoModelObj!
                        .selectedDropDownValue?.id,
                    gender: state.farmersIdentificationTwoModelObj!
                        .selectedDropDownValue1?.id,
                    mobile: state.mobileNumberController!.text,
                    email: state.emailController?.text ?? "NA",
                    postalAddress: state.addressController?.text ?? "NA",
                  ))
                  .then((value) => print("UPdated !!! $value"));

              FIProgressDB fiProgressDB = FIProgressDB();
              fiProgressDB
                  .insert(FIProgress(
                    farmerId: value,
                    pageOne: 1,
                    pageTwo: state
                        .farmersIdentificationTwoModelObj!.fiProgress!.pageTwo,
                    pageThree: state.farmersIdentificationTwoModelObj!
                        .fiProgress!.pageThree,
                    pageFour: state
                        .farmersIdentificationTwoModelObj!.fiProgress!.pageFour,
                  ))
                  .then((value) => print("Scope FI" + value.toString()));
              event.createSuccessful!.call();
            } else {
              event.createFailed!.call();
            }
          });
        } else {
          farmerDB
              .updatePageTwo(Farmer(
                farmerId: PrefUtils().getFarmerId(),
                farmerName: state.name!.text,
                idNo: state.idnumberoneController!.text,
                dob: state.farmersIdentificationTwoModelObj!
                    .selectedDropDownValue?.id,
                gender: state.farmersIdentificationTwoModelObj!
                    .selectedDropDownValue1?.id,
                mobile: state.mobileNumberController!.text,
                email: state.emailController?.text ?? "NA",
                postalAddress: state.addressController?.text ?? "NA",
              ))
              .then((value) => print("UPdated !!! $value"));

          FIProgressDB fiProgressDB = FIProgressDB();
          fiProgressDB
              .update(FIProgress(
                farmerId: PrefUtils().getFarmerId(),
                pageOne: 1,
                pageTwo:
                    state.farmersIdentificationTwoModelObj!.fiProgress!.pageTwo,
                pageThree: state
                    .farmersIdentificationTwoModelObj!.fiProgress!.pageThree,
                pageFour: state
                    .farmersIdentificationTwoModelObj!.fiProgress!.pageFour,
              ))
              .then((value) => print("Scope FI" + value.toString()));
          event.createSuccessful!.call();
        }
      } catch (e) {
        event.createFailed!.call();
      }
    }
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

  _onInitialize(
    FarmersIdentificationTwoInitialEvent event,
    Emitter<FarmersIdentificationTwoState> emit,
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
    int stepper = 0;

    List<SelectionPopupModel> years = fillDropdownItemList();
    List<SelectionPopupModel> gender = fillDropdownItemList1();
    TextEditingController mobile = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController padrress = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController id =
        TextEditingController(text: PrefUtils().getFarmerIdNo());
    SelectionPopupModel? selectedyear;
    SelectionPopupModel? genderselected;

    if (fiProgress.pageOne != 0 && farmer.farmerId != 0) {
      selectedyear = years.firstWhere(
        (model) => model.id == farmer.dob,
      );

      genderselected = gender.firstWhere(
        (model) => model.id == farmer.gender,
      );

      mobile = TextEditingController(text: farmer.mobile);
      email = TextEditingController(text: farmer.email);
      padrress = TextEditingController(text: farmer.postalAddress);
      name = TextEditingController(text: farmer.farmerName);
      id = TextEditingController(text: farmer.idNo);
    }

    if (fiProgress.pageThree == 1) {
      stepper = 3;
    } else if (fiProgress.pageTwo == 1) {
      stepper = 2;
    } else if (fiProgress.pageOne == 1) {
      stepper = 1;
    }

    emit(
      state.copyWith(
        mobileNumberController: mobile,
        emailController: email,
        addressController: padrress,
        idnumberoneController: id,
        name: name,
      ),
    );
    emit(
      state.copyWith(
        farmersIdentificationTwoModelObj:
            state.farmersIdentificationTwoModelObj?.copyWith(
          dropdownItemList: years,
          dropdownItemList1: gender,
          fiProgress: fiProgress,
          farmer: farmer,
          selectedDropDownValue: selectedyear,
          selectedDropDownValue1: genderselected,
          stepped2: stepper,
        ),
      ),
    );
  }
}

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
    emit(state.copyWith(selectedDropDownValue: event.value));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<FarmersIdentificationTwoState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue1: event.value));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    int currentYear = DateTime.now().year;
    List<SelectionPopupModel> itemList = [];

// Area for business logic
    for (int year = currentYear; year >= currentYear - 120; year--) {
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
    FarmerDB farmerDB = FarmerDB();

    try {
      farmerDB
          .updatePageTwo(Farmer(
        farmerId: state.farmersIdentificationTwoModelObj!.farmer!.farmerId,
        farmerName: state.farmersIdentificationTwoModelObj!.farmer!.farmerName,
        idNo: state.farmersIdentificationTwoModelObj!.farmer!.idNo,
        dob: state.selectedDropDownValue?.id,
        gender: state.selectedDropDownValue1?.id,
        mobile: state.mobileNumberController!.text,
        email: state.emailController?.text ?? "NA",
        postalAddress: state.addressController?.text ?? "NA",
      ))
          .then((value) {
        if (value > 0) {
          //PrefUtils().setFarmerId(value);
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
    Emitter<FarmersIdentificationTwoState> emit,
  ) {
    FarmerDB farmerDB = FarmerDB();

    try {
      farmerDB
          .updatePageTwo(Farmer(
        farmerId: state.farmersIdentificationTwoModelObj!.farmer!.farmerId,
        farmerName: state.farmersIdentificationTwoModelObj!.farmer!.farmerName,
        idNo: state.farmersIdentificationTwoModelObj!.farmer!.idNo,
        dob: state.selectedDropDownValue?.id,
        gender: state.selectedDropDownValue1?.id,
        mobile: state.mobileNumberController!.text,
        email: state.emailController?.text ?? "NA",
        postalAddress: state.addressController?.text ?? "NA",
      ))
          .then((value) {
        if (value > 0) {
          //PrefUtils().setFarmerId(value);
          event.createSuccessful!.call();
        } else {
          event.createFailed!.call();
        }
      });
    } catch (e) {
      event.createFailed!.call();
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
    SelectionPopupModel? selectedyear;
    SelectionPopupModel? genderselected;

    if (fiProgress.pageTwo != 0 && farmer.farmerId != 0) {
      selectedyear = years.firstWhere(
        (model) => model.id == farmer.dob,
      );

      genderselected = gender.firstWhere(
        (model) => model.id == farmer.gender,
      );

      mobile = TextEditingController(text: farmer.mobile);
      email = TextEditingController(text: farmer.email);
      padrress = TextEditingController(text: farmer.postalAddress);
    }

    if (fiProgress.pageFour == 1) {
      stepper = 3;
    } else if (fiProgress.pageThree == 1) {
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
          stepped: stepper,
        ),
      ),
    );
  }
}

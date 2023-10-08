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

  _onInitialize(
    FarmersIdentificationTwoInitialEvent event,
    Emitter<FarmersIdentificationTwoState> emit,
  ) async {
    emit(state.copyWith(
        idnumberoneController: TextEditingController(),
        mobileNumberController: TextEditingController(),
        emailController: TextEditingController(),
        addressController: TextEditingController()));
    emit(
      state.copyWith(
        farmersIdentificationTwoModelObj:
            state.farmersIdentificationTwoModelObj?.copyWith(
          dropdownItemList: fillDropdownItemList(),
          dropdownItemList1: fillDropdownItemList1(),
          farmer: getFarmer(),
          fiProgress: getProgress(),
        ),
      ),
    );
  }
}

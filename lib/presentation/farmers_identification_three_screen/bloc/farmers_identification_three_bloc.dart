import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/educationlevel.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/maritalstatus.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/farmers_identification_three_screen/models/farmers_identification_three_model.dart';
part 'farmers_identification_three_event.dart';
part 'farmers_identification_three_state.dart';

/// A bloc that manages the state of a FarmersIdentificationThree according to the event that is dispatched to it.
class FarmersIdentificationThreeBloc extends Bloc<
    FarmersIdentificationThreeEvent, FarmersIdentificationThreeState> {
  FarmersIdentificationThreeBloc(FarmersIdentificationThreeState initialState)
      : super(initialState) {
    on<FarmersIdentificationThreeInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
    on<NextTapEvent>(_nextTap);
    on<SaveTapEvent>(_saveTap);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<FarmersIdentificationThreeState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue: event.value));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<FarmersIdentificationThreeState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue1: event.value));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<FarmersIdentificationThreeState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue2: event.value));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList1() {
    return [
      SelectionPopupModel(id: 1, title: "Yes"),
      SelectionPopupModel(id: 0, title: "No"),
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList2() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }

  Future<List<SelectionPopupModel>> fetchEducationLevels() async {
    List<SelectionPopupModel> list = [];
    EducationLevelDB educationLevelDB = EducationLevelDB();

    await educationLevelDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].educationLevel,
          id: value[i].educationLevelId,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fetchMaritalStatus() async {
    List<SelectionPopupModel> list = [];
    MaritalStatusDB maritalStatusDB = MaritalStatusDB();

    await maritalStatusDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].maritalStatus,
          id: value[i].maritalStatusId,
        ));
      }
    });
    return list;
  }

  _nextTap(
    NextTapEvent event,
    Emitter<FarmersIdentificationThreeState> emit,
  ) {
    FarmerDB farmerDB = FarmerDB();

    try {
      farmerDB
          .updatePageTwo(Farmer(
        farmerId: state.farmersIdentificationThreeModelObj!.farmer!.farmerId,
        farmerName:
            state.farmersIdentificationThreeModelObj!.farmer!.farmerName,
        idNo: state.farmersIdentificationThreeModelObj!.farmer!.idNo,
        postalCode: state.codevalueoneController?.text ?? "NA",
        maritalStatusId: state.selectedDropDownValue!.id,
        agriSkillsId: state.selectedDropDownValue1!.id,
        hhSize: int.parse(state.hhsizevalueoneController!.text),
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
    Emitter<FarmersIdentificationThreeState> emit,
  ) {
    FarmerDB farmerDB = FarmerDB();

    try {
      farmerDB
          .updatePageThree(Farmer(
        farmerId: state.farmersIdentificationThreeModelObj!.farmer!.farmerId,
        farmerName:
            state.farmersIdentificationThreeModelObj!.farmer!.farmerName,
        idNo: state.farmersIdentificationThreeModelObj!.farmer!.idNo,
        postalCode: state.codevalueoneController?.text ?? "NA",
        maritalStatusId: state.selectedDropDownValue!.id,
        agriSkillsId: state.selectedDropDownValue1!.id,
        hhSize: int.parse(state.hhsizevalueoneController!.text),
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
    FarmersIdentificationThreeInitialEvent event,
    Emitter<FarmersIdentificationThreeState> emit,
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
    List<SelectionPopupModel> marital = await fetchMaritalStatus();
    List<SelectionPopupModel> agriskill = fillDropdownItemList1();
    List<SelectionPopupModel> formaled = await fetchEducationLevels();

    SelectionPopupModel? selectedDropDownValue;
    SelectionPopupModel? selectedDropDownValue1;
    SelectionPopupModel? selectedDropDownValue2;

    TextEditingController postalCode = TextEditingController();
    TextEditingController hhSize = TextEditingController();

    if (fiProgress.pageThree == 1) {
      selectedDropDownValue = marital.firstWhere(
        (model) => model.id == farmer.maritalStatusId,
      );

      selectedDropDownValue2 = formaled.firstWhere(
        (model) => model.id == farmer.educationLevelId,
      );

      selectedDropDownValue1 = agriskill.firstWhere(
        (model) => model.id == farmer.agriSkillsId,
      );

      postalCode = TextEditingController(text: farmer.postalCode);
      hhSize = TextEditingController(text: farmer.hhSize.toString());
    }

    emit(state.copyWith(
        codevalueoneController: TextEditingController(),
        hhsizevalueoneController: TextEditingController()));
    emit(state.copyWith(
      farmersIdentificationThreeModelObj:
          state.farmersIdentificationThreeModelObj?.copyWith(
        dropdownItemList: marital,
        dropdownItemList1: formaled,
        dropdownItemList2: agriskill,
        fiProgress: fiProgress,
        farmer: farmer,
        selectedDropDownValue: selectedDropDownValue,
        selectedDropDownValue1: selectedDropDownValue1,
        selectedDropDownValue2: selectedDropDownValue2,
      ),
    ));
  }
}

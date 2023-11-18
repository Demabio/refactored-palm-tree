import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/respondentrelationship.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/farmers_identification_four_screen/models/farmers_identification_four_model.dart';
part 'farmers_identification_four_event.dart';
part 'farmers_identification_four_state.dart';

/// A bloc that manages the state of a FarmersIdentificationFour according to the event that is dispatched to it.
class FarmersIdentificationFourBloc extends Bloc<FarmersIdentificationFourEvent,
    FarmersIdentificationFourState> {
  FarmersIdentificationFourBloc(FarmersIdentificationFourState initialState)
      : super(initialState) {
    on<FarmersIdentificationFourInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
    on<ChangeDropDown3Event>(_changeDropDown3);
    on<ChangeDropDown4Event>(_changeDropDown4);
    on<NextTapEvent>(_nextTap);
    on<SaveTapEvent>(_saveTap);
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
    FarmersIdentificationFourInitialEvent event,
    Emitter<FarmersIdentificationFourState> emit,
  ) async {
    Farmer farmer = await getFarmer() ??
        Farmer(
          farmerId: 0,
          farmerName: "Not Applied",
          farmerTheRespodent: true,
        );
    FIProgress fiProgress = await getProgress() ??
        FIProgress(
          farmerId: 0,
          pageOne: 0,
          pageTwo: 0,
          pageThree: 0,
          pageFour: 0,
        );
    List<SelectionPopupModel> isFarmer = fillDropdownItemList();
    List<SelectionPopupModel> relationshipFarmer =
        await fetchRespondentRelationships();
    List<SelectionPopupModel> crop = fillDropdownItemList2();
    List<SelectionPopupModel> livestock = fillDropdownItemList2();
    List<SelectionPopupModel> fish = fillDropdownItemList2();

    SelectionPopupModel? selectedDropDownValue;
    SelectionPopupModel? selectedDropDownValue1;

    TextEditingController mobile = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController id = TextEditingController();
    TextEditingController other = TextEditingController();
    if (fiProgress.pageThree == 1) {
      selectedDropDownValue = isFarmer.firstWhere(
        (model) => model.id == (farmer.farmerTheRespodent! ? 1 : 0),
      );

      selectedDropDownValue1 = relationshipFarmer.firstWhere(
        (model) =>
            model.id ==
            (!farmer.farmerTheRespodent! ? farmer.respondentRlshpId : 1),
      );
      id = TextEditingController(
          text: !farmer.farmerTheRespodent!
              ? farmer.respNationalId
              : "Not Applied");
      name = TextEditingController(
          text: !farmer.farmerTheRespodent!
              ? farmer.respondentName
              : "Not Applied");
      mobile = TextEditingController(
          text: !farmer.farmerTheRespodent!
              ? farmer.respondentMobile
              : "Not Applied");

      other = TextEditingController(
          text: farmer.other != null ? farmer.other : "Not Applied");
    }
    print(farmer.other);
    int stepper = 3;
    if (fiProgress.pageThree == 1) {
      stepper = 3;
    } else if (fiProgress.pageTwo == 1) {
      stepper = 2;
    } else if (fiProgress.pageOne == 1) {
      stepper = 1;
    }
    emit(
      state.copyWith(
        respMob: mobile,
        respame: name,
        respid: id,
        other: other,
        farmersIdentificationFourModelObj:
            state.farmersIdentificationFourModelObj?.copyWith(
          dropdownItemList: isFarmer,
          dropdownItemList1: relationshipFarmer,
          dropdownItemList2: crop,
          dropdownItemList3: livestock,
          dropdownItemList4: fish,
          fiProgress: fiProgress,
          farmer: farmer,
          selectedDropDownValue1: selectedDropDownValue1,
          selectedDropDownValue: selectedDropDownValue,
          stepped2: stepper,
          isFarmer: farmer.farmerTheRespodent,
        ),
      ),
    );
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<FarmersIdentificationFourState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
      farmersIdentificationFourModelObj:
          state.farmersIdentificationFourModelObj?.copyWith(
        isFarmer: event.value.id == 1,
        selectedDropDownValue: event.value,
        selectedDropDownValue1:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue1,
        selectedDropDownValue2:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue2,
        selectedDropDownValue3:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue3,
        selectedDropDownValue4:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue4,
      ),
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<FarmersIdentificationFourState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
      farmersIdentificationFourModelObj:
          state.farmersIdentificationFourModelObj?.copyWith(
        selectedDropDownValue1: event.value,
        selectedDropDownValue:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue,
        selectedDropDownValue2:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue2,
        selectedDropDownValue3:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue3,
        selectedDropDownValue4:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue4,
      ),
    ));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<FarmersIdentificationFourState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue2: event.value,
      farmersIdentificationFourModelObj:
          state.farmersIdentificationFourModelObj?.copyWith(
        selectedDropDownValue2: event.value,
        selectedDropDownValue1:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue1,
        selectedDropDownValue:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue,
        selectedDropDownValue3:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue3,
        selectedDropDownValue4:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue4,
      ),
    ));
  }

  _changeDropDown3(
    ChangeDropDown3Event event,
    Emitter<FarmersIdentificationFourState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue3: event.value,
      farmersIdentificationFourModelObj:
          state.farmersIdentificationFourModelObj?.copyWith(
        selectedDropDownValue3: event.value,
        selectedDropDownValue1:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue1,
        selectedDropDownValue2:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue2,
        selectedDropDownValue:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue,
        selectedDropDownValue4:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue4,
      ),
    ));
  }

  _changeDropDown4(
    ChangeDropDown4Event event,
    Emitter<FarmersIdentificationFourState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue4: event.value,
      farmersIdentificationFourModelObj:
          state.farmersIdentificationFourModelObj?.copyWith(
        selectedDropDownValue4: event.value,
        selectedDropDownValue1:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue1,
        selectedDropDownValue2:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue2,
        selectedDropDownValue3:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue3,
        selectedDropDownValue:
            state.farmersIdentificationFourModelObj?.selectedDropDownValue,
      ),
    ));
  }

  Future<List<SelectionPopupModel>> fetchRespondentRelationships() async {
    List<SelectionPopupModel> list = [];
    RespondentRelationshipDB relationshipDB = RespondentRelationshipDB();

    await relationshipDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].rlshpToFarmer,
          id: value[i].respondendRlshpId,
        ));
      }
    });
    return list;
  }

  _nextTap(
    NextTapEvent event,
    Emitter<FarmersIdentificationFourState> emit,
  ) {
    FarmerDB farmerDB = FarmerDB();

    try {
      farmerDB
          .updatePageFour(Farmer(
        farmerId: state.farmersIdentificationFourModelObj!.farmer!.farmerId,
        farmerName: state.farmersIdentificationFourModelObj!.farmer!.farmerName,
        idNo: state.farmersIdentificationFourModelObj!.farmer!.idNo,
        other: !state.farmersIdentificationFourModelObj!.isFarmer
            ? state.other?.text == ""
                ? "Not Applied"
                : state.other!.text
            : "Not Applied",
        respNationalId: !state.farmersIdentificationFourModelObj!.isFarmer
            ? state.respid!.text
            : "Not Applied",
        respondentMobile: !state.farmersIdentificationFourModelObj!.isFarmer
            ? state.respMob!.text
            : "Not Applied",
        respondentName: !state.farmersIdentificationFourModelObj!.isFarmer
            ? state.respame!.text
            : "Not Applied",
        farmerTheRespodent: state
                .farmersIdentificationFourModelObj!.selectedDropDownValue!.id ==
            1,
        respondentRlshpId: state.farmersIdentificationFourModelObj!
                .selectedDropDownValue1?.id ??
            1,
      ))
          .then((value) {
        if (value > 0) {
          FIProgressDB fiProgressDB = FIProgressDB();
          fiProgressDB
              .update(FIProgress(
                farmerId: PrefUtils().getFarmerId(),
                pageOne: 1,
                pageTwo: 1,
                pageThree: 1,
                pageFour: 1,
              ))
              .then((value) => print("Scope FI" + value.toString()));
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
    Emitter<FarmersIdentificationFourState> emit,
  ) {
    FarmerDB farmerDB = FarmerDB();
    print(state.other!.text);

    try {
      farmerDB
          .updatePageFour(Farmer(
        farmerId: state.farmersIdentificationFourModelObj!.farmer!.farmerId,
        farmerName: state.farmersIdentificationFourModelObj!.farmer!.farmerName,
        idNo: state.farmersIdentificationFourModelObj!.farmer!.idNo,
        other: !state.farmersIdentificationFourModelObj!.isFarmer
            ? state.other?.text == ""
                ? "Not Applied"
                : state.other!.text
            : "Not Applied",
        respNationalId: !state.farmersIdentificationFourModelObj!.isFarmer
            ? state.respid!.text
            : "Not Applied",
        respondentMobile: !state.farmersIdentificationFourModelObj!.isFarmer
            ? state.respMob!.text
            : "Not Applied",
        respondentName: !state.farmersIdentificationFourModelObj!.isFarmer
            ? state.respame!.text
            : "Not Applied",
        farmerTheRespodent: state
                .farmersIdentificationFourModelObj!.selectedDropDownValue!.id ==
            1,
        respondentRlshpId: state.farmersIdentificationFourModelObj!
                .selectedDropDownValue1?.id ??
            1,
      ))
          .then((value) {
        if (value > 0) {
          FIProgressDB fiProgressDB = FIProgressDB();
          fiProgressDB
              .update(FIProgress(
                farmerId: PrefUtils().getFarmerId(),
                pageOne: 1,
                pageTwo: 1,
                pageThree: 1,
                pageFour: 1,
              ))
              .then((value) => print("Scope FI" + value.toString()));
          event.createSuccessful!.call();
        } else {
          event.createFailed!.call();
        }
      });
    } catch (e) {
      event.createFailed!.call();
    }
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(id: 1, title: "Yes"),
      SelectionPopupModel(id: 0, title: "No"),
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList1() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList2() {
    return [
      SelectionPopupModel(id: 1, title: "Yes"),
      SelectionPopupModel(id: 0, title: "No"),
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList3() {
    return [
      SelectionPopupModel(id: 1, title: "Yes"),
      SelectionPopupModel(id: 0, title: "No"),
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList4() {
    return [
      SelectionPopupModel(id: 1, title: "Yes"),
      SelectionPopupModel(id: 0, title: "No"),
    ];
  }
}

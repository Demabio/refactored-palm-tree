import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/livestock_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestockservice.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/livestock_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/livestockservices.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_liverstockinput_screen/models/add_liverstockinput_model.dart';
part 'add_liverstockinput_event.dart';
part 'add_liverstockinput_state.dart';

/// A bloc that manages the state of a AddLiverstockinput according to the event that is dispatched to it.
class AddLiverstockinputBloc
    extends Bloc<AddLiverstockinputEvent, AddLiverstockinputState> {
  AddLiverstockinputBloc(AddLiverstockinputState initialState)
      : super(initialState) {
    on<AddLiverstockinputInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
    on<ChangeDropDown3Event>(_changeDropDown3);
    on<ChangeDropDown4Event>(_changeDropDown4);
    on<ChangeDropDown5Event>(_changeDropDown5);
    on<ChangeDropDown6Event>(_changeDropDown6);
    on<ChangeDropDown7Event>(_changeDropDown7);
    on<SaveTapEvent>(_saveTap);
  }

  _onInitialize(
    AddLiverstockinputInitialEvent event,
    Emitter<AddLiverstockinputState> emit,
  ) async {
    FarmerLivestockService livestock = await getFarm() ??
        FarmerLivestockService(
          farmerId: 0,
          farmerFarmId: 0,
          farmerLivestockServicesId: 0,
        );
    LSProgress pfProgress = await getProgress() ??
        LSProgress(
          livestockId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    List<SelectionPopupModel>? dropdownItemList = fillDropdownItemList1();
    SelectionPopupModel? selectedDropDownValue1;

    SelectionPopupModel? selectedDropDownValue2 = null;
    SelectionPopupModel? selectedDropDownValue3 = null;
    SelectionPopupModel? selectedDropDownValue4 = null;
    SelectionPopupModel? selectedDropDownValue5 = null;
    SelectionPopupModel? selectedDropDownValue6 = null;
    SelectionPopupModel? selectedDropDownValue7 = null;

    if (pfProgress.pageTwo == 1 && livestock.farmerLivestockServicesId != 0) {
      selectedDropDownValue1 = dropdownItemList.firstWhere(
        (model) => model.id == (livestock.fertilizerForFodder! ? 1 : 0),
      );
      selectedDropDownValue2 = dropdownItemList.firstWhere(
        (model) => model.id == (livestock.fodderSeeds! ? 1 : 0),
      );
      selectedDropDownValue3 = dropdownItemList.firstWhere(
        (model) => model.id == livestock.aiUse,
      );
      selectedDropDownValue4 = dropdownItemList.firstWhere(
        (model) => model.id == livestock.hormoneUse,
      );
      selectedDropDownValue5 = dropdownItemList.firstWhere(
        (model) => model.id == (livestock.embryoTransfer! ? 1 : 0),
      );
      selectedDropDownValue6 = dropdownItemList.firstWhere(
        (model) => model.id == (livestock.routineVaccination! ? 1 : 0),
      );
      selectedDropDownValue7 = dropdownItemList.firstWhere(
        (model) => model.id == (livestock.curativeMeasures! ? 1 : 0),
      );
    }

    emit(state.copyWith(
        addLiverstockinputModelObj: state.addLiverstockinputModelObj?.copyWith(
      dropdownItemList: dropdownItemList,
      dropdownItemList1: dropdownItemList,
      dropdownItemList2: dropdownItemList,
      dropdownItemList3: dropdownItemList,
      dropdownItemList4: dropdownItemList,
      dropdownItemList5: dropdownItemList,
      dropdownItemList6: dropdownItemList,
      dropdownItemList7: dropdownItemList,
      selectedDropDownValue1: selectedDropDownValue1,
      selectedDropDownValue2: selectedDropDownValue2,
      selectedDropDownValue3: selectedDropDownValue3,
      selectedDropDownValue4: selectedDropDownValue4,
      selectedDropDownValue5: selectedDropDownValue5,
      selectedDropDownValue6: selectedDropDownValue6,
      selectedDropDownValue7: selectedDropDownValue7,
      lsProgress: pfProgress,
      livestockins: livestock,
    )));
  }

  _saveTap(
    SaveTapEvent event,
    Emitter<AddLiverstockinputState> emit,
  ) {
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);
    FarmerLivestockServicesDB farmDB = FarmerLivestockServicesDB();
    int farmerid = PrefUtils().getFarmId();
    try {
      if (state.addLiverstockinputModelObj!.lsProgress!.pageTwo == 0) {
        farmDB
            .insertNonNulls(FarmerLivestockService(
          farmerFarmId: PrefUtils().getFarmId(),
          farmerId: PrefUtils().getFarmerId(),
          dateCreated: DateTime.now(),
          createdBy: userId,
          farmerLivestockServicesId: 0,
          fertilizerSeeds: false,
          fertilizerForFodder:
              state.addLiverstockinputModelObj!.selectedDropDownValue1!.id == 1,
          fodderSeeds:
              state.addLiverstockinputModelObj!.selectedDropDownValue2!.id == 1,
          aiUse: state.addLiverstockinputModelObj!.selectedDropDownValue3!.id,
          hormoneUse:
              state.addLiverstockinputModelObj!.selectedDropDownValue4!.id,
          embryoTransfer:
              state.addLiverstockinputModelObj!.selectedDropDownValue5!.id == 1,
          routineVaccination:
              state.addLiverstockinputModelObj!.selectedDropDownValue6!.id == 1,
          curativeMeasures:
              state.addLiverstockinputModelObj!.selectedDropDownValue7!.id == 1,
          areaUnitId: 1,
          livestockArea: 0,
        ))
            .then((value) {
          if (value > 0) {
            LSProgressDB pfProgressDB = LSProgressDB();
            if (state.addLiverstockinputModelObj!.lsProgress!.pageTwo == 0) {
              pfProgressDB
                  .update(LSProgress(
                    livestockId: PrefUtils().getLivestockId(),
                    pageOne:
                        state.addLiverstockinputModelObj!.lsProgress!.pageOne,
                    pageTwo: 1,
                  ))
                  .then((value) => print("Scope FI" + value.toString()));
            }
            event.createSuccessful!.call();
          } else {
            event.createFailed!.call();
          }
        });
      }

      int farmerLivestockServicesId = PrefUtils().getLivestockId();

      if (state.addLiverstockinputModelObj!.lsProgress!.pageTwo == 1) {
        if (farmerLivestockServicesId != 0) {
          farmDB
              .update(FarmerLivestockService(
                farmerFarmId: PrefUtils().getFarmId(),
                farmerId: PrefUtils().getFarmerId(),
                dateCreated: DateTime.now(),
                createdBy: userId,
                farmerLivestockServicesId: PrefUtils().getLivestockId(),
                fertilizerSeeds: false,
                fertilizerForFodder: state.addLiverstockinputModelObj!
                        .selectedDropDownValue1!.id ==
                    1,
                fodderSeeds: state.addLiverstockinputModelObj!
                        .selectedDropDownValue2!.id ==
                    1,
                aiUse: state
                    .addLiverstockinputModelObj!.selectedDropDownValue3!.id,
                hormoneUse: state
                    .addLiverstockinputModelObj!.selectedDropDownValue4!.id,
                embryoTransfer: state.addLiverstockinputModelObj!
                        .selectedDropDownValue5!.id ==
                    1,
                routineVaccination: state.addLiverstockinputModelObj!
                        .selectedDropDownValue6!.id ==
                    1,
                curativeMeasures: state.addLiverstockinputModelObj!
                        .selectedDropDownValue7!.id ==
                    1,
                areaUnitId: 1,
                livestockArea: 0,
              ))
              .then((value) => print(
                    "Updated scop: " + value.toString(),
                  ));
          event.createSuccessful!.call();
        }
      }
    } catch (e) {
      event.createFailed!.call();
    }
  }

  Future<FarmerLivestockService?> getFarm() async {
    int farmid = PrefUtils().getFarmerId();
    FarmerLivestockServicesDB farmDB = FarmerLivestockServicesDB();
    return await farmDB.fetchByFarmer(farmid);
  }

  Future<LSProgress?> getProgress() async {
    int farmerid = PrefUtils().getFarmId();
    LSProgressDB pfProgressDB = LSProgressDB();
    return await pfProgressDB.fetchByFarmerId(farmerid);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddLiverstockinputState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
      selectedDropDownValue1:
          state.addLiverstockinputModelObj?.selectedDropDownValue1,
      selectedDropDownValue2:
          state.addLiverstockinputModelObj?.selectedDropDownValue2,
      selectedDropDownValue3:
          state.addLiverstockinputModelObj?.selectedDropDownValue3,
      selectedDropDownValue4:
          state.addLiverstockinputModelObj?.selectedDropDownValue4,
      selectedDropDownValue5:
          state.addLiverstockinputModelObj?.selectedDropDownValue5,
      selectedDropDownValue6:
          state.addLiverstockinputModelObj?.selectedDropDownValue6,
      selectedDropDownValue7:
          state.addLiverstockinputModelObj?.selectedDropDownValue7,
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddLiverstockinputState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue1: event.value,
        addLiverstockinputModelObj: state.addLiverstockinputModelObj?.copyWith(
          selectedDropDownValue1: event.value,
          selectedDropDownValue2:
              state.addLiverstockinputModelObj?.selectedDropDownValue2,
          selectedDropDownValue3:
              state.addLiverstockinputModelObj?.selectedDropDownValue3,
          selectedDropDownValue4:
              state.addLiverstockinputModelObj?.selectedDropDownValue4,
          selectedDropDownValue5:
              state.addLiverstockinputModelObj?.selectedDropDownValue5,
          selectedDropDownValue6:
              state.addLiverstockinputModelObj?.selectedDropDownValue6,
          selectedDropDownValue7:
              state.addLiverstockinputModelObj?.selectedDropDownValue7,
        )));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<AddLiverstockinputState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue2: event.value,
        addLiverstockinputModelObj: state.addLiverstockinputModelObj?.copyWith(
          selectedDropDownValue2: event.value,
          selectedDropDownValue1:
              state.addLiverstockinputModelObj?.selectedDropDownValue1,
          selectedDropDownValue3:
              state.addLiverstockinputModelObj?.selectedDropDownValue3,
          selectedDropDownValue4:
              state.addLiverstockinputModelObj?.selectedDropDownValue4,
          selectedDropDownValue5:
              state.addLiverstockinputModelObj?.selectedDropDownValue5,
          selectedDropDownValue6:
              state.addLiverstockinputModelObj?.selectedDropDownValue6,
          selectedDropDownValue7:
              state.addLiverstockinputModelObj?.selectedDropDownValue7,
        )));
  }

  _changeDropDown3(
    ChangeDropDown3Event event,
    Emitter<AddLiverstockinputState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue3: event.value,
        addLiverstockinputModelObj: state.addLiverstockinputModelObj?.copyWith(
          selectedDropDownValue3: event.value,
          selectedDropDownValue1:
              state.addLiverstockinputModelObj?.selectedDropDownValue1,
          selectedDropDownValue2:
              state.addLiverstockinputModelObj?.selectedDropDownValue2,
          selectedDropDownValue4:
              state.addLiverstockinputModelObj?.selectedDropDownValue4,
          selectedDropDownValue5:
              state.addLiverstockinputModelObj?.selectedDropDownValue5,
          selectedDropDownValue6:
              state.addLiverstockinputModelObj?.selectedDropDownValue6,
          selectedDropDownValue7:
              state.addLiverstockinputModelObj?.selectedDropDownValue7,
        )));
  }

  _changeDropDown4(
    ChangeDropDown4Event event,
    Emitter<AddLiverstockinputState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue4: event.value,
        addLiverstockinputModelObj: state.addLiverstockinputModelObj?.copyWith(
          selectedDropDownValue4: event.value,
          selectedDropDownValue1:
              state.addLiverstockinputModelObj?.selectedDropDownValue1,
          selectedDropDownValue2:
              state.addLiverstockinputModelObj?.selectedDropDownValue2,
          selectedDropDownValue3:
              state.addLiverstockinputModelObj?.selectedDropDownValue3,
          selectedDropDownValue5:
              state.addLiverstockinputModelObj?.selectedDropDownValue5,
          selectedDropDownValue6:
              state.addLiverstockinputModelObj?.selectedDropDownValue6,
          selectedDropDownValue7:
              state.addLiverstockinputModelObj?.selectedDropDownValue7,
        )));
  }

  _changeDropDown5(
    ChangeDropDown5Event event,
    Emitter<AddLiverstockinputState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue5: event.value,
        addLiverstockinputModelObj: state.addLiverstockinputModelObj?.copyWith(
          selectedDropDownValue5: event.value,
          selectedDropDownValue1:
              state.addLiverstockinputModelObj?.selectedDropDownValue1,
          selectedDropDownValue2:
              state.addLiverstockinputModelObj?.selectedDropDownValue2,
          selectedDropDownValue3:
              state.addLiverstockinputModelObj?.selectedDropDownValue3,
          selectedDropDownValue4:
              state.addLiverstockinputModelObj?.selectedDropDownValue4,
          selectedDropDownValue6:
              state.addLiverstockinputModelObj?.selectedDropDownValue6,
          selectedDropDownValue7:
              state.addLiverstockinputModelObj?.selectedDropDownValue7,
        )));
  }

  _changeDropDown6(
    ChangeDropDown6Event event,
    Emitter<AddLiverstockinputState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue6: event.value,
        addLiverstockinputModelObj: state.addLiverstockinputModelObj?.copyWith(
          selectedDropDownValue6: event.value,
          selectedDropDownValue1:
              state.addLiverstockinputModelObj?.selectedDropDownValue1,
          selectedDropDownValue2:
              state.addLiverstockinputModelObj?.selectedDropDownValue2,
          selectedDropDownValue3:
              state.addLiverstockinputModelObj?.selectedDropDownValue3,
          selectedDropDownValue4:
              state.addLiverstockinputModelObj?.selectedDropDownValue4,
          selectedDropDownValue5:
              state.addLiverstockinputModelObj?.selectedDropDownValue5,
          selectedDropDownValue7:
              state.addLiverstockinputModelObj?.selectedDropDownValue7,
        )));
  }

  _changeDropDown7(
    ChangeDropDown7Event event,
    Emitter<AddLiverstockinputState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue7: event.value,
        addLiverstockinputModelObj: state.addLiverstockinputModelObj?.copyWith(
          selectedDropDownValue7: event.value,
          selectedDropDownValue1:
              state.addLiverstockinputModelObj?.selectedDropDownValue1,
          selectedDropDownValue2:
              state.addLiverstockinputModelObj?.selectedDropDownValue2,
          selectedDropDownValue3:
              state.addLiverstockinputModelObj?.selectedDropDownValue3,
          selectedDropDownValue4:
              state.addLiverstockinputModelObj?.selectedDropDownValue4,
          selectedDropDownValue5:
              state.addLiverstockinputModelObj?.selectedDropDownValue5,
          selectedDropDownValue6:
              state.addLiverstockinputModelObj?.selectedDropDownValue6,
        )));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Yes",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 0,
        title: "No",
      ),
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList1() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Yes",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 0,
        title: "No",
      ),
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList2() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Yes",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 0,
        title: "No",
      ),
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList3() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Yes",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 0,
        title: "No",
      ),
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList4() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList5() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Yes",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 0,
        title: "No",
      ),
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList6() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Yes",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 0,
        title: "No",
      ),
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList7() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Yes",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 0,
        title: "No",
      ),
    ];
  }
}

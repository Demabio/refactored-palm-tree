import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kiamis_app/core/utils/progress_dialog_utils.dart';
import 'package:kiamis_app/data/models/dbModels/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/enterprise.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmownership.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/enterpirses.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farm.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/enterprise.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/enterprisesmodel.dart';
import '/core/app_export.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/primary_farm_holding_two_model.dart';
part 'primary_farm_holding_two_event.dart';
part 'primary_farm_holding_two_state.dart';

/// A bloc that manages the state of a PrimaryFarmHoldingTwo according to the event that is dispatched to it.
class PrimaryFarmHoldingTwoBloc
    extends Bloc<PrimaryFarmHoldingTwoEvent, PrimaryFarmHoldingTwoState> {
  PrimaryFarmHoldingTwoBloc(PrimaryFarmHoldingTwoState initialState)
      : super(initialState) {
    on<PrimaryFarmHoldingTwoInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
    on<ChangeDropDown3Event>(_changeDropDown3);
    on<ChangeDropDown4Event>(_changeDropDown4);
    on<NextTapEvent>(_nextTap);
    on<GetLocation>(_getLocationEvent);
    on<SaveTapEvent>(_saveTap);
    on<ChangeEnterprisesCheckbox>(_changeEnterpriseCB);
  }
  // final LocationRepository locationRepository = LocationRepository();
  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      double latitude = position.latitude;
      double longitude = position.longitude;
      print("Latitude: $latitude, Longitude: $longitude");
    } catch (e) {
      print("Error: $e");
    }
  }

  void _getLocationEvent(
      GetLocation event, Emitter<PrimaryFarmHoldingTwoState> emit) async {
    try {
      bool isLocationServiceEnabled =
          await Geolocator.isLocationServiceEnabled();
      if (!isLocationServiceEnabled) {
        event.createFailed!.call();
      }
      var status = await Permission.location.request();
      if (status.isDenied) {
        event.createFailed!.call();
      }

      if (status.isPermanentlyDenied) {
        event.createFailed!.call();
      }
      ProgressDialogUtils.showProgressDialog();

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      double y = position.latitude;
      double x = position.longitude;
      int accuracy = position.accuracy == 0.0 ? 10 : position.accuracy.toInt();
      // LatLng? _currentLocation =
      //     (await locationRepository.getCurrentLocation()) as LatLng?;
      // double x = _currentLocation!.longitude;
      // double y = _currentLocation!.latitude;
      TextEditingController lat = TextEditingController(text: y.toString());
      TextEditingController long = TextEditingController(text: x.toString());

      emit(
        state.copyWith(
          titleoneController: long,
          titlethreeController: lat,
          accuracy: accuracy.toString(),
        ),
      );
    } catch (e) {
      print("Error: $e");
    } finally {
      ProgressDialogUtils.hideProgressDialog();
    }
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
      primaryFarmHoldingTwoModelObj:
          state.primaryFarmHoldingTwoModelObj?.copyWith(
        selectedDropDownValue: event.value,
        selectedDropDownValue1:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue1,
        selectedDropDownValue2:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue2,
        selectedDropDownValue3:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue3,
        selectedDropDownValue4:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue4,
      ),
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
      primaryFarmHoldingTwoModelObj:
          state.primaryFarmHoldingTwoModelObj?.copyWith(
        selectedDropDownValue1: event.value,
        selectedDropDownValue:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue,
        selectedDropDownValue2:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue2,
        selectedDropDownValue3:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue3,
        selectedDropDownValue4:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue4,
      ),
    ));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue2: event.value,
      primaryFarmHoldingTwoModelObj:
          state.primaryFarmHoldingTwoModelObj?.copyWith(
        selectedDropDownValue2: event.value,
        selectedDropDownValue1:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue1,
        selectedDropDownValue:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue,
        selectedDropDownValue3:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue3,
        selectedDropDownValue4:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue4,
      ),
    ));
  }

  _changeDropDown3(
    ChangeDropDown3Event event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue3: event.value,
      primaryFarmHoldingTwoModelObj:
          state.primaryFarmHoldingTwoModelObj?.copyWith(
        selectedDropDownValue3: event.value,
        selectedDropDownValue1:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue1,
        selectedDropDownValue2:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue2,
        selectedDropDownValue:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue,
        selectedDropDownValue4:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue4,
      ),
    ));
  }

  _changeDropDown4(
    ChangeDropDown4Event event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue4: event.value,
      primaryFarmHoldingTwoModelObj:
          state.primaryFarmHoldingTwoModelObj?.copyWith(
        selectedDropDownValue4: event.value,
        selectedDropDownValue1:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue1,
        selectedDropDownValue2:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue2,
        selectedDropDownValue3:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue3,
        selectedDropDownValue:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue,
      ),
    ));
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
      SelectionPopupModel(id: 0, title: "No")
    ];
  }

  _changeEnterpriseCB(
    ChangeEnterprisesCheckbox event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    bool filled = false;
    List<EnterpriseModel> newModels =
        state.primaryFarmHoldingTwoModelObj!.enterprises;

    newModels[event.value].isSelected = event.selected!;
    int selectedCount =
        newModels.where((enterprise) => enterprise.isSelected).length;
    filled = selectedCount > 0;
    emit(state.copyWith(
        filled: filled,
        primaryFarmHoldingTwoModelObj:
            state.primaryFarmHoldingTwoModelObj?.copyWith(
          enterprises: newModels,
          count: state.primaryFarmHoldingTwoModelObj!.count + 1,
          enterprisesF: filled,
          selectedDropDownValue:
              state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue,
          selectedDropDownValue1:
              state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue1,
          selectedDropDownValue2:
              state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue2,
          selectedDropDownValue3:
              state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue3,
          selectedDropDownValue4:
              state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue4,
        )));
  }

  Future<List<SelectionPopupModel>> fetchOwnerships() async {
    List<SelectionPopupModel> list = [];
    FarmerFarmOwnershipDB farmOwnershipDB = FarmerFarmOwnershipDB();

    await farmOwnershipDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].ownershipDesc,
          id: value[i].ownershipId,
        ));
      }
    });
    return list;
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

  _nextTap(
    NextTapEvent event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);
    FarmerFarmDB farmDB = FarmerFarmDB();
    if (state.filled) {
      try {
        farmDB
            .updatePageTwo(FarmerFarm(
          farmerId: PrefUtils().getFarmerId(),
          farmerFarmId: PrefUtils().getFarmId(),
          x: double.parse(state.titlethreeController!.text),
          y: double.parse(state.titleoneController!.text),
          ownershipId:
              state.primaryFarmHoldingTwoModelObj!.selectedDropDownValue!.id,
          farmLrCert: state.titlesevenController?.text,
          otherFarmElsewhere:
              state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue1!.id ==
                  1,
          cropProd:
              state.primaryFarmHoldingTwoModelObj!.selectedDropDownValue2!.id ==
                  1,
          livestockProd:
              state.primaryFarmHoldingTwoModelObj!.selectedDropDownValue3!.id ==
                  1,
          fishFarming:
              state.primaryFarmHoldingTwoModelObj!.selectedDropDownValue4!.id ==
                  1,
        ))
            .then((value) async {
          if (value > 0) {
            PFProgressDB pfProgressDB = PFProgressDB();
            pfProgressDB
                .update(PFProgress(
                  farmId: PrefUtils().getFarmId(),
                  pageOne: 1,
                  pageTwo: 1,
                ))
                .then((value) => print("Scope PF " + value.toString()));
            FarmerEnterprisesDB farmerEnterprisesDB = FarmerEnterprisesDB();
            await farmerEnterprisesDB.delete(
                state.primaryFarmHoldingTwoModelObj!.farm!.farmerFarmId);

            List<FarmerEnterprise> ents = [];
            List<FarmerEnterprise> notselected = [];

            for (var ent in state.primaryFarmHoldingTwoModelObj!.enterprises) {
              notselected.add(FarmerEnterprise(
                farmerEnterpriseId: 0,
                farmerFarmId:
                    state.primaryFarmHoldingTwoModelObj!.farm!.farmerFarmId,
                enterpriseId: ent.enterpriseId!,
                insured: 0,
                createdBy: userId,
                dateCreated: DateTime.now(),
              ));
              if (ent.isSelected) {
                ents.add(FarmerEnterprise(
                  farmerEnterpriseId: 0,
                  farmerFarmId:
                      state.primaryFarmHoldingTwoModelObj!.farm!.farmerFarmId,
                  enterpriseId: ent.enterpriseId!,
                  insured: 0,
                  createdBy: userId,
                  dateCreated: DateTime.now(),
                ));
              }
            }
            await farmerEnterprisesDB
                .insertEnterprises(notselected)
                .then((value) => print("inserted $value"));
            event.createSuccessful!.call();
          } else {
            event.createFailed!.call();
          }
        });
      } catch (e) {
        event.createFailed!.call();
      }
    } else {
      emit(state.copyWith(checked: true));
      event.createFailed!.call();
    }
  }

  _saveTap(
    SaveTapEvent event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);
    FarmerFarmDB farmDB = FarmerFarmDB();
    int selectedCount = state.primaryFarmHoldingTwoModelObj!.enterprises
        .where((enterprise) => enterprise.isSelected)
        .length;
    if (selectedCount != 0) {
      try {
        farmDB
            .updatePageTwo(FarmerFarm(
          farmerId: PrefUtils().getFarmerId(),
          farmerFarmId: PrefUtils().getFarmId(),
          x: double.parse(state.titleoneController!.text),
          y: double.parse(state.titlethreeController!.text),
          accuracyLevel: double.parse(state.accuracy!),
          ownershipId:
              state.primaryFarmHoldingTwoModelObj!.selectedDropDownValue!.id,
          farmLrCert: state.titlesevenController?.text,
          otherFarmElsewhere:
              state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue1!.id ==
                  1,
          cropProd:
              state.primaryFarmHoldingTwoModelObj!.selectedDropDownValue2!.id ==
                  1,
          livestockProd:
              state.primaryFarmHoldingTwoModelObj!.selectedDropDownValue3!.id ==
                  1,
          fishFarming:
              state.primaryFarmHoldingTwoModelObj!.selectedDropDownValue4!.id ==
                  1,
        ))
            .then((value) async {
          if (value > 0) {
            PFProgressDB pfProgressDB = PFProgressDB();
            pfProgressDB
                .update(PFProgress(
                  farmId: PrefUtils().getFarmId(),
                  pageOne: 1,
                  pageTwo: 1,
                ))
                .then((value) => print("Scope PF " + value.toString()));
            FarmerEnterprisesDB farmerEnterprisesDB = FarmerEnterprisesDB();
            await farmerEnterprisesDB.delete(
                state.primaryFarmHoldingTwoModelObj!.farm!.farmerFarmId);

            List<FarmerEnterprise> ents = [];
            List<FarmerEnterprise> notselected = [];

            for (var ent in state.primaryFarmHoldingTwoModelObj!.enterprises) {
              notselected.add(FarmerEnterprise(
                farmerEnterpriseId: 0,
                farmerFarmId:
                    state.primaryFarmHoldingTwoModelObj!.farm!.farmerFarmId,
                enterpriseId: ent.enterpriseId!,
                insured: 0,
                createdBy: userId,
                dateCreated: DateTime.now(),
              ));
              if (ent.isSelected) {
                ents.add(FarmerEnterprise(
                  farmerEnterpriseId: 0,
                  farmerFarmId:
                      state.primaryFarmHoldingTwoModelObj!.farm!.farmerFarmId,
                  enterpriseId: ent.enterpriseId!,
                  insured: 0,
                  createdBy: userId,
                  dateCreated: DateTime.now(),
                ));
              }
            }
            if (state.primaryFarmHoldingTwoModelObj!.pfProgress?.pageTwo == 0) {
              await farmerEnterprisesDB
                  .insertEnterprises(notselected)
                  .then((value) => print("inserted $value"));
            }
            await farmerEnterprisesDB
                .reinsertEnterprises(ents)
                .then((value) => print("inserted $value"));
            event.createSuccessful!.call();
          } else {
            event.createFailed!.call();
          }
        });
      } catch (e) {
        event.createFailed!.call();
      }
    } else {
      int selectedCount = state.primaryFarmHoldingTwoModelObj!.enterprises
          .where((enterprise) => enterprise.isSelected)
          .length;
      emit(state.copyWith(checked: selectedCount == 0));
      event.createFailed!.call();
    }
  }

  Future<FarmerFarm?> getFarm() async {
    int farmid = PrefUtils().getFarmId();
    FarmerFarmDB farmDB = FarmerFarmDB();
    return await farmDB.fetchByFarmerFarmId(farmid);
  }

  Future<PFProgress?> getProgress() async {
    int farmerid = PrefUtils().getFarmId();
    PFProgressDB pfProgressDB = PFProgressDB();
    return await pfProgressDB.fetchByFarmId(farmerid);
  }

  Future<List<FarmerEnterprise>?> getEnterprises() async {
    int farmid = PrefUtils().getFarmId();
    FarmerEnterprisesDB farmerEnterprisesDB = FarmerEnterprisesDB();
    return await farmerEnterprisesDB.fetchAllByFarmId(farmid);
  }

  _onInitialize(
    PrimaryFarmHoldingTwoInitialEvent event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) async {
    FarmerFarm farm = await getFarm() ??
        FarmerFarm(
          farmerId: 0,
          farmerFarmId: 0,
        );
    PFProgress pfProgress = await getProgress() ??
        PFProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );

    //print(farmer);
    TextEditingController titleoneController = TextEditingController();
    TextEditingController titlethreeController = TextEditingController();
    TextEditingController titlesevenController = TextEditingController();

    List<FarmerEnterprise> farments = await getEnterprises() ?? [];
    List<EnterpriseModel> ents = await fetchEnterprises();

    List<SelectionPopupModel> owners = await fetchOwnerships();
    SelectionPopupModel? selectedowners;
    List<SelectionPopupModel> farms = fillDropdownItemList1();

    List<SelectionPopupModel> crop = fillDropdownItemList1();
    List<SelectionPopupModel> livestock = fillDropdownItemList1();
    List<SelectionPopupModel> fish = fillDropdownItemList1();

    SelectionPopupModel? selectedfarms;
    SelectionPopupModel? selectedDropDownValue2;
    SelectionPopupModel? selectedDropDownValue3;
    SelectionPopupModel? selectedDropDownValue4;

    if (pfProgress.pageTwo == 1 && farm.farmerFarmId != 0) {
      titleoneController = TextEditingController(text: farm.x.toString());
      titlethreeController = TextEditingController(text: farm.y.toString());
      titlesevenController = TextEditingController(text: farm.farmLrCert);

      selectedowners = owners.firstWhere(
        (model) => model.id == farm.ownershipId,
      );

      selectedfarms = farms.firstWhere(
        (model) => model.id == (farm.otherFarmElsewhere! ? 1 : 0),
      );
      selectedDropDownValue2 = crop.firstWhere(
        (model) => model.id == (farm.cropProd! ? 1 : 0),
      );
      selectedDropDownValue3 = livestock.firstWhere(
        (model) => model.id == (farm.livestockProd! ? 1 : 0),
      );
      selectedDropDownValue4 = fish.firstWhere(
        (model) => model.id == (farm.fishFarming! ? 1 : 0),
      );

      for (var ent in farments) {
        int index =
            ents.indexWhere((obj) => obj.enterpriseId == ent.enterpriseId);

        ents[index].isSelected = true;
      }
    }
    int stepper = 0;
    if (pfProgress.pageTwo == 1) {
      stepper = 2;
    } else if (pfProgress.pageOne == 1) {
      stepper = 1;
    }
    emit(state.copyWith(
      titleoneController: titleoneController,
      titlethreeController: titlethreeController,
      titlesevenController: titlesevenController,
      growingCropsFor: false,
      trashone: false,
      trashtwo: false,
      trashthree: false,
      treeFarming: false,
    ));
    emit(
      state.copyWith(
        accuracy: farm.accuracyLevel.toString(),
        primaryFarmHoldingTwoModelObj:
            state.primaryFarmHoldingTwoModelObj?.copyWith(
          enterprises: ents,
          dropdownItemList: owners,
          dropdownItemList1: farms,
          dropdownItemList2: crop,
          dropdownItemList3: livestock,
          dropdownItemList4: fish,
          selectedDropDownValue: selectedowners,
          selectedDropDownValue1: selectedfarms,
          stepped2: stepper,
          farm: farm,
          pfProgress: pfProgress,
          selectedDropDownValue2: selectedDropDownValue2,
          selectedDropDownValue3: selectedDropDownValue3,
          selectedDropDownValue4: selectedDropDownValue4,
        ),
      ),
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/other/enterpirses.dart';
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

    on<ChangeEnterprisesCheckbox>(_changeEnterpriseCB);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue: event.value));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue1: event.value));
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
        primaryFarmHoldingTwoModelObj:
            state.primaryFarmHoldingTwoModelObj?.copyWith(
      enterprises: newModels,
      //count: state.primaryFarmHoldingTwoModelObj!.count + 1,
      enterprisesF: filled,
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
    FarmerFarmDB farmDB = FarmerFarmDB();

    try {
      farmDB
          .updatePageTwo(FarmerFarm(
        farmerId: state.primaryFarmHoldingTwoModelObj!.farm!.farmerId,
        farmerFarmId: state.primaryFarmHoldingTwoModelObj!.farm!.farmerFarmId,
        x: double.parse(state.titlethreeController!.text),
        y: double.parse(state.titleoneController!.text),
        ownershipId:
            state.primaryFarmHoldingTwoModelObj!.selectedDropDownValue!.id,
        farmLrCert: state.titlesevenController?.text,
        otherFarmElsewhere:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue1!.id ==
                1,
      ))
          .then((value) {
        if (value > 0) {
          PFProgressDB pfProgressDB = PFProgressDB();
          pfProgressDB
              .update(PFProgress(
                farmId: state.primaryFarmHoldingTwoModelObj!.farm!.farmerFarmId,
                pageOne: 1,
                pageTwo: 1,
              ))
              .then((value) => print("Scope PF " + value.toString()));
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
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    FarmerFarmDB farmDB = FarmerFarmDB();

    try {
      farmDB
          .updatePageTwo(FarmerFarm(
        farmerId: state.primaryFarmHoldingTwoModelObj!.farm!.farmerId,
        farmerFarmId: state.primaryFarmHoldingTwoModelObj!.farm!.farmerFarmId,
        x: double.parse(state.titlethreeController!.text),
        y: double.parse(state.titleoneController!.text),
        ownershipId:
            state.primaryFarmHoldingTwoModelObj!.selectedDropDownValue!.id,
        farmLrCert: state.titlesevenController?.text,
        otherFarmElsewhere:
            state.primaryFarmHoldingTwoModelObj?.selectedDropDownValue1!.id ==
                1,
      ))
          .then((value) async {
        if (value > 0) {
          PFProgressDB pfProgressDB = PFProgressDB();
          pfProgressDB
              .update(PFProgress(
                farmId: state.primaryFarmHoldingTwoModelObj!.farm!.farmerFarmId,
                pageOne: 1,
                pageTwo: 1,
              ))
              .then((value) => print("Scope PF " + value.toString()));
          FarmerEnterprisesDB farmerEnterprisesDB = FarmerEnterprisesDB();
          int deleted = await farmerEnterprisesDB
              .delete(state.primaryFarmHoldingTwoModelObj!.farm!.farmerFarmId);

          List<FarmerEnterprise> ents = [];

          for (var ent in state.primaryFarmHoldingTwoModelObj!.enterprises) {
            if (ent.isSelected) {
              ents.add(FarmerEnterprise(
                farmerEnterpriseId: 0,
                farmerFarmId:
                    state.primaryFarmHoldingTwoModelObj!.farm!.farmerFarmId,
                enterpriseId: ent.enterpriseId!,
                dateCreated: DateTime.now(),
              ));
            }
          }
          await farmerEnterprisesDB
              .insertEnterprises(ents)
              .then((value) => print("inserted $value"));
          event.createSuccessful!.call();
        } else {
          event.createFailed!.call();
        }
      });
    } catch (e) {
      event.createFailed!.call();
    }
  }

  Future<FarmerFarm?> getFarm() async {
    int farmid = PrefUtils().getFarmId();
    FarmerFarmDB farmDB = FarmerFarmDB();
    return await farmDB.fetchByFarmerFarmId(farmid);
  }

  Future<PFProgress?> getProgress() async {
    int farmerid = PrefUtils().getFarmerId();
    PFProgressDB pfProgressDB = PFProgressDB();
    return await pfProgressDB.fetchByFarmerId(farmerid);
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
    SelectionPopupModel? selectedfarms;
    if (pfProgress.pageOne == 1 && farm.farmerId != 0) {
      titleoneController = TextEditingController(text: farm.y.toString());
      titlethreeController = TextEditingController(text: farm.x.toString());
      titlesevenController = TextEditingController(text: farm.farmLrCert);

      selectedowners = owners.firstWhere(
        (model) => model.id == farm.ownershipId,
      );

      selectedfarms = farms.firstWhere(
        (model) => model.id == (farm.otherFarmElsewhere! ? 1 : 0),
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
        primaryFarmHoldingTwoModelObj:
            state.primaryFarmHoldingTwoModelObj?.copyWith(
          enterprises: ents,
          dropdownItemList: owners,
          dropdownItemList1: farms,
          selectedDropDownValue: selectedowners,
          selectedDropDownValue1: selectedfarms,
          stepped2: stepper,
        ),
      ),
    );
  }
}

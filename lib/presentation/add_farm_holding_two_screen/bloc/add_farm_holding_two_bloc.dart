import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/enterprise.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmownership.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/enterpirses.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farm.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/otherfarms.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/enterprise.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/enterprisesmodel.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_farm_holding_two_screen/models/add_farm_holding_two_model.dart';
part 'add_farm_holding_two_event.dart';
part 'add_farm_holding_two_state.dart';

/// A bloc that manages the state of a AddFarmHoldingTwo according to the event that is dispatched to it.
class AddFarmHoldingTwoBloc
    extends Bloc<AddFarmHoldingTwoEvent, AddFarmHoldingTwoState> {
  AddFarmHoldingTwoBloc(AddFarmHoldingTwoState initialState)
      : super(initialState) {
    on<AddFarmHoldingTwoInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);

    on<SaveTapEvent>(_saveTap);
    on<ChangeEnterprisesCheckbox>(_changeEnterpriseCB);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddFarmHoldingTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
      addFarmHoldingTwoModelObj: state.addFarmHoldingTwoModelObj?.copyWith(
        selectedDropDownValue: event.value,
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
    Emitter<AddFarmHoldingTwoState> emit,
  ) {
    bool filled = false;
    List<EnterpriseModel> newModels =
        state.addFarmHoldingTwoModelObj!.enterprises;

    newModels[event.value].isSelected = event.selected!;
    int selectedCount =
        newModels.where((enterprise) => enterprise.isSelected).length;
    filled = selectedCount > 0;
    emit(state.copyWith(
        filled: filled,
        addFarmHoldingTwoModelObj: state.addFarmHoldingTwoModelObj?.copyWith(
          enterprises: newModels,
          count: state.addFarmHoldingTwoModelObj!.count + 1,
          enterprisesF: filled,
          selectedDropDownValue:
              state.addFarmHoldingTwoModelObj?.selectedDropDownValue,
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

  _saveTap(
    SaveTapEvent event,
    Emitter<AddFarmHoldingTwoState> emit,
  ) {
    FarmerOtherFarmDB farmDB = FarmerOtherFarmDB();
    if (state.filled) {
      try {
        farmDB
            .updatePageTwo(FarmerFarm(
          farmerId: PrefUtils().getFarmerId(),
          farmerFarmId: PrefUtils().getotherFarmId(),
          ownershipId:
              state.addFarmHoldingTwoModelObj!.selectedDropDownValue!.id,
          farmLrCert: state.titlethreeController?.text,
          otherFarmElsewhere: true,
        ))
            .then((value) async {
          if (value > 0) {
            PFProgressDB pfProgressDB = PFProgressDB();
            pfProgressDB
                .update(PFProgress(
                  farmId: PrefUtils().getotherFarmId(),
                  pageOne: 1,
                  pageTwo: 1,
                ))
                .then((value) => print("Scope PF " + value.toString()));
            FarmerEnterprisesDB farmerEnterprisesDB = FarmerEnterprisesDB();
            int deleted = await farmerEnterprisesDB
                .delete(state.addFarmHoldingTwoModelObj!.farm!.farmerFarmId);

            List<FarmerEnterprise> ents = [];

            for (var ent in state.addFarmHoldingTwoModelObj!.enterprises) {
              if (ent.isSelected) {
                ents.add(FarmerEnterprise(
                  farmerEnterpriseId: 0,
                  farmerFarmId:
                      state.addFarmHoldingTwoModelObj!.farm!.farmerFarmId,
                  enterpriseId: ent.enterpriseId!,
                  insured: 0,
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
    } else {
      emit(state.copyWith(checked: true));
      event.createFailed!.call();
    }
  }

  Future<FarmerFarm?> getFarm() async {
    int farmid = PrefUtils().getotherFarmId();
    FarmerOtherFarmDB farmDB = FarmerOtherFarmDB();
    return await farmDB.fetchByFarmerFarmId(farmid);
  }

  Future<PFProgress?> getProgress() async {
    int farmerid = PrefUtils().getotherFarmId();
    PFProgressDB pfProgressDB = PFProgressDB();
    return await pfProgressDB.fetchByFarmerId(farmerid);
  }

  Future<List<FarmerEnterprise>?> getEnterprises() async {
    int farmid = PrefUtils().getotherFarmId();
    FarmerEnterprisesDB farmerEnterprisesDB = FarmerEnterprisesDB();
    return await farmerEnterprisesDB.fetchAllByFarmId(farmid);
  }

  _onInitialize(
    AddFarmHoldingTwoInitialEvent event,
    Emitter<AddFarmHoldingTwoState> emit,
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

    TextEditingController titlesevenController = TextEditingController();

    List<FarmerEnterprise> farments = await getEnterprises() ?? [];
    List<EnterpriseModel> ents = await fetchEnterprises();

    List<SelectionPopupModel> owners = await fetchOwnerships();
    SelectionPopupModel? selectedowners;
    if (pfProgress.pageTwo == 1 && farm.farmerFarmId != 0) {
      titlesevenController = TextEditingController(text: farm.farmLrCert);

      selectedowners = owners.firstWhere(
        (model) => model.id == farm.ownershipId,
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
      titlethreeController: titlesevenController,
      growingCropsFor: false,
      trashone: false,
      trashtwo: false,
      trashthree: false,
      treeFarming: false,
    ));
    emit(
      state.copyWith(
        addFarmHoldingTwoModelObj: state.addFarmHoldingTwoModelObj?.copyWith(
          enterprises: ents,
          dropdownItemList: owners,
          selectedDropDownValue: selectedowners,
          stepped2: stepper,
          farm: farm,
          pfProgress: pfProgress,
        ),
      ),
    );
  }
}

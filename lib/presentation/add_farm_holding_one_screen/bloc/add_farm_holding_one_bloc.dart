import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropareaunit.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/otherfarms.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_farm_holding_one_screen/models/add_farm_holding_one_model.dart';
part 'add_farm_holding_one_event.dart';
part 'add_farm_holding_one_state.dart';

/// A bloc that manages the state of a AddFarmHoldingOne according to the event that is dispatched to it.
class AddFarmHoldingOneBloc
    extends Bloc<AddFarmHoldingOneEvent, AddFarmHoldingOneState> {
  AddFarmHoldingOneBloc(AddFarmHoldingOneState initialState)
      : super(initialState) {
    on<AddFarmHoldingOneInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<NextTapEvent>(_nextTap);
    on<SaveTapEvent>(_saveTap);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddFarmHoldingOneState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue: event.value,
        addFarmHoldingOneModelObj: state.addFarmHoldingOneModelObj?.copyWith(
          selectedDropDownValue: event.value,
        )));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }

  Future<List<SelectionPopupModel>> fetchAreaUnits() async {
    List<SelectionPopupModel> list = [];
    CropAreaUnitDB areaUnitDB = CropAreaUnitDB();

    await areaUnitDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].areaUnit,
          id: value[i].areaUnitId,
        ));
      }
    });
    return list;
  }

  _nextTap(
    NextTapEvent event,
    Emitter<AddFarmHoldingOneState> emit,
  ) {
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);
    FarmerOtherFarmDB farmDB = FarmerOtherFarmDB();
    int farmerid = PrefUtils().getotherFarmId();
    try {
      if (state.addFarmHoldingOneModelObj!.pfProgress!.pageOne == 0) {
        farmDB
            .create(FarmerFarm(
          farmerFarmId: 0,
          farmerId: PrefUtils().getFarmerId(),
          dateCreated: DateTime.now(),
          createdBy: userId,
        ))
            .then((value) {
          if (value > 0) {
            PrefUtils().setotherFarmId(value);

            farmDB.updatePageOne(FarmerFarm(
              farmerFarmId: value,
              farmerId: farmerid,
              farmName: state.nameController!.text,
              farmSize: double.parse(state.sizeController!.text),
              areaUnitId:
                  state.addFarmHoldingOneModelObj!.selectedDropDownValue!.id,
              cropFarmSize: double.parse(state.sizeController!.text),
              livestockFarmSize: double.parse(state.sizeController!.text),
              leasedFarmSize: double.parse(state.sizeController?.text ?? "0"),
              idleFarmSize: double.parse(state.sizeController?.text ?? "0"),
            ));

            PFProgressDB pfProgressDB = PFProgressDB();
            if (state.addFarmHoldingOneModelObj!.pfProgress!.pageOne == 0) {
              pfProgressDB
                  .insert(PFProgress(
                    farmId: value,
                    pageOne: 1,
                    pageTwo: 0,
                  ))
                  .then((value) => print("Scope FI" + value.toString()));
            } else {
              pfProgressDB
                  .update(PFProgress(
                    farmId: value,
                    pageOne: 1,
                    pageTwo:
                        state.addFarmHoldingOneModelObj!.pfProgress!.pageTwo,
                  ))
                  .then((value) => print("Scope FI" + value.toString()));
            }
          } else {
            event.createFailed!.call();
          }
        });
      }
      if (state.addFarmHoldingOneModelObj!.pfProgress!.pageOne == 1) {
        if (farmerid != 0) {
          farmDB
              .updatePageOne(FarmerFarm(
                farmerFarmId: PrefUtils().getotherFarmId(),
                farmerId: farmerid,
                farmName: state.nameController!.text,
                farmSize: double.parse(state.sizeController!.text),
                areaUnitId:
                    state.addFarmHoldingOneModelObj!.selectedDropDownValue!.id,
                cropFarmSize: double.parse(state.sizeoneController!.text),
                livestockFarmSize: double.parse(state.areaController!.text),
                leasedFarmSize:
                    double.parse(state.sizetwoController?.text ?? "0"),
                idleFarmSize:
                    double.parse(state.sizethreeController?.text ?? "0"),
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
    Emitter<AddFarmHoldingOneState> emit,
  ) {
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);
    FarmerOtherFarmDB farmDB = FarmerOtherFarmDB();
    int farmerid = PrefUtils().getotherFarmId();
    try {
      if (state.addFarmHoldingOneModelObj!.pfProgress!.pageOne == 0) {
        farmDB
            .create(FarmerFarm(
          farmerFarmId: 0,
          farmerId: PrefUtils().getFarmerId(),
          dateCreated: DateTime.now(),
          createdBy: userId,
        ))
            .then((value) {
          if (value > 0) {
            PrefUtils().setotherFarmId(value);

            farmDB.updatePageOne(FarmerFarm(
              farmerFarmId: value,
              farmerId: farmerid,
              farmName: state.nameController!.text,
              farmSize: double.parse(state.sizeController!.text),
              areaUnitId:
                  state.addFarmHoldingOneModelObj!.selectedDropDownValue!.id,
              cropFarmSize: double.parse(state.sizeoneController!.text),
              livestockFarmSize: double.parse(state.areaController!.text),
              leasedFarmSize:
                  double.parse(state.sizetwoController?.text ?? "0"),
              idleFarmSize:
                  double.parse(state.sizethreeController?.text ?? "0"),
            ));

            PFProgressDB pfProgressDB = PFProgressDB();
            if (state.addFarmHoldingOneModelObj!.pfProgress!.pageOne == 0) {
              pfProgressDB
                  .insert(PFProgress(
                    farmId: value,
                    pageOne: 1,
                    pageTwo: 0,
                  ))
                  .then((value) => print("Scope FI" + value.toString()));
            } else {
              pfProgressDB
                  .update(PFProgress(
                    farmId: value,
                    pageOne: 1,
                    pageTwo:
                        state.addFarmHoldingOneModelObj!.pfProgress!.pageTwo,
                  ))
                  .then((value) => print("Scope FI" + value.toString()));
            }
          } else {
            event.createFailed!.call();
          }
        });
      }
      if (state.addFarmHoldingOneModelObj!.pfProgress!.pageOne == 1) {
        if (farmerid != 0) {
          farmDB
              .updatePageOne(FarmerFarm(
                farmerFarmId: PrefUtils().getotherFarmId(),
                farmerId: farmerid,
                farmName: state.nameController!.text,
                farmSize: double.parse(state.sizeController!.text),
                areaUnitId:
                    state.addFarmHoldingOneModelObj!.selectedDropDownValue!.id,
                cropFarmSize: double.parse(state.sizeoneController!.text),
                livestockFarmSize: double.parse(state.areaController!.text),
                leasedFarmSize:
                    double.parse(state.sizetwoController?.text ?? "0"),
                idleFarmSize:
                    double.parse(state.sizethreeController?.text ?? "0"),
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

  Future<FarmerFarm?> getFarm() async {
    int farmid = PrefUtils().getotherFarmId();
    FarmerOtherFarmDB farmDB = FarmerOtherFarmDB();
    return await farmDB.fetchByFarmerFarmId(farmid);
  }

  Future<PFProgress?> getProgress() async {
    int id = PrefUtils().getFarmId();
    PFProgressDB pfProgressDB = PFProgressDB();
    return await pfProgressDB.fetchByFarmId(id);
  }

  _onInitialize(
    AddFarmHoldingOneInitialEvent event,
    Emitter<AddFarmHoldingOneState> emit,
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
    TextEditingController nameController = TextEditingController();
    TextEditingController sizeController = TextEditingController();
    TextEditingController sizeoneController = TextEditingController();
    TextEditingController areaController = TextEditingController();
    TextEditingController sizeLandLeasedController = TextEditingController();
    TextEditingController sizeLandIdleController = TextEditingController();

    List<SelectionPopupModel> area = await fetchAreaUnits();
    SelectionPopupModel? selectedarea;

    if (pfProgress.pageOne == 1 && farm.farmerFarmId != 0) {
      nameController = TextEditingController(text: farm.farmName);
      sizeController = TextEditingController(text: farm.farmSize.toString());
      sizeoneController =
          TextEditingController(text: farm.cropFarmSize.toString());
      areaController =
          TextEditingController(text: farm.livestockFarmSize.toString());
      sizeLandLeasedController =
          TextEditingController(text: farm.leasedFarmSize.toString());
      sizeLandIdleController =
          TextEditingController(text: farm.idleFarmSize.toString());

      selectedarea = area.firstWhere(
        (model) => model.id == farm.areaUnitId,
      );
    }
    int stepper = 0;
    if (pfProgress.pageTwo == 1) {
      stepper = 2;
    } else if (pfProgress.pageOne == 1) {
      stepper = 1;
    }
    emit(state.copyWith(
      nameController: nameController,
      sizeController: sizeController,
      sizeoneController: sizeoneController,
      areaController: areaController,
      sizetwoController: sizeLandLeasedController,
      sizethreeController: sizeLandIdleController,
    ));
    emit(
      state.copyWith(
        addFarmHoldingOneModelObj: state.addFarmHoldingOneModelObj?.copyWith(
          dropdownItemList: area,
          selectedDropDownValue: selectedarea,
          stepped2: stepper,
          pfProgress: pfProgress,
          farm: farm,
        ),
      ),
    );
  }
}

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropareaunit.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farm.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_one_screen/models/primary_farm_holding_one_model.dart';
part 'primary_farm_holding_one_event.dart';
part 'primary_farm_holding_one_state.dart';

/// A bloc that manages the state of a PrimaryFarmHoldingOne according to the event that is dispatched to it.
class PrimaryFarmHoldingOneBloc
    extends Bloc<PrimaryFarmHoldingOneEvent, PrimaryFarmHoldingOneState> {
  PrimaryFarmHoldingOneBloc(PrimaryFarmHoldingOneState initialState)
      : super(initialState) {
    on<PrimaryFarmHoldingOneInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<NextTapEvent>(_nextTap);
    on<SaveTapEvent>(_saveTap);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<PrimaryFarmHoldingOneState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue: event.value,
        primaryFarmHoldingOneModelObj:
            state.primaryFarmHoldingOneModelObj?.copyWith(
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
    Emitter<PrimaryFarmHoldingOneState> emit,
  ) {
    double farmsize = double.parse(state.sizeController!.text);
    double cropsize = double.parse(state.sizeoneController!.text);
    double livesize = double.parse(state.areaController!.text);
    double leasedsize = double.parse(state.sizeLandLeasedController?.text == ""
        ? "0"
        : state.sizeLandLeasedController!.text);
    double idlesize = double.parse(state.sizeLandIdleController?.text == ""
        ? "0"
        : state.sizeLandIdleController!.text);

    double combined = cropsize + livesize + leasedsize + idlesize;

    if (combined > farmsize) {
      event.validation?.call();
      return;
    }
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);

    String ward = claims.payload['WardId'] ?? "1";
    String sublocation = claims.payload['SublocationId'] ?? "1";
    // String location = claims.payload['LocationId'] ?? "1";
    String constituency = claims.payload['ConstituencyId'] ?? "1";
    // String county = claims.payload['CountyId'] ?? "1";
    // String subcounty = claims.payload['SubcountyId'] ?? "1";
    String division = claims.payload['DivisionId'] ?? "1";

    int wardId = int.parse(ward.isEmpty ? "1" : ward);
    int sublocationId = int.parse(sublocation.isEmpty ? "1" : sublocation);

    // int locationId = int.parse(location.isEmpty ? "1" : location);

    int constituencyId = int.parse(constituency.isEmpty ? "1" : constituency);
    // int countyId = int.parse(county.isEmpty ? "1" : county);
    // int subcountyId = int.parse(subcounty.isEmpty ? "1" : subcounty);
    int divisionId = int.parse(division.isEmpty ? "1" : division);
    String enumeratorname = claims
        .payload['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name'];
    String enumeratorarea = claims.payload['EnumerationAreaNumber'];

    String enumeratormobile = claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/mobilephone'];

    FarmerFarmDB farmDB = FarmerFarmDB();
    int farmerid = PrefUtils().getFarmId();
    try {
      if (state.primaryFarmHoldingOneModelObj!.pfProgress!.pageOne == 0) {
        farmDB
            .create(FarmerFarm(
          farmerFarmId: 0,
          farmerId: PrefUtils().getFarmerId(),
          dateCreated: DateTime.now(),
          createdBy: userId,
          wardId: wardId,
          sublocationId: sublocationId,
          divisionId: divisionId,
          constituencyId: constituencyId,
        ))
            .then((value) {
          if (value > 0) {
            PrefUtils().setFarmId(value);

            farmDB.updatePageOne(FarmerFarm(
              farmerFarmId: value,
              farmerId: farmerid,
              villageName: state.vil?.text,
              shoppingCenter: state.shop?.text,
              farmName: state.nameController!.text,
              enumeratorId: userId,
              enumerationAreaNumber:
                  enumeratorarea.isEmpty ? "N/A" : enumeratorarea,
              enumeratorName: enumeratorname,
              enumeratorMobile: enumeratormobile,
              farmSize: double.parse(state.sizeController!.text),
              areaUnitId: state
                  .primaryFarmHoldingOneModelObj!.selectedDropDownValue!.id,
              cropFarmSize: double.parse(state.sizeoneController!.text),
              livestockFarmSize: double.parse(state.areaController!.text),
              leasedFarmSize: double.parse(
                  state.sizeLandLeasedController?.text == ""
                      ? "0"
                      : state.sizeLandLeasedController!.text),
              idleFarmSize: double.parse(
                  state.sizeLandIdleController?.text == ""
                      ? "0"
                      : state.sizeLandIdleController!.text),
            ));

            PFProgressDB pfProgressDB = PFProgressDB();
            if (state.primaryFarmHoldingOneModelObj!.pfProgress!.pageOne == 0) {
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
                    pageTwo: state
                        .primaryFarmHoldingOneModelObj!.pfProgress!.pageTwo,
                  ))
                  .then((value) => print("Scope FI" + value.toString()));
            }
            event.createSuccessful!.call();
          } else {
            event.createFailed!.call();
          }
        });
      }
      if (state.primaryFarmHoldingOneModelObj!.pfProgress!.pageOne == 1) {
        if (farmerid != 0) {
          farmDB
              .updatePageOne(FarmerFarm(
                farmerFarmId: PrefUtils().getFarmId(),
                farmerId: farmerid,
                farmName: state.nameController!.text,
                farmSize: double.parse(state.sizeController!.text),
                areaUnitId: state
                    .primaryFarmHoldingOneModelObj!.selectedDropDownValue!.id,
                cropFarmSize: double.parse(state.sizeoneController!.text),
                livestockFarmSize: double.parse(state.areaController!.text),
                leasedFarmSize:
                    double.parse(state.sizeLandLeasedController?.text ?? "0"),
                idleFarmSize:
                    double.parse(state.sizeLandIdleController?.text ?? "0"),
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

  _saveTap(
    SaveTapEvent event,
    Emitter<PrimaryFarmHoldingOneState> emit,
  ) {
    double farmsize = double.parse(state.sizeController!.text);
    double cropsize = double.parse(state.sizeoneController!.text);
    double livesize = double.parse(state.areaController!.text);
    double leasedsize = double.parse(state.sizeLandLeasedController?.text == ""
        ? "0"
        : state.sizeLandLeasedController!.text);
    double idlesize = double.parse(state.sizeLandIdleController?.text == ""
        ? "0"
        : state.sizeLandIdleController!.text);

    double combined = cropsize + livesize + leasedsize + idlesize;

    if (combined > farmsize) {
      event.validation?.call();
      return;
    }
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);
    String enumeratorname = claims.payload['fullName'];
    String enumeratorarea = claims.payload['roleID'];

    String enumeratormobile = claims.payload['mobilephone'];

    FarmerFarmDB farmDB = FarmerFarmDB();
    int farmerid = PrefUtils().getFarmId();
    try {
      if (state.primaryFarmHoldingOneModelObj!.pfProgress!.pageOne == 0) {
        farmDB
            .create(FarmerFarm(
          farmerFarmId: 0,
          farmerId: PrefUtils().getFarmerId(),
          dateCreated: DateTime.now(),
          createdBy: userId,
        ))
            .then((value) {
          if (value > 0) {
            PrefUtils().setFarmId(value);

            farmDB.updatePageOne(FarmerFarm(
              farmerFarmId: value,
              farmerId: farmerid,
              villageName: state.vil?.text,
              shoppingCenter: state.shop?.text,
              farmName: state.nameController!.text,
              enumeratorId: userId,
              enumerationAreaNumber: enumeratorarea,
              enumeratorName: enumeratorname,
              enumeratorMobile: enumeratormobile,
              farmSize: double.parse(state.sizeController!.text),
              areaUnitId: state
                  .primaryFarmHoldingOneModelObj!.selectedDropDownValue!.id,
              cropFarmSize: double.parse(state.sizeoneController!.text),
              livestockFarmSize: double.parse(state.areaController!.text),
              leasedFarmSize: double.parse(
                  state.sizeLandLeasedController?.text == ""
                      ? "0"
                      : state.sizeLandLeasedController!.text),
              idleFarmSize: double.parse(
                  state.sizeLandIdleController?.text == ""
                      ? "0"
                      : state.sizeLandIdleController!.text),
            ));

            PFProgressDB pfProgressDB = PFProgressDB();
            if (state.primaryFarmHoldingOneModelObj!.pfProgress!.pageOne == 0) {
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
                    pageTwo: state
                        .primaryFarmHoldingOneModelObj!.pfProgress!.pageTwo,
                  ))
                  .then((value) => print("Scope FI" + value.toString()));
            }
            event.createSuccessful!.call();
          } else {
            event.createFailed!.call();
          }
        });
      }
      if (state.primaryFarmHoldingOneModelObj!.pfProgress!.pageOne == 1) {
        if (farmerid != 0) {
          farmDB
              .updatePageOne(FarmerFarm(
                farmerFarmId: PrefUtils().getFarmId(),
                farmerId: farmerid,
                farmName: state.nameController!.text,
                farmSize: double.parse(state.sizeController!.text),
                areaUnitId: state
                    .primaryFarmHoldingOneModelObj!.selectedDropDownValue!.id,
                cropFarmSize: double.parse(state.sizeoneController!.text),
                livestockFarmSize: double.parse(state.areaController!.text),
                leasedFarmSize:
                    double.parse(state.sizeLandLeasedController?.text ?? "0"),
                idleFarmSize:
                    double.parse(state.sizeLandIdleController?.text ?? "0"),
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

  Future<FarmerFarm?> getFarm() async {
    int farmid = PrefUtils().getFarmId();
    FarmerFarmDB farmDB = FarmerFarmDB();
    return await farmDB.fetchByFarmerFarmId(farmid);
  }

  Future<PFProgress?> getProgress() async {
    int id = PrefUtils().getFarmId();
    PFProgressDB pfProgressDB = PFProgressDB();
    return await pfProgressDB.fetchByFarmId(id);
  }

  _onInitialize(
    PrimaryFarmHoldingOneInitialEvent event,
    Emitter<PrimaryFarmHoldingOneState> emit,
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
    TextEditingController vil = TextEditingController();
    TextEditingController shop = TextEditingController();
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

      vil = TextEditingController(text: farm.villageName);
      shop = TextEditingController(text: farm.shoppingCenter);

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
      sizeLandLeasedController: sizeLandLeasedController,
      sizeLandIdleController: sizeLandIdleController,
      vil: vil,
      shop: shop,
    ));
    emit(
      state.copyWith(
        primaryFarmHoldingOneModelObj:
            state.primaryFarmHoldingOneModelObj?.copyWith(
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

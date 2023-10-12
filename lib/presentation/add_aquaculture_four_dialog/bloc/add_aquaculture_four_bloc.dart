import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/productionsystem.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductiontype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductionuom.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/productionsystem.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_aquaculture_four_dialog/models/add_aquaculture_four_model.dart';
part 'add_aquaculture_four_event.dart';
part 'add_aquaculture_four_state.dart';

/// A bloc that manages the state of a AddAquacultureFour according to the event that is dispatched to it.
class AddAquacultureFourBloc
    extends Bloc<AddAquacultureFourEvent, AddAquacultureFourState> {
  AddAquacultureFourBloc(AddAquacultureFourState initialState)
      : super(initialState) {
    on<AddAquacultureFourInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
    on<ChangeDropDown3Event>(_changeDropDown3);
    on<ChangeDropDown4Event>(_changeDropDown4);
    on<ChangeDropDown5Event>(_changeDropDown5);
    on<AddCBs>(_addAgeGroups);
  }

  _onInitialize(
    AddAquacultureFourInitialEvent event,
    Emitter<AddAquacultureFourState> emit,
  ) async {
    emit(state.copyWith(
        inp1: TextEditingController(),
        inp2: TextEditingController(),
        inp3: TextEditingController(),
        inp4: TextEditingController(),
        addAquacultureFourModelObj: state.addAquacultureFourModelObj?.copyWith(
          dropdownItemList: await fillProdsystems(),
          dropdownItemList1: await fillUOMs(),
        )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddAquacultureFourState> emit,
  ) {
    FarmerFishProductionSystemDB farmerFishProductionSystemDB =
        FarmerFishProductionSystemDB();
    List<FarmerFishProductionSystem>? categs = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);
    int farmerid = PrefUtils().getFarmerId();
    int farmid = PrefUtils().getFarmerId();

    try {
      farmerFishProductionSystemDB.create(FarmerFishProductionSystem(
        farmerFishprodId: 0,
        farmerId: farmerid,
        farmerFarmId: farmid,
        productionTypeId:
            state.addAquacultureFourModelObj!.selectedDropDownValue!.id!,
        productionStatus: 0,
        noOfActiveUnits: int.parse(state.inp1!.text),
        activeArea: double.parse(state.inp2!.text),
        noOfInactiveUnits: int.parse(state.inp3!.text),
        inactiveArea: double.parse(state.inp4!.text),
        dateCreated: DateTime.now(),
        createdBy: userId,
      ));
      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddAquacultureFourState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddAquacultureFourState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
    ));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<AddAquacultureFourState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue2: event.value,
    ));
  }

  _changeDropDown3(
    ChangeDropDown3Event event,
    Emitter<AddAquacultureFourState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue3: event.value,
    ));
  }

  _changeDropDown4(
    ChangeDropDown4Event event,
    Emitter<AddAquacultureFourState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue4: event.value,
    ));
  }

  _changeDropDown5(
    ChangeDropDown5Event event,
    Emitter<AddAquacultureFourState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue5: event.value,
    ));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
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

  List<SelectionPopupModel> fillDropdownItemList1() {
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

  List<SelectionPopupModel> fillDropdownItemList2() {
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

  List<SelectionPopupModel> fillDropdownItemList3() {
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

  Future<List<SelectionPopupModel>> fillUOMs() async {
    List<SelectionPopupModel> list = [];
    FishProductionUnitOfMeasureDB fishProductionUnitOfMeasureDB =
        FishProductionUnitOfMeasureDB();
    await fishProductionUnitOfMeasureDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].unitOfMeasure,
          id: value[i].unitOfMeasureId,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fillProdsystems() async {
    List<SelectionPopupModel> list = [];
    FishProductionTypeDB fishProductionTypeDB = FishProductionTypeDB();
    await fishProductionTypeDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].fishProductionType,
          id: value[i].productionTypeId,
        ));
      }
    });
    return list;
  }
}

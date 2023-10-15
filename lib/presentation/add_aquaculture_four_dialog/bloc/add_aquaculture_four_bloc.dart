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
    int edit = PrefUtils().getEditId();
    CheckBoxList? data;
    List<SelectionPopupModel> d1 = await fillProdsystems();
    SelectionPopupModel? aa;
    TextEditingController? a;
    TextEditingController? b;
    TextEditingController? c;
    TextEditingController? d;

    if (edit != 0) {
      FarmerFishProductionSystem? asset = await getProdSyss(edit);
      if (asset != null) {
        data = await _assets(asset);
        if (data != null) {
          a = TextEditingController(text: data.var1);
          b = TextEditingController(text: data.var2);
          c = TextEditingController(text: data.var3);
          d = TextEditingController(text: data.var4);
          aa = d1.firstWhere(
            (model) => model.id == data!.id,
          );
        }
      }
    }
    emit(state.copyWith(
        inp1: a,
        inp2: b,
        inp3: c,
        inp4: d,
        addAquacultureFourModelObj: state.addAquacultureFourModelObj?.copyWith(
          dropdownItemList: d1,
          dropdownItemList1: await fillUOMs(),
          selectedDropDownValue: aa,
        )));
  }

  Future<FarmerFishProductionSystem?> getProdSyss(int id) async {
    FarmerFishProductionSystemDB farmerLivestockAgeGroupsDB =
        FarmerFishProductionSystemDB();
    return await farmerLivestockAgeGroupsDB.fetchById(id);
  }

  Future<CheckBoxList?> _assets(FarmerFishProductionSystem agess) async {
    CheckBoxList? agemodels;
    // agemodels?.isSelected = true;
    // agemodels?.var1 = agess.noOfActiveUnits.toString();
    // agemodels?.var2 = agess.activeArea.toString();
    // agemodels?.var3 = agess.noOfInactiveUnits.toString();
    // agemodels?.var4 = agess.inactiveArea.toString();

    // agemodels?.id = ages.productionTypeId;

    return CheckBoxList(
      id: agess.productionTypeId,
      var1: agess.noOfActiveUnits.toString(),
      var2: agess.activeArea.toString(),
      var3: agess.noOfInactiveUnits.toString(),
      var4: agess.inactiveArea.toString(),
    );
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddAquacultureFourState> emit,
  ) async {
    FarmerFishProductionSystemDB farmerFishProductionSystemDB =
        FarmerFishProductionSystemDB();
    List<FarmerFishProductionSystem>? categs = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);
    int farmerid = PrefUtils().getFarmerId();
    int farmid = PrefUtils().getFarmId();

    try {
      if (PrefUtils().getEditId() == 0) {
        await farmerFishProductionSystemDB.create(FarmerFishProductionSystem(
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
      } else {
        await farmerFishProductionSystemDB.update(FarmerFishProductionSystem(
          farmerFishprodId: PrefUtils().getEditId(),
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
      }
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
      addAquacultureFourModelObj: state.addAquacultureFourModelObj?.copyWith(
        selectedDropDownValue1:
            state.addAquacultureFourModelObj?.selectedDropDownValue1,
        selectedDropDownValue: event.value,
      ),
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddAquacultureFourState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
      addAquacultureFourModelObj: state.addAquacultureFourModelObj?.copyWith(
        selectedDropDownValue:
            state.addAquacultureFourModelObj?.selectedDropDownValue,
        selectedDropDownValue1: event.value,
      ),
    ));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<AddAquacultureFourState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue2: event.value,
      addAquacultureFourModelObj: state.addAquacultureFourModelObj?.copyWith(
        selectedDropDownValue: event.value,
      ),
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
    await fishProductionUnitOfMeasureDB.fetchAll().then((value) {
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
    await fishProductionTypeDB.fetchAll().then((value) {
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

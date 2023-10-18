import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/utils/progress_dialog_utils.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/aqua_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fishinput.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/productionlevel.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishinput.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductionlevels.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/aqua_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/fishinput.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/productionlevel.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_aquaculture_two_screen/models/add_aquaculture_two_model.dart';
part 'add_aquaculture_two_event.dart';
part 'add_aquaculture_two_state.dart';

/// A bloc that manages the state of a AddAquacultureTwo according to the event that is dispatched to it.
class AddAquacultureTwoBloc
    extends Bloc<AddAquacultureTwoEvent, AddAquacultureTwoState> {
  AddAquacultureTwoBloc(AddAquacultureTwoState initialState)
      : super(initialState) {
    on<AddAquacultureTwoInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
    on<SaveTapEvent>(_saveTap);
    on<CheckThreeEvent>(_checkfishes);
    on<ClearEvent>(_clear);
  }

  _onInitialize(
    AddAquacultureTwoInitialEvent event,
    Emitter<AddAquacultureTwoState> emit,
  ) async {
    AQProgress pfProgress = await getProgress() ??
        AQProgress(
          farmId: PrefUtils().getFarmId(),
          pageOne: 0,
          pageTwo: 0,
        );

    List<CheckBoxList>? fish = [];

    List<SelectionPopupModel>? a = fillDropdownItemList();
    List<SelectionPopupModel>? b = await fetchAProductionLevels();

    SelectionPopupModel? aa;
    SelectionPopupModel? bb;
    SelectionPopupModel? cc;
    FarmerFishProductionLevel farmerFishProductionLevel =
        await getProdlevel() ??
            FarmerFishProductionLevel(
              farmerProductionLevelId: 0,
              farmerId: 0,
              farmerFarmId: 0,
              productionLevelId: 0,
            );
    if (pfProgress.pageTwo == 1 &&
        farmerFishProductionLevel.productionLevelId != 0) {
      ProgressDialogUtils.showProgressDialog();

      List<FarmerFishInput>? fishes = await getFishes();

      fish = await fetchFish();

      fish = _inputs(fish, fishes!);

      aa = a.firstWhere(
        (model) =>
            model.id == {farmerFishProductionLevel.fertilizerInPonds! ? 1 : 0},
      );

      bb = b.firstWhere(
        (model) => model.id == farmerFishProductionLevel.productionLevelId,
      );
      cc = a.firstWhere(
        (model) => model.id == farmerFishProductionLevel.espBenefit,
      );
      ProgressDialogUtils.hideProgressDialog();
    }
    int stepper = 0;
    if (pfProgress.pageTwo == 1) {
      stepper = 2;
    } else if (pfProgress.pageOne == 1) {
      stepper = 1;
    }
    emit(state.copyWith(
        addAquacultureTwoModelObj: state.addAquacultureTwoModelObj?.copyWith(
      dropdownItemList: a,
      dropdownItemList1: await fetchAProductionLevels(),
      dropdownItemList2: a,
      stepped2: stepper,
      selectedDropDownValue: aa,
      selectedDropDownValue1: bb,
      selectedDropDownValue2: cc,
      aqProgress: pfProgress,
    )));
  }

  Future<AQProgress?> getProgress() async {
    int id = PrefUtils().getFarmId();
    AQProgressDB pfProgressDB = AQProgressDB();
    return await pfProgressDB.fetchByFarmId(id);
  }

  Future<FarmerFishProductionLevel?> getProdlevel() async {
    int id = PrefUtils().getFarmId();
    FarmerFishProductionLevelsDB farmerFishProductionLevelsDB =
        FarmerFishProductionLevelsDB();
    return await farmerFishProductionLevelsDB.fetchByFarm(id);
  }

  _checkfishes(
    CheckThreeEvent event,
    Emitter<AddAquacultureTwoState> emit,
  ) async {
    List<FarmerFishInput>? fishes = await getFishes();

    List<CheckBoxList>? feedmodels = [];
    feedmodels = await fetchFish();

    feedmodels = _inputs(feedmodels, fishes!);

    if (fishes.isNotEmpty) {
      emit(state.copyWith(inputs: feedmodels, checked: false));
    } else {
      emit(state.copyWith(checked: true));
    }
  }

  Future<List<FarmerFishInput>?> getFishes() async {
    int id = PrefUtils().getFarmId();
    FarmerFishInputDB farmerLivestockAgeGroupsDB = FarmerFishInputDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<List<CheckBoxList>> fetchFish() async {
    List<CheckBoxList> list = [];
    FishInputDB fishCategoryDB = FishInputDB();

    await fishCategoryDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].fishInput,
          id: value[i].fishInputId,
        ));
      }
    });
    return list;
  }

  List<CheckBoxList> _inputs(
      List<CheckBoxList> feedmodelss, List<FarmerFishInput> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerFishInput> feeds = feedss;
    if (feeds.isNotEmpty) {
      for (var ent in feeds) {
        int index = feedmodels.indexWhere((obj) => obj.id == ent.fishInputId);

        feedmodels[index].isSelected = true;
      }
    }
    return feedmodels;
  }

  _clear(
    ClearEvent event,
    Emitter<AddAquacultureTwoState> emit,
  ) async {
    if (state.addAquacultureTwoModelObj?.aqProgress!.pageTwo == 0) {
      int id = PrefUtils().getFarmId();
      FarmerFishInputDB farmerFishDB = FarmerFishInputDB();

      farmerFishDB.delete(id).then((value) => print("Deleted: $value"));
    }
  }

  _saveTap(
    SaveTapEvent event,
    Emitter<AddAquacultureTwoState> emit,
  ) async {
    ProgressDialogUtils.showProgressDialog();

    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);
    int farmerid = PrefUtils().getFarmerId();
    int farmid = PrefUtils().getFarmId();
    int selectedCount =
        state.inputs.where((enterprise) => enterprise.isSelected).length;

    FarmerFishProductionLevelsDB farmerFishProductionLevelsDB =
        FarmerFishProductionLevelsDB();
    try {
      AQProgressDB aqProgressDB = AQProgressDB();
      if (state.addAquacultureTwoModelObj!.aqProgress!.pageTwo == 0 &&
          selectedCount != 0) {
        int id = await farmerFishProductionLevelsDB.create(
          FarmerFishProductionLevel(
            farmerProductionLevelId: 0,
            farmerId: farmerid,
            farmerFarmId: farmid,
            productionLevelId:
                state.addAquacultureTwoModelObj!.selectedDropDownValue1!.id!,
            fertilizerInPonds:
                state.addAquacultureTwoModelObj!.selectedDropDownValue!.id! ==
                    1,
            espBenefit:
                state.addAquacultureTwoModelObj!.selectedDropDownValue2!.id!,
            createdBy: userId,
            dateCreated: DateTime.now(),
          ),
        );
        if (id > 0) {
          aqProgressDB
              .update(AQProgress(
                farmId: farmid,
                pageTwo: 1,
                pageOne: state.addAquacultureTwoModelObj!.aqProgress!.pageOne,
              ))
              .then((value) => print("Scope FI" + value.toString()));
          event.createSuccessful!.call();
        }
      } else if (selectedCount != 0) {
        int id = await farmerFishProductionLevelsDB.update(
          FarmerFishProductionLevel(
            farmerProductionLevelId: 0,
            farmerId: farmerid,
            farmerFarmId: farmid,
            productionLevelId:
                state.addAquacultureTwoModelObj!.selectedDropDownValue1!.id!,
            fertilizerInPonds:
                state.addAquacultureTwoModelObj!.selectedDropDownValue!.id! ==
                    1,
            espBenefit:
                state.addAquacultureTwoModelObj!.selectedDropDownValue2!.id!,
            createdBy: userId,
            dateCreated: DateTime.now(),
          ),
        );

        if (id > 0) {
          aqProgressDB
              .update(AQProgress(
                farmId: farmid,
                pageTwo: 1,
                pageOne: state.addAquacultureTwoModelObj!.aqProgress!.pageOne,
              ))
              .then((value) => print("Scope FI" + value.toString()));
          event.createSuccessful!.call();
        }
      } else {
        //   event.createFailed!.call();
        int selectedCount =
            state.inputs.where((enterprise) => enterprise.isSelected).length;
        emit(state.copyWith(
          checked: selectedCount == 0,
        ));
      }
      ProgressDialogUtils.hideProgressDialog();
    } catch (e) {
      event.createFailed!.call();
      ProgressDialogUtils.hideProgressDialog();
    }
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddAquacultureTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
      addAquacultureTwoModelObj: state.addAquacultureTwoModelObj?.copyWith(
        selectedDropDownValue: event.value,
        selectedDropDownValue2:
            state.addAquacultureTwoModelObj?.selectedDropDownValue2,
        selectedDropDownValue1:
            state.addAquacultureTwoModelObj?.selectedDropDownValue1,
      ),
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddAquacultureTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
      addAquacultureTwoModelObj: state.addAquacultureTwoModelObj?.copyWith(
        selectedDropDownValue1: event.value,
        selectedDropDownValue2:
            state.addAquacultureTwoModelObj?.selectedDropDownValue2,
        selectedDropDownValue:
            state.addAquacultureTwoModelObj?.selectedDropDownValue,
      ),
    ));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<AddAquacultureTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue2: event.value,
      addAquacultureTwoModelObj: state.addAquacultureTwoModelObj?.copyWith(
        selectedDropDownValue2: event.value,
        selectedDropDownValue:
            state.addAquacultureTwoModelObj?.selectedDropDownValue,
        selectedDropDownValue1:
            state.addAquacultureTwoModelObj?.selectedDropDownValue1,
      ),
    ));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Yes",
      ),
      SelectionPopupModel(
        id: 0,
        title: "No",
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
        title: "Yes",
      ),
      SelectionPopupModel(
        id: 0,
        title: "No",
      )
    ];
  }

  Future<List<SelectionPopupModel>> fetchAProductionLevels() async {
    List<SelectionPopupModel> list = [];
    FishProductionLevelDB fishProductionLevelDB = FishProductionLevelDB();

    await fishProductionLevelDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].productionLevel,
          id: value[i].productionLevelId,
        ));
      }
    });
    return list;
  }
}

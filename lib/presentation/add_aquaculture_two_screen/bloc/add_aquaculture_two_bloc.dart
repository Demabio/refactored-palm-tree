import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductionlevels.dart';
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
    on<StepDownEvent>(_onSteppedDown);
    on<OnSteppedEvent>(_onStepped);
    on<StepUpEvent>(_onSteppedUp);
  }

  _onInitialize(
    AddAquacultureTwoInitialEvent event,
    Emitter<AddAquacultureTwoState> emit,
  ) async {
    emit(state.copyWith(
        addAquacultureTwoModelObj: state.addAquacultureTwoModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
      dropdownItemList1: await fetchAProductionLevels(),
      dropdownItemList2: fillDropdownItemList2(),
    )));
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddAquacultureTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddAquacultureTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
    ));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<AddAquacultureTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue2: event.value,
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

  _onSteppedDown(
    StepDownEvent event,
    Emitter<AddAquacultureTwoState> emit,
  ) {
    emit(
      state.copyWith(
        addAquacultureTwoModelObj: state.addAquacultureTwoModelObj?.copyWith(
          stepped: --state.addAquacultureTwoModelObj?.stepped,
          page1: state.addAquacultureTwoModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.addAquacultureTwoModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.addAquacultureTwoModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.addAquacultureTwoModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onSteppedUp(
    StepUpEvent event,
    Emitter<AddAquacultureTwoState> emit,
  ) {
    emit(
      state.copyWith(
        addAquacultureTwoModelObj: state.addAquacultureTwoModelObj?.copyWith(
          stepped: ++state.addAquacultureTwoModelObj?.stepped,
          page1: state.addAquacultureTwoModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.addAquacultureTwoModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.addAquacultureTwoModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.addAquacultureTwoModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onStepped(
    OnSteppedEvent event,
    Emitter<AddAquacultureTwoState> emit,
  ) {
    emit(
      state.copyWith(
        addAquacultureTwoModelObj: state.addAquacultureTwoModelObj?.copyWith(
          stepped: event.value,
          page1: event.value! > 0 ? StepState.complete : StepState.indexed,
          page2: event.value! > 1 ? StepState.complete : StepState.indexed,
          page3: event.value! > 2 ? StepState.complete : StepState.indexed,
          page4: event.value! > 3 ? StepState.complete : StepState.indexed,
        ),
      ),
    );
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

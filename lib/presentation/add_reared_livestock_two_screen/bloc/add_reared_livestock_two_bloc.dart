import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/chipviewayrshi2_item_model.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_two_screen/models/add_reared_livestock_two_model.dart';
part 'add_reared_livestock_two_event.dart';
part 'add_reared_livestock_two_state.dart';

/// A bloc that manages the state of a AddRearedLivestockTwo according to the event that is dispatched to it.
class AddRearedLivestockTwoBloc
    extends Bloc<AddRearedLivestockTwoEvent, AddRearedLivestockTwoState> {
  AddRearedLivestockTwoBloc(AddRearedLivestockTwoState initialState)
      : super(initialState) {
    on<AddRearedLivestockTwoInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
  }

  _updateChipView(
    UpdateChipViewEvent event,
    Emitter<AddRearedLivestockTwoState> emit,
  ) {
    List<Chipviewayrshi2ItemModel> newList =
        List<Chipviewayrshi2ItemModel>.from(
            state.addRearedLivestockTwoModelObj!.chipviewayrshi2ItemList);
    newList[event.index] = newList[event.index].copyWith(
      isSelected: event.isSelected,
    );
    emit(state.copyWith(
        addRearedLivestockTwoModelObj: state.addRearedLivestockTwoModelObj
            ?.copyWith(chipviewayrshi2ItemList: newList)));
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddRearedLivestockTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddRearedLivestockTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
    ));
  }

  List<Chipviewayrshi2ItemModel> fillChipviewayrshi2ItemList() {
    return List.generate(4, (index) => Chipviewayrshi2ItemModel());
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

  _onInitialize(
    AddRearedLivestockTwoInitialEvent event,
    Emitter<AddRearedLivestockTwoState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
      selectController: TextEditingController(),
      selectoneController: TextEditingController(),
    ));
    emit(state.copyWith(
        addRearedLivestockTwoModelObj:
            state.addRearedLivestockTwoModelObj?.copyWith(
      chipviewayrshi2ItemList: fillChipviewayrshi2ItemList(),
      dropdownItemList: fillDropdownItemList(),
      dropdownItemList1: fillDropdownItemList1(),
    )));
  }
}

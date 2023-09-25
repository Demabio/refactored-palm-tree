import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/chipviewayrshi_item_model.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_one_screen/models/add_reared_livestock_one_model.dart';
part 'add_reared_livestock_one_event.dart';
part 'add_reared_livestock_one_state.dart';

/// A bloc that manages the state of a AddRearedLivestockOne according to the event that is dispatched to it.
class AddRearedLivestockOneBloc
    extends Bloc<AddRearedLivestockOneEvent, AddRearedLivestockOneState> {
  AddRearedLivestockOneBloc(AddRearedLivestockOneState initialState)
      : super(initialState) {
    on<AddRearedLivestockOneInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
  }

  _updateChipView(
    UpdateChipViewEvent event,
    Emitter<AddRearedLivestockOneState> emit,
  ) {
    List<ChipviewayrshiItemModel> newList = List<ChipviewayrshiItemModel>.from(
        state.addRearedLivestockOneModelObj!.chipviewayrshiItemList);
    newList[event.index] = newList[event.index].copyWith(
      isSelected: event.isSelected,
    );
    emit(state.copyWith(
        addRearedLivestockOneModelObj: state.addRearedLivestockOneModelObj
            ?.copyWith(chipviewayrshiItemList: newList)));
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddRearedLivestockOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddRearedLivestockOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
    ));
  }

  List<ChipviewayrshiItemModel> fillChipviewayrshiItemList() {
    return List.generate(4, (index) => ChipviewayrshiItemModel());
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
    AddRearedLivestockOneInitialEvent event,
    Emitter<AddRearedLivestockOneState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
      categoryvalueController: TextEditingController(),
      subcategoryvaluController: TextEditingController(),
    ));
    emit(state.copyWith(
        addRearedLivestockOneModelObj:
            state.addRearedLivestockOneModelObj?.copyWith(
      chipviewayrshiItemList: fillChipviewayrshiItemList(),
      dropdownItemList: fillDropdownItemList(),
      dropdownItemList1: fillDropdownItemList1(),
    )));
  }
}

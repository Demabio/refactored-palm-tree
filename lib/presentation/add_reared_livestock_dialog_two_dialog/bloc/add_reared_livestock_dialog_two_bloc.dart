import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/models/agegroupmodel.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/models/add_reared_livestock_dialog_two_model.dart';
part 'add_reared_livestock_dialog_two_event.dart';
part 'add_reared_livestock_dialog_two_state.dart';

/// A bloc that manages the state of a AddRearedLivestockDialogTwo according to the event that is dispatched to it.
class AddRearedLivestockDialogTwoBloc extends Bloc<
    AddRearedLivestockDialogTwoEvent, AddRearedLivestockDialogTwoState> {
  AddRearedLivestockDialogTwoBloc(AddRearedLivestockDialogTwoState initialState)
      : super(initialState) {
    on<AddRearedLivestockDialogTwoInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddRearedLivestockDialogTwoState> emit,
  ) {
    emit(state.copyWith(
      lessThanThreeWe: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddRearedLivestockDialogTwoState> emit,
  ) {
    emit(state.copyWith(
      threeToEightWee: event.value,
    ));
  }

  // Future<List<AgeGroupmModel>> fillCommonLivestock() async {
  //   List<AgeGroupmModel> list = [];
  //   state.livestockDB = LivestockDB();
  //   await state.livestockDB?.fetchAllCommon().then((value) {
  //     for (int i = 0; i < value.length; i++) {
  //       list.add(ChipviewayrshiItemModel(
  //         livestockid: value[i].livestockId,
  //         subcategoryid: value[i].livestockSubCatId,
  //         categoryid: value[i].livestockCatId,
  //         ayrshi: value[i].livestock,
  //         livestockCat: value[i].livestockCat,
  //         livestockSubCat: value[i].livestockSubCat,
  //       ));
  //     }
  //   });
  //   return list;
  // }

  _onInitialize(
    AddRearedLivestockDialogTwoInitialEvent event,
    Emitter<AddRearedLivestockDialogTwoState> emit,
  ) async {
    emit(state.copyWith(
      lessThanThreeWe: false,
      threeToEightWee: false,
      lessThanTwoMont: false,
      twoToSixMonths: false,
      sixToTwelveMont: false,
      oneToTwoYears: false,
      twoToFourYears: false,
      fourYearsOrOlde: false,
    ));
  }
}

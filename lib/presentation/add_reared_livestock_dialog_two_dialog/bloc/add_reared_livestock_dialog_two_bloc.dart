import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/agegroup.dart';
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
    on<ChangeAgeGroupCheckbox>(_changeAgeGroupCB);
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

  Future<List<AgeGroupmModel>> fetchAgeGroups() async {
    List<AgeGroupmModel> list = [];
    LivestockAgeGroupDB livestockAgeGroupDB = LivestockAgeGroupDB();
    TextEditingController stored = TextEditingController();
    stored.value = TextEditingValue(text: "999");
    await livestockAgeGroupDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(AgeGroupmModel(
          title: value[i].ageGroup,
          ageGroupId: value[i].ageGroupId,
          female: TextEditingController(),
          male: TextEditingController(),
          focusNode: FocusNode(),
          femalefocusNode: FocusNode(),
        ));
      }
    });
    return list;
  }

  _changeAgeGroupCB(
    ChangeAgeGroupCheckbox event,
    Emitter<AddRearedLivestockDialogTwoState> emit,
  ) {
    List<AgeGroupmModel> newModels =
        state.addRearedLivestockDialogTwoModelObj!.ageGroupmModels;

    newModels[event.value].isSelected = true;

    emit(state.copyWith(
        addRearedLivestockDialogTwoModelObj:
            state.addRearedLivestockDialogTwoModelObj?.copyWith(
      ageGroupmModels: newModels,
      count: state.addRearedLivestockDialogTwoModelObj!.count + 1,
    )));
  }

  _onInitialize(
    AddRearedLivestockDialogTwoInitialEvent event,
    Emitter<AddRearedLivestockDialogTwoState> emit,
  ) async {
    emit(
      state.copyWith(
        lessThanThreeWe: false,
        threeToEightWee: false,
        addRearedLivestockDialogTwoModelObj:
            state.addRearedLivestockDialogTwoModelObj?.copyWith(
          ageGroupmModels: await fetchAgeGroups(),
        ),
      ),
    );
  }
}

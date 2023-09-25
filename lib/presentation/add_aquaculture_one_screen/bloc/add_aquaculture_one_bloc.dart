import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_aquaculture_one_screen/models/add_aquaculture_one_model.dart';
part 'add_aquaculture_one_event.dart';
part 'add_aquaculture_one_state.dart';

/// A bloc that manages the state of a AddAquacultureOne according to the event that is dispatched to it.
class AddAquacultureOneBloc
    extends Bloc<AddAquacultureOneEvent, AddAquacultureOneState> {
  AddAquacultureOneBloc(AddAquacultureOneState initialState)
      : super(initialState) {
    on<AddAquacultureOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AddAquacultureOneInitialEvent event,
    Emitter<AddAquacultureOneState> emit,
  ) async {}
}

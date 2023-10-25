import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/repository/repository.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farm.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import 'package:kiamis_app/presentation/post_dialog/models/post_modal_model.dart';
import '/core/app_export.dart';
part 'post_modal_event.dart';
part 'post_modal_state.dart';

/// A bloc that manages the state of a DraftEntriesDeleteEntryModal according to the event that is dispatched to it.
class PostModalBloc extends Bloc<PostModalEvent, PostModalState> {
  PostModalBloc(PostModalState initialState) : super(initialState) {
    on<PostModalInitialEvent>(_onInitialize);
    on<PostEvent>(_post);
  }
  final _repository = Repository();

  _post(
    PostEvent event,
    Emitter<PostModalState> emit,
  ) async {
    await _repository.postPost().then((value) async {
      if (value.statusCode == 200) {
        FarmerDB farmerDB = FarmerDB();
        FarmerFarmDB farmfarmerDB = FarmerFarmDB();

        int posted = await farmerDB.updateToPosted();
        int farms = await farmfarmerDB.updateToPosted();

        print("$posted,$farms");
        event.createSuccessful!.call();
      } else {
        event.createFailed!.call();
      }
    }).onError((error, stackTrace) {
      event.createFailed!.call();
      //implement error call
    });
  }

  _onInitialize(
    PostModalInitialEvent event,
    Emitter<PostModalState> emit,
  ) async {}
}

// ignore_for_file: must_be_immutable

part of 'save_draft_modal_bloc.dart';

/// Represents the state of SaveDraftModal in the application.
class SaveDraftModalState extends Equatable {
  SaveDraftModalState({this.saveDraftModalModelObj});

  SaveDraftModalModel? saveDraftModalModelObj;

  @override
  List<Object?> get props => [
        saveDraftModalModelObj,
      ];
  SaveDraftModalState copyWith({SaveDraftModalModel? saveDraftModalModelObj}) {
    return SaveDraftModalState(
      saveDraftModalModelObj:
          saveDraftModalModelObj ?? this.saveDraftModalModelObj,
    );
  }
}

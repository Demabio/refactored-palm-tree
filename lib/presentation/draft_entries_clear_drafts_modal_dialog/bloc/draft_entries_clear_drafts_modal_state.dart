// ignore_for_file: must_be_immutable

part of 'draft_entries_clear_drafts_modal_bloc.dart';

/// Represents the state of DraftEntriesClearDraftsModal in the application.
class DraftEntriesClearDraftsModalState extends Equatable {
  DraftEntriesClearDraftsModalState(
      {this.draftEntriesClearDraftsModalModelObj});

  DraftEntriesClearDraftsModalModel? draftEntriesClearDraftsModalModelObj;

  @override
  List<Object?> get props => [
        draftEntriesClearDraftsModalModelObj,
      ];
  DraftEntriesClearDraftsModalState copyWith(
      {DraftEntriesClearDraftsModalModel?
          draftEntriesClearDraftsModalModelObj}) {
    return DraftEntriesClearDraftsModalState(
      draftEntriesClearDraftsModalModelObj:
          draftEntriesClearDraftsModalModelObj ??
              this.draftEntriesClearDraftsModalModelObj,
    );
  }
}

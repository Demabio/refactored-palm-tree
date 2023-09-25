// ignore_for_file: must_be_immutable

part of 'draft_entries_delete_entry_modal_bloc.dart';

/// Represents the state of DraftEntriesDeleteEntryModal in the application.
class DraftEntriesDeleteEntryModalState extends Equatable {
  DraftEntriesDeleteEntryModalState(
      {this.draftEntriesDeleteEntryModalModelObj});

  DraftEntriesDeleteEntryModalModel? draftEntriesDeleteEntryModalModelObj;

  @override
  List<Object?> get props => [
        draftEntriesDeleteEntryModalModelObj,
      ];
  DraftEntriesDeleteEntryModalState copyWith(
      {DraftEntriesDeleteEntryModalModel?
          draftEntriesDeleteEntryModalModelObj}) {
    return DraftEntriesDeleteEntryModalState(
      draftEntriesDeleteEntryModalModelObj:
          draftEntriesDeleteEntryModalModelObj ??
              this.draftEntriesDeleteEntryModalModelObj,
    );
  }
}

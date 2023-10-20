// ignore_for_file: must_be_immutable

part of 'post_modal_bloc.dart';

/// Represents the state of DraftEntriesDeleteEntryModal in the application.
class PostModalState extends Equatable {
  PostModalState({this.draftEntriesDeleteEntryModalModelObj});

  PostModalModel? draftEntriesDeleteEntryModalModelObj;

  @override
  List<Object?> get props => [
        draftEntriesDeleteEntryModalModelObj,
      ];
  PostModalState copyWith(
      {PostModalModel? draftEntriesDeleteEntryModalModelObj}) {
    return PostModalState(
      draftEntriesDeleteEntryModalModelObj:
          draftEntriesDeleteEntryModalModelObj ??
              this.draftEntriesDeleteEntryModalModelObj,
    );
  }
}

// ignore_for_file: must_be_immutable

part of 'draft_entries_bloc.dart';

/// Represents the state of DraftEntries in the application.
class DraftEntriesState extends Equatable {
  DraftEntriesState({this.draftEntriesModelObj});

  DraftEntriesModel? draftEntriesModelObj;

  @override
  List<Object?> get props => [
        draftEntriesModelObj,
      ];
  DraftEntriesState copyWith({DraftEntriesModel? draftEntriesModelObj}) {
    return DraftEntriesState(
      draftEntriesModelObj: draftEntriesModelObj ?? this.draftEntriesModelObj,
    );
  }
}

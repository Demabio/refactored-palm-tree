// ignore_for_file: must_be_immutable

part of 'draft_entries_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///DraftEntries widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class DraftEntriesEvent extends Equatable {}

/// Event that is dispatched when the DraftEntries widget is first created.
class DraftEntriesInitialEvent extends DraftEntriesEvent {
  @override
  List<Object?> get props => [];
}

class AddEditEvent extends DraftEntriesEvent {
  AddEditEvent({
    this.createFailed,
    this.createSuccessful,
    this.value,
    this.crop,
  });

  int? value;
  int? crop;
  Function? createSuccessful;

  Function? createFailed;
  @override
  List<Object?> get props => [
        value,
        createFailed,
        createSuccessful,
        crop,
      ];
}

class DeleteEvent extends DraftEntriesEvent {
  DeleteEvent({
    this.createFailed,
    this.createSuccessful,
    this.value,
    this.crop,
  });

  int? value;
  int? crop;
  Function? createSuccessful;

  Function? createFailed;
  @override
  List<Object?> get props => [
        value,
        createFailed,
        createSuccessful,
        crop,
      ];
}

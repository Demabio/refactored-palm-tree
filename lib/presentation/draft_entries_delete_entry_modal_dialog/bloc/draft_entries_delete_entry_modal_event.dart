// ignore_for_file: must_be_immutable

part of 'draft_entries_delete_entry_modal_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///DraftEntriesDeleteEntryModal widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class DraftEntriesDeleteEntryModalEvent extends Equatable {}

/// Event that is dispatched when the DraftEntriesDeleteEntryModal widget is first created.
class DraftEntriesDeleteEntryModalInitialEvent
    extends DraftEntriesDeleteEntryModalEvent {
  @override
  List<Object?> get props => [];
}

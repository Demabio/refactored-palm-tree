// ignore_for_file: must_be_immutable

part of 'draft_entries_clear_drafts_modal_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///DraftEntriesClearDraftsModal widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class DraftEntriesClearDraftsModalEvent extends Equatable {}

/// Event that is dispatched when the DraftEntriesClearDraftsModal widget is first created.
class DraftEntriesClearDraftsModalInitialEvent
    extends DraftEntriesClearDraftsModalEvent {
  @override
  List<Object?> get props => [];
}

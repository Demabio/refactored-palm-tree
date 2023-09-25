// ignore_for_file: must_be_immutable

part of 'save_draft_modal_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SaveDraftModal widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SaveDraftModalEvent extends Equatable {}

/// Event that is dispatched when the SaveDraftModal widget is first created.
class SaveDraftModalInitialEvent extends SaveDraftModalEvent {
  @override
  List<Object?> get props => [];
}

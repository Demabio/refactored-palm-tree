// ignore_for_file: must_be_immutable

part of 'post_modal_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///DraftEntriesDeleteEntryModal widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class PostModalEvent extends Equatable {}

/// Event that is dispatched when the DraftEntriesDeleteEntryModal widget is first created.
class PostModalInitialEvent extends PostModalEvent {
  @override
  List<Object?> get props => [];
}

class PostEvent extends PostModalEvent {
  PostEvent({
    this.createFailed,
    this.createSuccessful,
    this.value,
    this.crop,
    this.nofarmers,
  });

  int? value;
  int? crop;
  Function? createSuccessful;
  Function? nofarmers;

  Function? createFailed;
  @override
  List<Object?> get props => [
        value,
        createFailed,
        createSuccessful,
        crop,
        nofarmers,
      ];
}

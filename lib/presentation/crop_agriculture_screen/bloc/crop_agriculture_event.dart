// ignore_for_file: must_be_immutable

part of 'crop_agriculture_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///CropAgriculture widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class CropAgricultureEvent extends Equatable {}

/// Event that is dispatched when the CropAgriculture widget is first created.
class CropAgricultureInitialEvent extends CropAgricultureEvent {
  @override
  List<Object?> get props => [];
}
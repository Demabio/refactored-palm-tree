// ignore_for_file: must_be_immutable

part of 'financialandservices_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Financialandservices widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class FinancialandservicesEvent extends Equatable {}

/// Event that is dispatched when the Financialandservices widget is first created.
class FinancialandservicesInitialEvent extends FinancialandservicesEvent {
  @override
  List<Object?> get props => [];
}

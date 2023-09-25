// ignore_for_file: must_be_immutable

part of 'livestock_one_tab_container_bloc.dart';

/// Represents the state of LivestockOneTabContainer in the application.
class LivestockOneTabContainerState extends Equatable {
  LivestockOneTabContainerState({this.livestockOneTabContainerModelObj});

  LivestockOneTabContainerModel? livestockOneTabContainerModelObj;

  @override
  List<Object?> get props => [
        livestockOneTabContainerModelObj,
      ];
  LivestockOneTabContainerState copyWith(
      {LivestockOneTabContainerModel? livestockOneTabContainerModelObj}) {
    return LivestockOneTabContainerState(
      livestockOneTabContainerModelObj: livestockOneTabContainerModelObj ??
          this.livestockOneTabContainerModelObj,
    );
  }
}

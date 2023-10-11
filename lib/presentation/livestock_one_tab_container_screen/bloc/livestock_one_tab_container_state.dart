// ignore_for_file: must_be_immutable

part of 'livestock_one_tab_container_bloc.dart';

/// Represents the state of LivestockOneTabContainer in the application.
class LivestockOneTabContainerState extends Equatable {
  LivestockOneTabContainerState({
    this.livestockOneTabContainerModelObj,
    this.liveorins = false,
  });

  LivestockOneTabContainerModel? livestockOneTabContainerModelObj;
  bool liveorins;
  @override
  List<Object?> get props => [
        livestockOneTabContainerModelObj,
        liveorins,
      ];
  LivestockOneTabContainerState copyWith({
    LivestockOneTabContainerModel? livestockOneTabContainerModelObj,
    bool? liveorins,
  }) {
    return LivestockOneTabContainerState(
      livestockOneTabContainerModelObj: livestockOneTabContainerModelObj ??
          this.livestockOneTabContainerModelObj,
      liveorins: liveorins ?? this.liveorins,
    );
  }
}

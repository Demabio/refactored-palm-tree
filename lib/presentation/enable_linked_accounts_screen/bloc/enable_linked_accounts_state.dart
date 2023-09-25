// ignore_for_file: must_be_immutable

part of 'enable_linked_accounts_bloc.dart';

/// Represents the state of EnableLinkedAccounts in the application.
class EnableLinkedAccountsState extends Equatable {
  EnableLinkedAccountsState({
    this.isSelectedSwitch = false,
    this.isSelectedSwitch1 = false,
    this.isSelectedSwitch2 = false,
    this.isSelectedSwitch3 = false,
    this.isSelectedSwitch4 = false,
    this.enableLinkedAccountsModelObj,
  });

  EnableLinkedAccountsModel? enableLinkedAccountsModelObj;

  bool isSelectedSwitch;

  bool isSelectedSwitch1;

  bool isSelectedSwitch2;

  bool isSelectedSwitch3;

  bool isSelectedSwitch4;

  @override
  List<Object?> get props => [
        isSelectedSwitch,
        isSelectedSwitch1,
        isSelectedSwitch2,
        isSelectedSwitch3,
        isSelectedSwitch4,
        enableLinkedAccountsModelObj,
      ];
  EnableLinkedAccountsState copyWith({
    bool? isSelectedSwitch,
    bool? isSelectedSwitch1,
    bool? isSelectedSwitch2,
    bool? isSelectedSwitch3,
    bool? isSelectedSwitch4,
    EnableLinkedAccountsModel? enableLinkedAccountsModelObj,
  }) {
    return EnableLinkedAccountsState(
      isSelectedSwitch: isSelectedSwitch ?? this.isSelectedSwitch,
      isSelectedSwitch1: isSelectedSwitch1 ?? this.isSelectedSwitch1,
      isSelectedSwitch2: isSelectedSwitch2 ?? this.isSelectedSwitch2,
      isSelectedSwitch3: isSelectedSwitch3 ?? this.isSelectedSwitch3,
      isSelectedSwitch4: isSelectedSwitch4 ?? this.isSelectedSwitch4,
      enableLinkedAccountsModelObj:
          enableLinkedAccountsModelObj ?? this.enableLinkedAccountsModelObj,
    );
  }
}

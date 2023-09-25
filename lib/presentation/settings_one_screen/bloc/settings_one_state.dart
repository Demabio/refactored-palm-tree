// ignore_for_file: must_be_immutable

part of 'settings_one_bloc.dart';

/// Represents the state of SettingsOne in the application.
class SettingsOneState extends Equatable {
  SettingsOneState({this.settingsOneModelObj});

  SettingsOneModel? settingsOneModelObj;

  @override
  List<Object?> get props => [
        settingsOneModelObj,
      ];
  SettingsOneState copyWith({SettingsOneModel? settingsOneModelObj}) {
    return SettingsOneState(
      settingsOneModelObj: settingsOneModelObj ?? this.settingsOneModelObj,
    );
  }
}

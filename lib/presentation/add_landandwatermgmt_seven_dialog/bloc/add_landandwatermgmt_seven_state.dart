// ignore_for_file: must_be_immutable

part of 'add_landandwatermgmt_seven_bloc.dart';

/// Represents the state of AddLandandwatermgmtSeven in the application.
class AddLandandwatermgmtSevenState extends Equatable {
  AddLandandwatermgmtSevenState({
    this.countyGovernmen = false,
    this.trash = false,
    this.implementingAge = false,
    this.othervalue = false,
    this.selfPrivate = false,
    this.trashone = false,
    this.addLandandwatermgmtSevenModelObj,
  });

  AddLandandwatermgmtSevenModel? addLandandwatermgmtSevenModelObj;

  bool countyGovernmen;

  bool trash;

  bool implementingAge;

  bool othervalue;

  bool selfPrivate;

  bool trashone;

  @override
  List<Object?> get props => [
        countyGovernmen,
        trash,
        implementingAge,
        othervalue,
        selfPrivate,
        trashone,
        addLandandwatermgmtSevenModelObj,
      ];
  AddLandandwatermgmtSevenState copyWith({
    bool? countyGovernmen,
    bool? trash,
    bool? implementingAge,
    bool? othervalue,
    bool? selfPrivate,
    bool? trashone,
    AddLandandwatermgmtSevenModel? addLandandwatermgmtSevenModelObj,
  }) {
    return AddLandandwatermgmtSevenState(
      countyGovernmen: countyGovernmen ?? this.countyGovernmen,
      trash: trash ?? this.trash,
      implementingAge: implementingAge ?? this.implementingAge,
      othervalue: othervalue ?? this.othervalue,
      selfPrivate: selfPrivate ?? this.selfPrivate,
      trashone: trashone ?? this.trashone,
      addLandandwatermgmtSevenModelObj: addLandandwatermgmtSevenModelObj ??
          this.addLandandwatermgmtSevenModelObj,
    );
  }
}

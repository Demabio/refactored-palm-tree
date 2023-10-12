// ignore_for_file: must_be_immutable

part of 'add_aquaculture_one_bloc.dart';

/// Represents the state of AddAquacultureOne in the application.
class AddAquacultureOneState extends Equatable {
  AddAquacultureOneState({
    this.addAquacultureOneModelObj,
    this.aquatypes = const [],
    this.prodsyss = const [],
    this.fish = const [],
    this.checkedA = false,
    this.checkedP = false,
    this.checkedF = false,
  });

  AddAquacultureOneModel? addAquacultureOneModelObj;
  List<CheckBoxList> aquatypes;
  List<CheckBoxList> prodsyss;
  List<CheckBoxList> fish;
  bool checkedA;
  bool checkedP;
  bool checkedF;

  @override
  List<Object?> get props => [
        addAquacultureOneModelObj,
        aquatypes,
        prodsyss,
        fish,
        checkedA,
        checkedP,
        checkedF,
      ];
  AddAquacultureOneState copyWith({
    AddAquacultureOneModel? addAquacultureOneModelObj,
    List<CheckBoxList>? aquatypes,
    List<CheckBoxList>? prodsyss,
    List<CheckBoxList>? fish,
    bool? checkedA,
    bool? checkedP,
    bool? checkedF,
  }) {
    return AddAquacultureOneState(
      addAquacultureOneModelObj:
          addAquacultureOneModelObj ?? this.addAquacultureOneModelObj,
      aquatypes: aquatypes ?? this.aquatypes,
      prodsyss: prodsyss ?? this.prodsyss,
      fish: fish ?? this.fish,
      checkedA: checkedA ?? this.checkedA,
      checkedF: checkedF ?? this.checkedF,
      checkedP: checkedP ?? this.checkedP,
    );
  }
}

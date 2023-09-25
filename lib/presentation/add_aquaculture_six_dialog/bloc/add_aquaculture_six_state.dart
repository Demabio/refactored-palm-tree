// ignore_for_file: must_be_immutable

part of 'add_aquaculture_six_bloc.dart';

/// Represents the state of AddAquacultureSix in the application.
class AddAquacultureSixState extends Equatable {
  AddAquacultureSixState({
    this.brackishvalue = false,
    this.chickMarsh = false,
    this.homeMadeFeedMix = false,
    this.addAquacultureSixModelObj,
  });

  AddAquacultureSixModel? addAquacultureSixModelObj;

  bool brackishvalue;

  bool chickMarsh;

  bool homeMadeFeedMix;

  @override
  List<Object?> get props => [
        brackishvalue,
        chickMarsh,
        homeMadeFeedMix,
        addAquacultureSixModelObj,
      ];
  AddAquacultureSixState copyWith({
    bool? brackishvalue,
    bool? chickMarsh,
    bool? homeMadeFeedMix,
    AddAquacultureSixModel? addAquacultureSixModelObj,
  }) {
    return AddAquacultureSixState(
      brackishvalue: brackishvalue ?? this.brackishvalue,
      chickMarsh: chickMarsh ?? this.chickMarsh,
      homeMadeFeedMix: homeMadeFeedMix ?? this.homeMadeFeedMix,
      addAquacultureSixModelObj:
          addAquacultureSixModelObj ?? this.addAquacultureSixModelObj,
    );
  }
}

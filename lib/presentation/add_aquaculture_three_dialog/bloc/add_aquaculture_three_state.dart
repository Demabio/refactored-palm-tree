// ignore_for_file: must_be_immutable

part of 'add_aquaculture_three_bloc.dart';

/// Represents the state of AddAquacultureThree in the application.
class AddAquacultureThreeState extends Equatable {
  AddAquacultureThreeState({
    this.brackishvalue = false,
    this.chickMarsh = false,
    this.homeMadeFeedMix = false,
    this.addAquacultureThreeModelObj,
  });

  AddAquacultureThreeModel? addAquacultureThreeModelObj;

  bool brackishvalue;

  bool chickMarsh;

  bool homeMadeFeedMix;

  @override
  List<Object?> get props => [
        brackishvalue,
        chickMarsh,
        homeMadeFeedMix,
        addAquacultureThreeModelObj,
      ];
  AddAquacultureThreeState copyWith({
    bool? brackishvalue,
    bool? chickMarsh,
    bool? homeMadeFeedMix,
    AddAquacultureThreeModel? addAquacultureThreeModelObj,
  }) {
    return AddAquacultureThreeState(
      brackishvalue: brackishvalue ?? this.brackishvalue,
      chickMarsh: chickMarsh ?? this.chickMarsh,
      homeMadeFeedMix: homeMadeFeedMix ?? this.homeMadeFeedMix,
      addAquacultureThreeModelObj:
          addAquacultureThreeModelObj ?? this.addAquacultureThreeModelObj,
    );
  }
}

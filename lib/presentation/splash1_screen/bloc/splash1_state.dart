// ignore_for_file: must_be_immutable

part of 'splash1_bloc.dart';

/// Represents the state of Splash1 in the application.
class Splash1State extends Equatable {
  Splash1State({this.splash1ModelObj});

  Splash1Model? splash1ModelObj;

  @override
  List<Object?> get props => [
        splash1ModelObj,
      ];
  Splash1State copyWith({Splash1Model? splash1ModelObj}) {
    return Splash1State(
      splash1ModelObj: splash1ModelObj ?? this.splash1ModelObj,
    );
  }
}

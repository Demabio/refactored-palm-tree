import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/splash_screen/models/splash_model.dart';
part 'splash_event.dart';
part 'splash_state.dart';

/// A bloc that manages the state of a Splash according to the event that is dispatched to it.
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(SplashState initialState) : super(initialState) {
    on<SplashInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SplashInitialEvent event,
    Emitter<SplashState> emit,
  ) async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      String storedTomorrowTime = PrefUtils()
          .getTomorrow(); // Assuming you have a method to retrieve the stored time

// Parse the stored string back to DateTime
      DateTime storedTomorrowDateTime =
          DateFormat('yyyy-MM-dd HH:mm:ss').parse(storedTomorrowTime);

// Get the current date and time
      DateTime now = DateTime.now();

// Check if the current time is past the stored tomorrow time
      if (now.isAfter(storedTomorrowDateTime)) {
        NavigatorService.popAndPushNamed(
          AppRoutes.loginScreen,
        );
      } else {
        NavigatorService.popAndPushNamed(
          AppRoutes.homeScreen,
        );
      }
    });
  }
}

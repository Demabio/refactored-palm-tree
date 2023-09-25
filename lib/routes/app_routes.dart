import 'package:flutter/material.dart';
import 'package:kiamis_app/presentation/splash_screen/splash_screen.dart';
import 'package:kiamis_app/presentation/login_screen/login_screen.dart';
import 'package:kiamis_app/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:kiamis_app/presentation/new_password_screen/new_password_screen.dart';
import 'package:kiamis_app/presentation/otp_one_screen/otp_one_screen.dart';
import 'package:kiamis_app/presentation/recover_account_screen/recover_account_screen.dart';
import 'package:kiamis_app/presentation/home_screen/home_screen.dart';
import 'package:kiamis_app/presentation/otp_screen/otp_screen.dart';
import 'package:kiamis_app/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String newPasswordScreen = '/new_password_screen';

  static const String otpOneScreen = '/otp_one_screen';

  static const String recoverAccountScreen = '/recover_account_screen';

  static const String homeScreen = '/home_screen';

  static const String otpScreen = '/otp_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        loginScreen: LoginScreen.builder,
        forgotPasswordScreen: ForgotPasswordScreen.builder,
        newPasswordScreen: NewPasswordScreen.builder,
        otpOneScreen: OtpOneScreen.builder,
        recoverAccountScreen: RecoverAccountScreen.builder,
        homeScreen: HomeScreen.builder,
        otpScreen: OtpScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}

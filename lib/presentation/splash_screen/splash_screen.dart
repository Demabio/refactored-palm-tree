import 'bloc/splash_bloc.dart';
import 'models/splash_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashBloc>(
        create: (context) =>
            SplashBloc(SplashState(splashModelObj: SplashModel()))
              ..add(SplashInitialEvent()),
        child: SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 82.h),
                  child: Padding(
                      padding: EdgeInsets.only(right: 14.h, bottom: 5.v),
                      child: Row(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgImage2,
                            height: 70.adaptSize,
                            width: 70.adaptSize),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 2.h, top: 10.v, bottom: 11.v),
                            child: Text("lbl_kiamis".tr,
                                style: theme.textTheme.headlineLarge))
                      ])))));
    });
  }
}

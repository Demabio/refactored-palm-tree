import 'bloc/splash_bloc.dart';
import 'models/splash_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

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
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: DeviceExt(10).h),
                child: Device.orientation == Orientation.portrait
                    ? Padding(
                        padding: Device.screenType == ScreenType.mobile
                            ? EdgeInsets.only(left: 20.w)
                            : EdgeInsets.only(left: 30.w),
                        child: Row(children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgImage2,
                              height: DeviceExt(8.4).h,
                              width: DeviceExt(8.4).h),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: DeviceExt(0.2).h,
                                  top: 2.4.w,
                                  bottom: 2.7.w),
                              child: Text("lbl_kiamis".tr,
                                  style: theme.textTheme.headlineLarge
                                      ?.copyWith(fontSize: DeviceExt(4).h)))
                        ]))
                    : Padding(
                        padding: Device.screenType == ScreenType.mobile
                            ? EdgeInsets.only(left: DeviceExt(35).w)
                            : EdgeInsets.only(left: DeviceExt(35).w),
                        child: Row(
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgImage2,
                                height: DeviceExt(8.4).w,
                                width: DeviceExt(8.4).w),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: DeviceExt(0.2).w,
                                  top: DeviceExt(2.4).h,
                                  bottom: DeviceExt(2.7).h),
                              child: Text(
                                "lbl_kiamis".tr,
                                style: theme.textTheme.headlineLarge
                                    ?.copyWith(fontSize: 4.w),
                              ),
                            )
                          ],
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}

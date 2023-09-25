import 'bloc/splash1_bloc.dart';
import 'models/splash1_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

class Splash1Screen extends StatelessWidget {
  const Splash1Screen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<Splash1Bloc>(
      create: (context) => Splash1Bloc(Splash1State(
        splash1ModelObj: Splash1Model(),
      ))
        ..add(Splash1InitialEvent()),
      child: Splash1Screen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<Splash1Bloc, Splash1State>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
              width: mediaQueryData.size.width,
              height: mediaQueryData.size.height,
              decoration: BoxDecoration(
                color: appTheme.whiteA700,
                image: DecorationImage(
                  image: AssetImage(
                    ImageConstant.imgGroup566,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: SizedBox(
                width: 390.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 261.v),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 79.h,
                            right: 79.h,
                            bottom: 409.v,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "lbl_shopsie".tr,
                                style: theme.textTheme.displayLarge,
                              ),
                              SizedBox(height: 24.v),
                              Text(
                                "msg_the_best_way_to".tr,
                                style: CustomTextStyles.bodyMediumGray6000114_1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

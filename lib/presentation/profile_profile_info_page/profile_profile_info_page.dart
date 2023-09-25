import 'bloc/profile_profile_info_bloc.dart';
import 'models/profile_profile_info_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class ProfileProfileInfoPage extends StatefulWidget {
  const ProfileProfileInfoPage({Key? key})
      : super(
          key: key,
        );

  @override
  ProfileProfileInfoPageState createState() => ProfileProfileInfoPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileProfileInfoBloc>(
      create: (context) => ProfileProfileInfoBloc(ProfileProfileInfoState(
        profileProfileInfoModelObj: ProfileProfileInfoModel(),
      ))
        ..add(ProfileProfileInfoInitialEvent()),
      child: ProfileProfileInfoPage(),
    );
  }
}

class ProfileProfileInfoPageState extends State<ProfileProfileInfoPage>
    with AutomaticKeepAliveClientMixin<ProfileProfileInfoPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<ProfileProfileInfoBloc, ProfileProfileInfoState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: mediaQueryData.size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.h,
                        top: 36.v,
                        right: 16.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_first_name".tr,
                            style: CustomTextStyles.bodyMediumGray90002_1,
                          ),
                          SizedBox(height: 15.v),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                              vertical: 15.v,
                            ),
                            decoration: AppDecoration.fillGray5004.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder6,
                            ),
                            child: Text(
                              "lbl_archie".tr,
                              style: CustomTextStyles.bodyMediumGray90002,
                            ),
                          ),
                          SizedBox(height: 24.v),
                          Text(
                            "lbl_last_name".tr,
                            style: CustomTextStyles.bodyMediumGray90002_1,
                          ),
                          SizedBox(height: 15.v),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                              vertical: 14.v,
                            ),
                            decoration: AppDecoration.fillGray5004.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder6,
                            ),
                            child: Text(
                              "lbl_copeland".tr,
                              style: CustomTextStyles.bodyMediumGray90002,
                            ),
                          ),
                          SizedBox(height: 24.v),
                          Text(
                            "lbl_email_address".tr,
                            style: CustomTextStyles.bodyMediumGray90002_1,
                          ),
                          SizedBox(height: 15.v),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                              vertical: 14.v,
                            ),
                            decoration: AppDecoration.fillGray5004.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder6,
                            ),
                            child: Text(
                              "msg_archiecopeland_gmail_com".tr,
                              style: CustomTextStyles.bodyMediumGray90002,
                            ),
                          ),
                          SizedBox(height: 31.v),
                          CustomElevatedButton(
                            height: 48.v,
                            text: "lbl_save_edits".tr,
                            buttonStyle: CustomButtonStyles.fillIndigoA,
                            buttonTextStyle:
                                CustomTextStyles.bodyMediumWhiteA700,
                          ),
                        ],
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

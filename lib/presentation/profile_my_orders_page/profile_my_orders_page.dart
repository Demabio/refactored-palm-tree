import '../profile_my_orders_page/widgets/profile_my_item_widget.dart';
import 'bloc/profile_my_orders_bloc.dart';
import 'models/profile_my_item_model.dart';
import 'models/profile_my_orders_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ProfileMyOrdersPage extends StatefulWidget {
  const ProfileMyOrdersPage({Key? key})
      : super(
          key: key,
        );

  @override
  ProfileMyOrdersPageState createState() => ProfileMyOrdersPageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileMyOrdersBloc>(
      create: (context) => ProfileMyOrdersBloc(ProfileMyOrdersState(
        profileMyOrdersModelObj: ProfileMyOrdersModel(),
      ))
        ..add(ProfileMyOrdersInitialEvent()),
      child: ProfileMyOrdersPage(),
    );
  }
}

class ProfileMyOrdersPageState extends State<ProfileMyOrdersPage>
    with AutomaticKeepAliveClientMixin<ProfileMyOrdersPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

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
                        "lbl_orders".tr,
                        style: CustomTextStyles.bodyMedium_1,
                      ),
                      SizedBox(height: 23.v),
                      BlocSelector<ProfileMyOrdersBloc, ProfileMyOrdersState,
                          ProfileMyOrdersModel?>(
                        selector: (state) => state.profileMyOrdersModelObj,
                        builder: (context, profileMyOrdersModelObj) {
                          return ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (
                              context,
                              index,
                            ) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 7.5.v),
                                child: SizedBox(
                                  width: 358.h,
                                  child: Divider(
                                    height: 1.v,
                                    thickness: 1.v,
                                    color: appTheme.gray20001,
                                  ),
                                ),
                              );
                            },
                            itemCount: profileMyOrdersModelObj
                                    ?.profileMyItemList.length ??
                                0,
                            itemBuilder: (context, index) {
                              ProfileMyItemModel model = profileMyOrdersModelObj
                                      ?.profileMyItemList[index] ??
                                  ProfileMyItemModel();
                              return ProfileMyItemWidget(
                                model,
                              );
                            },
                          );
                        },
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
  }
}

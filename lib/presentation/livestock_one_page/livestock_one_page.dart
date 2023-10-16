import 'bloc/livestock_one_bloc.dart';
import 'models/livestock_item_model.dart';
import 'models/livestock_one_model.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/core/app_export.dart';

import 'widgets/livestockdetails_item_widget.dart';

// ignore_for_file: must_be_immutable
class LivestockOnePage extends StatefulWidget {
  const LivestockOnePage({Key? key})
      : super(
          key: key,
        );

  @override
  LivestockOnePageState createState() => LivestockOnePageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<LivestockOneBloc>(
      create: (context) => LivestockOneBloc(LivestockOneState(
        livestockOneModelObj: LivestockOneModel(),
      ))
        ..add(LivestockOneInitialEvent()),
      child: LivestockOnePage(),
    );
  }
}

class LivestockOnePageState extends State<LivestockOnePage>
    with AutomaticKeepAliveClientMixin<LivestockOnePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<LivestockOneBloc, LivestockOneState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: mediaQueryData.size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "lbl_farmer_info".tr,
                          style: CustomTextStyles.labelMediumPrimary,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 21.h),
                          child: Text(
                            "msg_farmer_felix_faro".tr,
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 13.v),
                    Padding(
                      padding: EdgeInsets.only(left: 9.h, top: 5.v),
                      child: BlocSelector<LivestockOneBloc, LivestockOneState,
                          LivestockOneModel?>(
                        selector: (state) => state.livestockOneModelObj,
                        builder: (context, addFarmHoldingModelObj) {
                          return Column(
                            children: [
                              ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 18.v);
                                  },
                                  itemCount:
                                      addFarmHoldingModelObj?.lsmodels.length ??
                                          0,
                                  itemBuilder: (context, index) {
                                    LSdetailsItemModel model =
                                        addFarmHoldingModelObj
                                                ?.lsmodels[index] ??
                                            LSdetailsItemModel();
                                    return LSdetailsItemWidget(
                                      model,
                                      edit: () => addorEdit(
                                        context,
                                        1,
                                        model.id!,
                                      ),
                                      delete: () => delete(context, model.id!),
                                    );
                                  }),
                            ],
                          );
                        },
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

  addorEdit(BuildContext context, int id, int crop) {
    context.read<LivestockOneBloc>().add(
          AddEditEvent(
            value: id,
            crop: crop,
            createSuccessful: () {
              onTapImage(context);
            },
            createFailed: () {
              onTapImage(context);
            },
          ),
        );
  }

  delete(BuildContext context, int id) {
    context.read<LivestockOneBloc>().add(
          DeleteEvent(
            value: id,
          ),
        );
  }

  onTapImage(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.addRearedLivestockOneScreen,
    );
  }
}

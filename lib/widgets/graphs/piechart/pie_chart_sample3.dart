import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiamis_app/theme/theme_helper.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// ignore: must_be_immutable
class PieChartSample3 extends StatefulWidget {
  Tuple2<int?, int?>? data;

  PieChartSample3({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChartSample3State();
}

class PieChartSample3State extends State<PieChartSample3> {
  int touchedIndex = 0;
  @override
  void initState() {
    super.initState();
    verified = widget.data?.item1?.toDouble() ?? 0;
    unverified = widget.data?.item2?.toDouble() ?? 0;
    if (unverified + verified > 0) {
      percentage = (verified / (verified + unverified)) * 100;
    } else {
      percentage = 0;
    }
    print("$percentage,$unverified,$verified");
  }

  late double percentage;
  late double verified;
  late double unverified;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: showingSections(),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? DeviceExt(10).h : DeviceExt(9).h;
      // final widgetSize = isTouched ? 55.0 * 1.5 : 40.0 * 1.5;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green[200],
            value: percentage.toInt().toDouble(),
            title: "${percentage.toInt()}% - Verified",

            radius: radius,
            titleStyle: theme.textTheme.labelLarge!.copyWith(
              color: const Color(0xffffffff),
              fontSize: DeviceExt(1.2).h,
              fontWeight: FontWeight.bold,
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/ophthalmology-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.contentColorBlack,
            // ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: Colors.green[900],
            value: 100 - percentage.toInt().toDouble(),
            title: "${100 - percentage.toInt()}% - Unverified",
            radius: radius,
            titleStyle: theme.textTheme.labelLarge!.copyWith(
              color: const Color(0xffffffff),
              fontSize: DeviceExt(1.2).h,
              fontWeight: FontWeight.bold,
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/librarian-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.contentColorBlack,
            // ),
            badgePositionPercentageOffset: .98,
          );

        default:
          throw Exception('Oh no');
      }
    });
  }
}

// ignore: unused_element
class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    required this.size,
    required this.borderColor,
  });
  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: SvgPicture.asset(
          svgAsset,
        ),
      ),
    );
  }
}

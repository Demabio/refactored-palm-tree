import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/theme/theme_helper.dart';
import 'package:tuple/tuple.dart';

// ignore: must_be_immutable
class PieChartSample2 extends StatefulWidget {
  Tuple2<int?, int?>? tdata;

  PieChartSample2({
    Key? key,
    required this.tdata,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<PieChartSample2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verified = widget.tdata?.item1?.toDouble() ?? 0;
    unverified = widget.tdata?.item2?.toDouble() ?? 0;
    if (unverified + verified > 0) {
      percentage = (verified / (verified + unverified)) * 100;
    } else {
      percentage = 0;
    }
    if (percentage >= 70) {
      pcolor = theme.colorScheme.primary;
    } else if (percentage >= 40 && percentage < 70) {
      pcolor = Colors.yellow[800];
    } else {
      pcolor = Color.fromARGB(255, 255, 17, 0);
    }
  }

  late double percentage;
  late Color? pcolor;
  late double verified;
  late double unverified;
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      "${percentage}%",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: pcolor,
                      ),
                    ),
                  ),
                  PieChart(
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
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 120,
                      sections: showingSections(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      // const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color.fromARGB(255, 214, 214, 214),
            value: percentage,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 214, 214, 214),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: pcolor,
            value: 100 - percentage,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: pcolor,
            ),
          );

        default:
          throw Error();
      }
    });
  }
}

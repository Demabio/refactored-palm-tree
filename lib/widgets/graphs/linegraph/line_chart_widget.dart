import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import 'line_titles.dart';

// ignore: must_be_immutable
class LineChartWidget extends StatelessWidget {
  List<Tuple2<int, int>>? listdata;
  LineChartWidget({
    Key? key,
    required this.listdata,
  }) : super(key: key);

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  List<FlSpot> mapDataToFlSpots(List<Tuple2<int, int>>? dataList) {
    final List<FlSpot> flSpots = [];

    for (final dataTuple in dataList!) {
      final x = dataTuple.item1.toDouble();
      final y = dataTuple.item2.toDouble();

      if (x != null && y != null) {
        flSpots.add(FlSpot(x, y));
      }
    }

    return flSpots;
  }

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          minX: 0,
          maxX: 6,
          minY: 0,
          titlesData: LineTitles.getTitleData(),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            drawVerticalLine: false,
            drawHorizontalLine: false,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Color.fromARGB(255, 203, 208, 212),
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: false,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: mapDataToFlSpots(listdata ?? []),
              isCurved: true,
              color: Colors.green, //gradientColors,
              barWidth: 5,
              // dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: Colors.green[100],
                // gradientColors
                //     .map((color) => color.withOpacity(0.3))
                //     .toList(),
              ),
            ),
          ],
        ),
      );
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
      show: true,
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            switch (value.toInt()) {
              case 0:
                return Text("Mon");
              case 1:
                return Text("Tue");
              case 2:
                return Text("Wed");
              case 3:
                return Text("Thu");
              case 4:
                return Text("Fri");
              case 5:
                return Text("Sat");
              case 6:
                return Text("Sun");
            }
            return Text(" ");
          },
          reservedSize: 35,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            if (value % 1 == 0) {
              return Text(value.toInt().toString());
            }

            return Text(" ");
          },
          reservedSize: 35,
        ),
      ));
}

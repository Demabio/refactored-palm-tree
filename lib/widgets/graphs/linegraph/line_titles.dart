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
              case 2:
                return Text("FEB");
              case 5:
                return Text("MAY");
              case 8:
                return Text("SEPT");
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
            if (value == 1) {
              return Text("10k");
            } else if (value == 2) {
              return Text("20k");
            } else if (value == 3) {
              return Text("30k");
            } else if (value == 4) {
              return Text("40k");
            } else if (value == 5) {
              return Text("50k");
            }

            return Text(" ");
          },
          reservedSize: 35,
        ),
      ));
}

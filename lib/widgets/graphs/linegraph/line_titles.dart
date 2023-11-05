import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:kiamis_app/theme/theme_helper.dart';

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
                return Text(
                  "Mon",
                  style: theme.textTheme.titleSmall?.copyWith(
                      fontSize: Device.orientation == Orientation.portrait
                          ? DeviceExt(1.8).h
                          : DeviceExt(2).w,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                );
              case 1:
                return Text(
                  "Tue",
                  style: theme.textTheme.titleSmall?.copyWith(
                      fontSize: Device.orientation == Orientation.portrait
                          ? DeviceExt(1.8).h
                          : DeviceExt(2).w,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                );
              case 2:
                return Text(
                  "Wed",
                  style: theme.textTheme.titleSmall?.copyWith(
                      fontSize: Device.orientation == Orientation.portrait
                          ? DeviceExt(1.8).h
                          : DeviceExt(2).w,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                );
              case 3:
                return Text(
                  "Thu",
                  style: theme.textTheme.titleSmall?.copyWith(
                      fontSize: Device.orientation == Orientation.portrait
                          ? DeviceExt(1.8).h
                          : DeviceExt(2).w,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                );
              case 4:
                return Text(
                  "Fri",
                  style: theme.textTheme.titleSmall?.copyWith(
                      fontSize: Device.orientation == Orientation.portrait
                          ? DeviceExt(1.8).h
                          : DeviceExt(2).w,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                );
              case 5:
                return Text(
                  "Sat",
                  style: theme.textTheme.titleSmall?.copyWith(
                      fontSize: Device.orientation == Orientation.portrait
                          ? DeviceExt(1.8).h
                          : DeviceExt(2).w,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                );
              case 6:
                return Text(
                  "Sun",
                  style: theme.textTheme.titleSmall?.copyWith(
                      fontSize: Device.orientation == Orientation.portrait
                          ? DeviceExt(1.8).h
                          : DeviceExt(2).w,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                );
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
              return Text(
                value.toInt().toString(),
                style: theme.textTheme.titleSmall?.copyWith(
                    fontSize: Device.orientation == Orientation.portrait
                        ? DeviceExt(1.8).h
                        : DeviceExt(2).w,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              );
            }

            return Text(" ");
          },
          reservedSize: 35,
        ),
      ));
}

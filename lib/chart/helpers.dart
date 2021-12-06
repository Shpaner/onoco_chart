import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:percentile_chart/chart/constants.dart';

import 'models.dart';

Color chartColor(ChartType type) {
  switch (type) {
    case ChartType.weight:
      return AppColors.chartOrange;
    case ChartType.head:
      return AppColors.chartGreen;
    default:
      return AppColors.chartBlue;
  }
}

// TODO fill with values from Gosia.
double minY({required ChartType chartType}) {
  switch (chartType) {
    default:
      return 50;
  }
}

double maxY({required ChartType chartType}) {
  switch (chartType) {
    default:
      return 95;
  }
}

List<BetweenBarsData> percentiles({required ChartType chartType}) {
  return [
    BetweenBarsData(
      fromIndex: 0,
      toIndex: 1,
      colors: [chartColor(chartType).withOpacity(0.2)],
    ),
    BetweenBarsData(
      fromIndex: 2,
      toIndex: 3,
      colors: [chartColor(chartType).withOpacity(0.4)],
    ),
    BetweenBarsData(
      fromIndex: 6,
      toIndex: 7,
      colors: [chartColor(chartType).withOpacity(0.3)],
    ),
    BetweenBarsData(
      fromIndex: 4,
      toIndex: 5,
      colors: [chartColor(chartType)],
    ),
  ];
}

String getBottomTitles(double value) {
  switch (value.toInt()) {
    case 0:
      return '0';
    case 4:
      return '4';
    case 8:
      return '8';
    case 12:
      return '12';
    case 16:
      return '16';
    case 20:
      return '20';
    case 24:
      return '24';
    default:
      return '';
  }
}

String getSideTitles(double value) {
  switch (value.toInt()) {
    case 50:
      return '50';
    case 55:
      return '55';
    case 60:
      return '60';
    case 65:
      return '65';
    case 70:
      return '70';
    case 75:
      return '75';
    case 80:
      return '80';
    case 85:
      return '85';
    case 90:
      return '90';
    case 95:
      return '95';
    default:
      return '';
  }
}

List<LineChartBarData> lineBarsData(
        {required ChartData chartData,
        required ChartType chartType,
        required bool isDarkMode}) =>
    [
      chartData.chartPercentile50High
          .buildPercentiles()
          .copyWith(colors: [chartColor(chartType).withOpacity(0.1)]),
      chartData.chartPercentile50Low
          .buildPercentiles()
          .copyWith(colors: [chartColor(chartType).withOpacity(0.1)]),
      chartData.chartPercentile75High
          .buildPercentiles()
          .copyWith(colors: [chartColor(chartType).withOpacity(0.1)]),
      chartData.chartPercentile75Low
          .buildPercentiles()
          .copyWith(colors: [chartColor(chartType).withOpacity(0.1)]),
      chartData.chartPercentile95High
          .buildPercentiles()
          .copyWith(colors: [chartColor(chartType).withOpacity(0.1)]),
      chartData.chartPercentile95Low
          .buildPercentiles()
          .copyWith(colors: [chartColor(chartType).withOpacity(0.1)]),
      chartData.chartPercentile90High
          .buildPercentiles()
          .copyWith(colors: [chartColor(chartType).withOpacity(0.1)]),
      chartData.chartPercentile90Low
          .buildPercentiles()
          .copyWith(colors: [chartColor(chartType).withOpacity(0.1)]),
      chartData.chartLine.buildLine().copyWith(
        barWidth: isDarkMode ? Constants.backgroundLineBarWidth : 0.0,
        dotData: FlDotData(
          show: isDarkMode,
          getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
            radius: Constants.backgroundLineBarDotSize,
            color: AppColors.white,
            strokeColor: AppColors.white,
            //strokeWidth: Constants.backgroundLineBarDotSize,
          ),
        ),
        colors: [AppColors.white],
      ),
      chartData.chartLine.buildLine(),
    ];
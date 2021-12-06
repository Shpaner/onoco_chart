import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percentile_chart/chart/constants.dart';
import 'package:percentile_chart/chart/helpers.dart';

import 'models.dart';

class Chart extends StatelessWidget {
  final ChartData chartData;
  final ChartType chartType;

  const Chart({
    required this.chartData,
    required this.chartType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // Stack is used here to put two grids on each other
      child: Stack(
        children: [
          _buildBackgroundChart(),
          _buildGridChart(),
        ],
      ),
    );
  }

  Widget _buildBackgroundChart() => AspectRatio(
        aspectRatio: 0.8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 16.0, left: 6.0, top: 26.0, bottom: 10.0),
              child: _buildChart(),
            ),
          ),
        ),
      );

  Widget _buildGridChart() => AspectRatio(
        aspectRatio: 0.8,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Padding(
            padding: const EdgeInsets.only(
                right: 16.0, left: 6.0, top: 26.0, bottom: 10.0),
            child: _buildChart(isBackgroundChart: false),
          ),
        ),
      );

  Widget _buildChart({bool isBackgroundChart = true}) => LineChart(
        LineChartData(
          lineTouchData: _lineTouchData,
          titlesData: _titlesData,
          gridData: _gridData(shouldGridBeThick: isBackgroundChart),
          borderData: _borderData,
          lineBarsData:
              isBackgroundChart ? _lineBarsData : _backgroundLineBarsData,
          betweenBarsData: isBackgroundChart
              ? [
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
                ]
              : [],
          minX: -0,
          maxX: 24,
          maxY: 95,
          minY: 50,
        ),
        swapAnimationDuration: const Duration(milliseconds: 250),
      );

  LineTouchData get _lineTouchData => LineTouchData(enabled: false);

  FlTitlesData get _titlesData => FlTitlesData(
        bottomTitles: _bottomTitles,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        leftTitles: leftTitles(
          getTitles: (value) {
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
            }
            return '';
          },
        ),
      );

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 22,
        margin: 10,
        interval: 1,
        // TODO adjust fonts
        getTextStyles: (context, value) => const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
        getTitles: (value) {
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
          }
          return '';
        },
      );

  SideTitles leftTitles({required GetTitleFunction getTitles}) => SideTitles(
        getTitles: getTitles,
        showTitles: true,
        margin: 8,
        interval: 1,
        reservedSize: 40,
        // TODO adjust fonts
        getTextStyles: (context, value) => const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
      );

  FlGridData _gridData({bool shouldGridBeThick = true}) => FlGridData(
        show: true,
        drawVerticalLine: false,
        drawHorizontalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: shouldGridBeThick
                ? Constants.kGridThicknessBig
                : Constants.kGridThicknessSmall,
          );
        },
        // This could be 0.3333 to match design but then it wouldn't be ideal.
        horizontalInterval: shouldGridBeThick ? 5.0 : 2.5,
      );

  FlBorderData get _borderData => FlBorderData(
        show: true,
        border: const Border(
          // Since other lines overlap they appear bigger, so border sides have to be increased by 1 in order to mach other thickened lines.
          bottom: BorderSide(
              color: AppColors.borderColor, width: Constants.kBorderThickness),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(
              color: AppColors.borderColor, width: Constants.kBorderThickness),
        ),
      );

  List<LineChartBarData> get _lineBarsData => [
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
        chartData.chartLine.buildLine(),
      ];

  List<LineChartBarData> get _backgroundLineBarsData => [
        chartData.chartLine.buildLine(),
      ];
}

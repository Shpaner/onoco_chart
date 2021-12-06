import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percentile_chart/chart/constants.dart';
import 'package:percentile_chart/chart/helpers.dart';

import 'models.dart';

class Chart extends StatelessWidget {
  final ChartData chartData;
  final ChartType chartType;
  final bool isDarkMode;

  const Chart({
    required this.chartData,
    required this.chartType,
    required this.isDarkMode,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // Stack is used here to put two grids on each other.
      child: Stack(
        children: [
          _buildBackgroundChart(),
          _buildGridChart(),
        ],
      ),
    );
  }

  Widget _buildBackgroundChart() => AspectRatio(
        aspectRatio: Dimens.aspectRatio,
        child: Padding(
          padding: const EdgeInsets.all(Dimens.smallPadding),
          child: Card(
            color: isDarkMode ? AppColors.backgroundColorDark : AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.chardCardBorderRadius),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: Dimens.normalPadding,
                  left: Dimens.extraSmallPadding,
                  top: Dimens.bigPadding,
                  bottom: Dimens.mediumPadding),
              child: _buildChart(isBackgroundChart: true),
            ),
          ),
        ),
      );

  Widget _buildGridChart() => AspectRatio(
        aspectRatio: Dimens.aspectRatio,
        child: Padding(
          padding: const EdgeInsets.all(Dimens.mainPadding),
          child: Padding(
            padding: const EdgeInsets.only(
                right: Dimens.normalPadding,
                left: Dimens.extraSmallPadding,
                top: Dimens.bigPadding,
                bottom: Dimens.mediumPadding),
            child: _buildChart(isBackgroundChart: false),
          ),
        ),
      );

  Widget _buildChart({required bool isBackgroundChart}) => LineChart(
        LineChartData(
          lineTouchData: _lineTouchData,
          titlesData: _titlesData,
          gridData: _gridData(shouldGridBeThick: isBackgroundChart),
          borderData: _borderData(isBackgroundChart: isBackgroundChart),
          lineBarsData: lineBarsData(
            chartData: chartData,
            chartType: chartType,
            isDarkMode: isDarkMode,
          ),
          betweenBarsData:
              isBackgroundChart ? [] : percentiles(chartType: chartType),
          minX: 0,
          maxX: 24,
          maxY: maxY(chartType: chartType),
          minY: minY(chartType: chartType),
        ),
        swapAnimationDuration: const Duration(milliseconds: 250),
      );

  LineTouchData get _lineTouchData => LineTouchData(enabled: false);

  FlTitlesData get _titlesData => FlTitlesData(
        bottomTitles: _bottomTitles,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        leftTitles: _leftTitles,
      );

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 22,
        margin: 10,
        interval: 1,
        getTextStyles: (context, value) => TextStyle(
          color: isDarkMode ? AppColors.white : AppColors.black,
          fontWeight: FontWeight.w300,
          fontSize: 16,
        ),
        getTitles: (value) => getBottomTitles(value),
      );

  SideTitles get _leftTitles => SideTitles(
        getTitles: (value) => getSideTitles(value),
        showTitles: true,
        margin: 8,
        interval: 1,
        reservedSize: 40,
        getTextStyles: (context, value) => TextStyle(
          color: isDarkMode ? AppColors.white : AppColors.black,
          fontWeight: FontWeight.w300,
          fontSize: 16,
        ),
      );

  FlGridData _gridData({bool shouldGridBeThick = true}) => FlGridData(
        show: true,
        drawVerticalLine: false,
        drawHorizontalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color:
                shouldGridBeThick ? AppColors.borderColor : AppColors.gridColor,
            strokeWidth: Constants.kGridThickness,
          );
        },
        horizontalInterval: shouldGridBeThick
            ? Constants.gridIntervalsBig
            : Constants.gridIntervalsSmall,
      );

  FlBorderData _borderData({required bool isBackgroundChart}) => FlBorderData(
        show: isBackgroundChart,
        border: Border(
          bottom: BorderSide(
            color: isDarkMode
                ? AppColors.borderColorDarkThick
                : AppColors.borderColor,
            width: Constants.kGridThickness,
          ),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: BorderSide(
            color: isDarkMode
                ? AppColors.borderColorDarkThick
                : AppColors.borderColor,
            width: Constants.kGridThickness,
          ),
        ),
      );
}

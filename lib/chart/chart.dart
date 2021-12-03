import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final LineChartBarData linePercentile50High;
  final LineChartBarData linePercentile50Low;
  final LineChartBarData linePercentile75High;
  final LineChartBarData linePercentile75Low;
  final LineChartBarData linePercentile90High;
  final LineChartBarData linePercentile90Low;
  final LineChartBarData linePercentile95High;
  final LineChartBarData linePercentile95Low;
  final LineChartBarData lineData;

  const Chart({
    required this.linePercentile50High,
    required this.linePercentile50Low,
    required this.linePercentile75High,
    required this.linePercentile75Low,
    required this.linePercentile90High,
    required this.linePercentile90Low,
    required this.linePercentile95High,
    required this.linePercentile95Low,
    required this.lineData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // Stack is used here to put two grids on each other
      child: Stack(
        children: [
          _buildBackgroundChart(),
          _buildLineChart(),
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

  Widget _buildLineChart() => AspectRatio(
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
          lineBarsData: _lineBarsData,
          betweenBarsData: [
            BetweenBarsData(
              fromIndex: 0,
              toIndex: 1,
              colors: [
                Colors.green,
                //const Color(0xFF2FC0EF).withOpacity(0.2),
              ],
            ),
            BetweenBarsData(
              fromIndex: 2,
              toIndex: 3,
              colors: [
                Colors.red,
                //const Color(0xFF2FC0EF).withOpacity(0.3),
              ],
            ),
            BetweenBarsData(
              fromIndex: 5,
              toIndex: 6,
              colors: [
                Colors.yellow,
                //const Color(0xFF2FC0EF).withOpacity(0.4),
              ],
            ),
            BetweenBarsData(
              fromIndex: 4,
              toIndex: 5,
              colors: [
                Colors.blue,
                //const Color(0xFF2FC0EF),
              ],
            ),
          ],
          minX: 0,
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
            strokeWidth:
                shouldGridBeThick ? _gridThicknessBig : _gridThicknessSmall,
          );
        },
        // This could be 0.3333 to match design but then it wouldn't be ideal.
        horizontalInterval: shouldGridBeThick ? 5.0 : 2.5,
      );

  FlBorderData get _borderData => FlBorderData(
        show: true,
        border: const Border(
          // Since other lines overlap they appear bigger, so border sides have to be increased by 1 in order to mach other thickened lines.
          bottom: BorderSide(color: Color(0xff37434d), width: _borderThickness),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Color(0xff37434d), width: _borderThickness),
        ),
      );

  List<LineChartBarData> get _lineBarsData => [
        linePercentile50High,
        linePercentile50Low,
        linePercentile75High,
        linePercentile75Low,
        linePercentile95High,
        linePercentile95Low,
        linePercentile90High,
        linePercentile90Low,
        lineData,
      ];
}

enum Percentiles { ninetyFive, ninety, seventyFive, fifty }

const double _gridThicknessSmall = 0.2;

const double _gridThicknessBig = 0.3;

const double _borderThickness = _gridThicknessBig + 0.1;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

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

  // TODO
  //Widget _buildPercentileChart() => ;

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
                //Colors.red,
                const Color(0xFF2FC0EF).withOpacity(0.2),
              ],
            ),
            BetweenBarsData(
              fromIndex: 2,
              toIndex: 3,
              colors: [
                //Colors.red,
                const Color(0xFF2FC0EF).withOpacity(0.3),
              ],
            ),
            BetweenBarsData(
              fromIndex: 5,
              toIndex: 6,
              colors: [
                //Colors.yellow,
                const Color(0xFF2FC0EF).withOpacity(0.4),
              ],
            ),
            BetweenBarsData(
              fromIndex: 4,
              toIndex: 5,
              colors: [
                //Colors.green,
                const Color(0xFF2FC0EF),
              ],
            ),
          ],
          minX: 0,
          maxX: 14,
          maxY: 9,
          minY: 0,
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
              case 0:
                return '50';
              case 1:
                return '55';
              case 2:
                return '60';
              case 3:
                return '65';
              case 4:
                return '70';
              case 5:
                return '75';
              case 6:
                return '80';
              case 7:
                return '85';
              case 8:
                return '90';
              case 9:
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
            case 1:
              return '1';
            case 3:
              return '4';
            case 5:
              return '8';
            case 7:
              return '12';
            case 9:
              return '16';
            case 11:
              return '20';
            case 13:
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
            strokeWidth: shouldGridBeThick ? 0.5 : 0.3,
          );
        },
        // This could be 0.3333 to match design but then it wouldn't be ideal.
        horizontalInterval: shouldGridBeThick ? 1.0 : 0.5,
      );

  FlBorderData get _borderData => FlBorderData(
        show: true,
        border: const Border(
          // Since other lines overlap they appear bigger, so border sides have to be increased by 1 in order to mach other thickened lines.
          bottom: BorderSide(color: Color(0xff37434d), width: 0.6),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Color(0xff37434d), width: 0.6),
        ),
      );

  List<LineChartBarData> get _lineBarsData => [
        _linePercentile50High,
        _linePercentile50Low,
        _linePercentile75High,
        _linePercentile75Low,
        _linePercentile95High,
        _linePercentile95Low,
        _linePercentile90High,
        _linePercentile90Low,
        _lineData,
      ];

  LineChartBarData get _lineData => LineChartBarData(
        isCurved: false,
        colors: const [Color(0xFF5231B4)],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1.5),
          FlSpot(1.25, 1.6),
          FlSpot(2, 1.9),
          FlSpot(2.2, 2.0),
          FlSpot(2.75, 2.2),
          FlSpot(4, 2.5),
          FlSpot(4.25, 2.6),
          FlSpot(4.7, 2.9),
          FlSpot(5, 3.0),
          FlSpot(6.0, 3.1),
          FlSpot(7, 3.5),
          FlSpot(8, 3.6),
          FlSpot(9, 3.7),
          FlSpot(10, 3.8),
          FlSpot(11, 4),
          FlSpot(12, 4.2),
          FlSpot(13, 4.5),
        ],
      );

  LineChartBarData get _linePercentile95High => LineChartBarData(
        isCurved: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 2.4),
          FlSpot(1, 2.6),
          FlSpot(6, 4.2),
          FlSpot(13, 5.6),
          FlSpot(14, 6.0),
        ],
      );

  LineChartBarData get _linePercentile95Low => LineChartBarData(
        isCurved: true,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 0.9),
          FlSpot(1, 1.25),
          FlSpot(6, 2.95),
          FlSpot(13, 4.25),
          FlSpot(14, 4.5),
        ],
      );

  LineChartBarData get _linePercentile90High => LineChartBarData(
        colors: [const Color(0xFF2FC0EF).withOpacity(0.4)],
        isCurved: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 3.6),
          FlSpot(1, 3.8),
          FlSpot(6, 5.4),
          FlSpot(13, 6.8),
          FlSpot(14, 7.0),
        ],
      );

  LineChartBarData get _linePercentile90Low => LineChartBarData(
        colors: [const Color(0xFF2FC0EF).withOpacity(0.3)],
        isCurved: true,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 0.7),
          FlSpot(1, 1.15),
          FlSpot(6, 2.85),
          FlSpot(13, 4.05),
          FlSpot(14, 4.3),
        ],
      );

  LineChartBarData get _linePercentile75High => LineChartBarData(
        colors: [const Color(0xFF2FC0EF).withOpacity(0.3)],
        isCurved: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 4.6),
          FlSpot(1, 4.8),
          FlSpot(6, 6.4),
          FlSpot(13, 7.8),
          FlSpot(14, 8.0),
        ],
      );

  LineChartBarData get _linePercentile75Low => LineChartBarData(
        colors: [const Color(0xFF2FC0EF).withOpacity(0.4)],
        isCurved: true,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 0.7),
          FlSpot(1, 1.15),
          FlSpot(6, 2.85),
          FlSpot(13, 4.05),
          FlSpot(14, 4.3),
        ],
      );

  LineChartBarData get _linePercentile50High => LineChartBarData(
        colors: [const Color(0xFF2FC0EF).withOpacity(0.2)],
        isCurved: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 5.6),
          FlSpot(1, 5.8),
          FlSpot(6, 7.4),
          FlSpot(13, 8.8),
          FlSpot(14, 9.0),
        ],
      );

  LineChartBarData get _linePercentile50Low => LineChartBarData(
        colors: [const Color(0xFF2FC0EF).withOpacity(0.3)],
        isCurved: true,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 0.7),
          FlSpot(1, 1.15),
          FlSpot(6, 2.85),
          FlSpot(13, 4.05),
          FlSpot(14, 4.3),
        ],
      );
}

enum Percentiles { ninetyFive, ninety, seventyFive, fifty }

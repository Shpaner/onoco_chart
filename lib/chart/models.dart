import 'package:fl_chart/fl_chart.dart';

import 'constants.dart';

class ChartData {
  final ChartExtent chartExtent;
  final ChartLine chartLine;
  final ChartPercentile chartPercentile95High;
  final ChartPercentile chartPercentile95Low;
  final ChartPercentile chartPercentile90High;
  final ChartPercentile chartPercentile90Low;
  final ChartPercentile chartPercentile75High;
  final ChartPercentile chartPercentile75Low;
  final ChartPercentile chartPercentile50High;
  final ChartPercentile chartPercentile50Low;

  const ChartData({
    required this.chartExtent,
    required this.chartLine,
    required this.chartPercentile95High,
    required this.chartPercentile95Low,
    required this.chartPercentile90High,
    required this.chartPercentile90Low,
    required this.chartPercentile75High,
    required this.chartPercentile75Low,
    required this.chartPercentile50High,
    required this.chartPercentile50Low,
  });
}

class ChartLine {
  final List<FlSpot> spots;

  const ChartLine(this.spots);

  LineChartBarData buildLine() => LineChartBarData(
        isCurved: false,
        colors: [AppColors.chartLinePurple],
        barWidth: Constants.lineBarWidth,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
              radius: Constants.lineBarDotSize,
              color: AppColors.chartLinePurple),
        ),
        belowBarData: BarAreaData(show: false),
        spots: spots,
      );
}

class ChartPercentile {
  final List<FlSpot> spots;

  const ChartPercentile(this.spots);

  LineChartBarData buildPercentiles() => LineChartBarData(
        isCurved: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: spots,
      );
}

class ChartExtent {
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;

  const ChartExtent({
    required this.minX,
    required this.maxX,
    required this.minY,
    required this.maxY,
  });
}

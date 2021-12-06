import 'package:fl_chart/fl_chart.dart';

import 'models.dart';

class MockData {
  final ChartData chartData = const ChartData(
    chartLine: _chartLine,
    chartPercentile95High: _chartPercentile95High,
    chartPercentile95Low: _chartPercentile95Low,
    chartPercentile90High: _chartPercentile90High,
    chartPercentile90Low: _chartPercentile90Low,
    chartPercentile75High: _chartPercentile75High,
    chartPercentile75Low: _chartPercentile75Low,
    chartPercentile50High: _chartPercentile50High,
    chartPercentile50Low: _chartPercentile50Low,
  );

  static const ChartLine _chartLine = ChartLine(
    [
      FlSpot(0.5, 54),
      FlSpot(1.9, 59),
      FlSpot(7.8, 63),
      FlSpot(9, 67),
      FlSpot(13.5, 70),
      FlSpot(18, 76),
    ],
  );

  static const _chartPercentile95High = ChartPercentile(
    [
      FlSpot(0.0, 59),
      FlSpot(12.0, 73),
      FlSpot(24, 86),
    ],
  );

  static const _chartPercentile95Low = ChartPercentile(
    [
      FlSpot(0.0, 57),
      FlSpot(12.0, 71),
      FlSpot(24, 84),
    ],
  );

  static const _chartPercentile90High = ChartPercentile(
    [
      FlSpot(0.0, 61),
      FlSpot(12.0, 75),
      FlSpot(24, 88),
    ],
  );

  static const _chartPercentile90Low = ChartPercentile(
    [
      FlSpot(0.0, 55),
      FlSpot(12.0, 69),
      FlSpot(24, 82),
    ],
  );

  static const _chartPercentile75High = ChartPercentile(
    [
      FlSpot(0.0, 63),
      FlSpot(12.0, 78),
      FlSpot(24, 90),
    ],
  );

  static const _chartPercentile75Low = ChartPercentile(
    [
      FlSpot(0.0, 53),
      FlSpot(12.0, 67),
      FlSpot(24, 80),
    ],
  );

  static const _chartPercentile50High = ChartPercentile(
    [
      FlSpot(0.0, 65),
      FlSpot(12.0, 81),
      FlSpot(24, 92),
    ],
  );

  static const _chartPercentile50Low = ChartPercentile(
    [
      FlSpot(0.0, 51),
      FlSpot(10.2, 62),
      FlSpot(24, 76),
    ],
  );
}

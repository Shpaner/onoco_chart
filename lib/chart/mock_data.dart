import 'package:fl_chart/fl_chart.dart';
import 'package:percentile_chart/chart/helpers.dart';

import 'models.dart';

/// ALL Mock Data corresponds with: lhfa, girls, height, 0 - 2y, day 0 to day 740

class MockData3 {
  final ChartData chartData = const ChartData(
    chartExtent: _chartExtent,
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

  static const ChartExtent _chartExtent = ChartExtent(
    minX: 0,
    maxX: 24,
    minY: 50,
    maxY: 95,
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

ChartData chartData(
    {required List<int> days, required List<List<double>> data}) {
  return ChartData(
    chartExtent: MockData10.chartExtent,
    chartLine: MockData10.chartLine,
    chartPercentile95High:
        ChartPercentile(getSpots(days: days, percentile: 15, data: data)),
    chartPercentile90High:
        ChartPercentile(getSpots(days: days, percentile: 14, data: data)),
    chartPercentile75High:
        ChartPercentile(getSpots(days: days, percentile: 12, data: data)),
    chartPercentile50High:
        ChartPercentile(getSpots(days: days, percentile: 11, data: data)),
    chartPercentile50Low:
        ChartPercentile(getSpots(days: days, percentile: 11, data: data)),
    chartPercentile75Low:
        ChartPercentile(getSpots(days: days, percentile: 10, data: data)),
    chartPercentile90Low:
        ChartPercentile(getSpots(days: days, percentile: 8, data: data)),
    chartPercentile95Low:
        ChartPercentile(getSpots(days: days, percentile: 7, data: data)),
  );
}

class MockData10 {
  final List<int> days;
  final List<List<double>> data;

  MockData10({required this.days, required this.data});

  static const ChartExtent chartExtent = ChartExtent(
    minX: 0,
    maxX: 24,
    minY: 49,
    maxY: 95,
  );

  static const ChartLine chartLine = ChartLine(
    [
      FlSpot(0.5, 54),
      FlSpot(1.9, 59),
      FlSpot(7.8, 63),
      FlSpot(9, 67),
      FlSpot(13.5, 70),
      FlSpot(18, 76),
    ],
  );

  // ChartPercentile _chartPercentile95High = ChartPercentile(
  //   _getSpots(_getDays, 2)
  //   // [
  //   //   //                 in days:
  //   //   FlSpot(0, 59), // 0
  //   //   FlSpot(2, 86), // 61
  //   //   FlSpot(4, 86), // 122
  //   //   FlSpot(6, 86), // 183
  //   //   FlSpot(8, 86), // 244
  //   //   FlSpot(10, 86), // 304
  //   //   FlSpot(12, 86), // 366
  //   //   FlSpot(14, 86), // 426
  //   //   FlSpot(16, 86), // 487
  //   //   FlSpot(18, 86), // 548
  //   //   FlSpot(20, 86), // 609
  //   //   FlSpot(22, 86), // 670
  //   //   FlSpot(24, 86), // 731
  //   // ],
  // );
  //
  // static const _chartPercentile95Low = ChartPercentile([]);
  //
  // static const _chartPercentile90High = ChartPercentile(
  //   [
  //     FlSpot(0, 59), // 0
  //     FlSpot(2, 86), // 61
  //     FlSpot(4, 86), // 122
  //     FlSpot(6, 86), // 183
  //     FlSpot(8, 86), // 244
  //     FlSpot(10, 86), // 304
  //     FlSpot(12, 86), // 366
  //     FlSpot(14, 86), // 426
  //     FlSpot(16, 86), // 487
  //     FlSpot(18, 86), // 548
  //     FlSpot(20, 86), // 609
  //     FlSpot(22, 86), // 670
  //     FlSpot(24, 86), // 731
  //   ],
  // );
  //
  // static const _chartPercentile90Low = ChartPercentile(
  //   [
  //     FlSpot(0, 59), // 0
  //     FlSpot(2, 86), // 61
  //     FlSpot(4, 86), // 122
  //     FlSpot(6, 86), // 183
  //     FlSpot(8, 86), // 244
  //     FlSpot(10, 86), // 304
  //     FlSpot(12, 86), // 366
  //     FlSpot(14, 86), // 426
  //     FlSpot(16, 86), // 487
  //     FlSpot(18, 86), // 548
  //     FlSpot(20, 86), // 609
  //     FlSpot(22, 86), // 670
  //     FlSpot(24, 86), // 731
  //   ],
  // );
  //
  // static const _chartPercentile75High = ChartPercentile(
  //   [
  //     FlSpot(0, 59), // 0
  //     FlSpot(2, 86), // 61
  //     FlSpot(4, 86), // 122
  //     FlSpot(6, 86), // 183
  //     FlSpot(8, 86), // 244
  //     FlSpot(10, 86), // 304
  //     FlSpot(12, 86), // 366
  //     FlSpot(14, 86), // 426
  //     FlSpot(16, 86), // 487
  //     FlSpot(18, 86), // 548
  //     FlSpot(20, 86), // 609
  //     FlSpot(22, 86), // 670
  //     FlSpot(24, 86), // 731
  //   ],
  // );
  //
  // static const _chartPercentile75Low = ChartPercentile(
  //   [
  //     FlSpot(0, 59), // 0
  //     FlSpot(2, 86), // 61
  //     FlSpot(4, 86), // 122
  //     FlSpot(6, 86), // 183
  //     FlSpot(8, 86), // 244
  //     FlSpot(10, 86), // 304
  //     FlSpot(12, 86), // 366
  //     FlSpot(14, 86), // 426
  //     FlSpot(16, 86), // 487
  //     FlSpot(18, 86), // 548
  //     FlSpot(20, 86), // 609
  //     FlSpot(22, 86), // 670
  //     FlSpot(24, 86), // 731
  //   ],
  // );
  //
  // static const _chartPercentile50High = ChartPercentile(
  //   [
  //     FlSpot(0, 59), // 0
  //     FlSpot(2, 86), // 61
  //     FlSpot(4, 86), // 122
  //     FlSpot(6, 86), // 183
  //     FlSpot(8, 86), // 244
  //     FlSpot(10, 86), // 304
  //     FlSpot(12, 86), // 366
  //     FlSpot(14, 86), // 426
  //     FlSpot(16, 86), // 487
  //     FlSpot(18, 86), // 548
  //     FlSpot(20, 86), // 609
  //     FlSpot(22, 86), // 670
  //     FlSpot(24, 86), // 731
  //   ],
  // );
  //
  // static const _chartPercentile50Low = ChartPercentile(
  //   [
  //     FlSpot(0, 59), // 0
  //     FlSpot(2, 86), // 61
  //     FlSpot(4, 86), // 122
  //     FlSpot(6, 86), // 183
  //     FlSpot(8, 86), // 244
  //     FlSpot(10, 86), // 304
  //     FlSpot(12, 86), // 366
  //     FlSpot(14, 86), // 426
  //     FlSpot(16, 86), // 487
  //     FlSpot(18, 86), // 548
  //     FlSpot(20, 86), // 609
  //     FlSpot(22, 86), // 670
  //     FlSpot(24, 86), // 731
  //   ],
  // );
}

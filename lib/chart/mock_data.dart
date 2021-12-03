import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MockData {
  LineChartBarData get lineData => LineChartBarData(
        isCurved: false,
        colors: const [Color(0xFF5231B4)],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0.5, 54),
          FlSpot(1.9, 59),
          FlSpot(7.8, 63),
          FlSpot(9, 67),
          FlSpot(13.5, 70),
          FlSpot(18, 76),
        ],
      );

  LineChartBarData get linePercentile95High => LineChartBarData(
        colors: [const Color(0xFF2FC0EF)],
        isCurved: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0.0, 59),
          FlSpot(12.0, 73),
          FlSpot(24, 86),
        ],
      );

  LineChartBarData get linePercentile95Low => LineChartBarData(
        colors: [const Color(0xFF2FC0EF)],
        isCurved: true,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0.0, 57),
          FlSpot(12.0, 71),
          FlSpot(24, 84),
        ],
      );

  LineChartBarData get linePercentile90High => LineChartBarData(
        colors: [const Color(0xFF2FC0EF).withOpacity(0.4)],
        isCurved: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0.0, 61),
          FlSpot(12.0, 75),
          FlSpot(24, 88),
        ],
      );

  LineChartBarData get linePercentile90Low => LineChartBarData(
        colors: [const Color(0xFF2FC0EF).withOpacity(0.4)],
        isCurved: true,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0.0, 55),
          FlSpot(12.0, 69),
          FlSpot(24, 82),
        ],
      );

  LineChartBarData get linePercentile75High => LineChartBarData(
        colors: [const Color(0xFF2FC0EF).withOpacity(0.3)],
        isCurved: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0.0, 63),
          FlSpot(12.0, 78),
          FlSpot(24, 90),
        ],
      );

  LineChartBarData get linePercentile75Low => LineChartBarData(
        colors: [const Color(0xFF2FC0EF).withOpacity(0.3)],
        isCurved: true,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0.0, 53),
          FlSpot(12.0, 67),
          FlSpot(24, 80),
        ],
      );

  LineChartBarData get linePercentile50High => LineChartBarData(
        colors: [const Color(0xFF2FC0EF).withOpacity(0.2)],
        isCurved: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0.0, 65),
          FlSpot(12.0, 81),
          FlSpot(24, 92),
        ],
      );

  LineChartBarData get linePercentile50Low => LineChartBarData(
        colors: [const Color(0xFF2FC0EF).withOpacity(0.2)],
        isCurved: true,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0.0, 51),
          FlSpot(12.0, 62),
          FlSpot(24, 76),
        ],
      );
}

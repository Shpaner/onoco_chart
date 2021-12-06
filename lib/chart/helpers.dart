import 'dart:ui';

import 'package:percentile_chart/chart/constants.dart';

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

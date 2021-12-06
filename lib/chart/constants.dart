import 'dart:ui';

enum Percentiles { ninetyFive, ninety, seventyFive, fifty }

enum ChartType { height, weight, head }

class Constants {
  static const double kGridThicknessSmall = 0.2;

  static const double kGridThicknessBig = 0.3;

  static const double kBorderThickness = kGridThicknessBig + 0.1;
}

class AppColors {
  static const borderColor = Color(0xff37434d);

  static const chartLinePurple = Color(0xFF5231B4);

  static const chartBlue = Color(0xFF2FC0EF);

  static const chartOrange = Color(0xFFEB8D00);

  static const chartGreen = Color(0xFF4EC623);
}

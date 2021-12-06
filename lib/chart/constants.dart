import 'dart:ui';

enum Percentiles { ninetyFive, ninety, seventyFive, fifty }

enum ChartType { height, weight, head }

class Constants {
  static const double kGridThickness = 1.0;

  static const double lineBarWidth = 4.3;

  static const double lineBarDotSize = 4.6;

  static const double _backgroundLineBarDifference = 1.0;

  static const double backgroundLineBarWidth =
      lineBarWidth * 1.1 + _backgroundLineBarDifference;

  static const double backgroundLineBarDotSize =
      lineBarDotSize * 0.95 + _backgroundLineBarDifference;

  static const double gridIntervalsSmall = 2.5;

  static const double gridIntervalsBig = 5.0;
}

class AppColors {
  static const white = Color(0xffFFFFFF);

  static const black = Color(0xff000000);

  static const backgroundColorDark = Color(0xff33335C);

  static const borderColor = Color(0xffDBDDE0);

  static Color gridColor = const Color(0xFFDBDDE0).withOpacity(0.5);

  static const borderColorDarkThick = Color(0xffDBDDE0);

  static const borderColorDarkThin = Color(0xffC4C4C4);

  static const chartLinePurple = Color(0xFF5231B4);

  static const chartBlue = Color(0xFF2FC0EF);

  static const chartOrange = Color(0xFFEB8D00);

  static const chartGreen = Color(0xFF4EC623);
}

class Dimens {
  static const double aspectRatio = 0.8;

  static const double mainPadding = 12.0;

  static const double smallPadding = 8.0;

  static const double extraSmallPadding = 6.0;

  static const double mediumPadding = 10.0;

  static const double normalPadding = 16.0;

  static const double bigPadding = 26.0;

  static const double chardCardBorderRadius = 12.0;
}

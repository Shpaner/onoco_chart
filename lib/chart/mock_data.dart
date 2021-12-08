/// potrzebuje nastepujace punkty:
///
/// dla osi X (miesiace): od 0 do 24, gdzie '0' to urodziny, a '24' to 2 lata
/// dla osi Y (wartosc): tu zaleznie od typu wykresu tj. wysokosc, waga lub obwod glowy
///
/// zakres osi x to zawsze 0 - 24
/// zakres osi y to:
///   dla wysokosci: 50 - 95
///   dla wagi i glowy zaputalem gosie, bo na designach nie ma wartosci
///
/// przy kazdym pobraniu danych z api potrzebuje zbior punktow ktore zawarlem  w klasie ponizej,
/// najlepiej byloby zwracac caluy model, ale listy punktow tez nie beda zlym rozwiazaniem.
///
/// w kazdym pobraniu musi byc lista punktow wbitych przez uzytkownika i punkty percentyli
///
/// PUNKTY OD UZYTKOWNIKA:
/// np. wysokosc: (0, 52), (8,63),...(20,76) - x to miesiac, y to to wysokosc dziecka podane przez uzytkownika
///
/// JAK ZAPISUJEMY PERCENTYLE?
/// zeby przedstawic percentyle na wykresie potrzebuje wykres gorny i dolny, zeby narysowac ich pole
/// percentyle dzielimy na 4 kategorie, gdzie kazdy tak jak wyzej wspomnialem dzielimy na gorny i dolny
/// te kategorie sa wziete z designu i wygladaja nastepujaco:
/// 95 ( high / low ) - najcisniejsze,
/// 90 (high / low ) - szersze,
/// ...
/// 50 (high / low ) najszersze,
///
/// Do narysowania percentyli potrzebuje wszystkie kategorie,
/// ale islosc punktow mozemy okroic tak jak o tym rozmawialismy,
/// tj. dla kazdego miesiaca jeden percentyl czyli zakres gorny i dolny.
/// Idac tym tokiem, potrzebujemy 8 LIST PUNKTOW PERCENTYLOWYCH
///
/// przykladowe zbiory punktow percentylowych beda wygladaly tak jak ponizej w klaise MOCK DATA, po komentarzu "Percentyle!"
///
import 'package:fl_chart/fl_chart.dart';

import 'models.dart';

class MockData {
  /// To jest klasa, ktora przesylam bezposrednio do charta jako
  /// zbior wszystkich punktow ptrzebnych do wykresu
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
    minY: 45,
    maxY: 95,
  );

  /// chart line to wykres punktow z inputu uzytkownika
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

  /// PERCENTYLE !
  static const _chartPercentile95High = ChartPercentile(
    [
      FlSpot(0, 52.212), // 0
      FlSpot(2, 60.43), // 61
      FlSpot(4, 65.668), // 122
      FlSpot(6, 69.48), // 183
      FlSpot(8, 72.665), // 244
      FlSpot(10, 75.523), // 304
      FlSpot(12, 78.282), // 366
      FlSpot(14, 80.792), // 426
      FlSpot(16, 83.202), // 487
      FlSpot(18, 85.489), // 548
      FlSpot(20, 87.668), // 609
      FlSpot(22, 89.75), // 670
      FlSpot(24, 91.038), // 731
      // FlSpot(0.0, 59),
      // FlSpot(12.0, 73),
      // FlSpot(24, 86),

      FlSpot(1, 56.974), // 31
      FlSpot(3, 63.324), // 92
      FlSpot(5, 67.727), // 153
      FlSpot(7, 71.145), // 214
      FlSpot(9, 74.167), // 275
      FlSpot(11, 76.971), // 336
      FlSpot(13, 79.598), // 397
      FlSpot(15, 82.072), // 458
      FlSpot(17, 84.416), // 519
      FlSpot(19, 86.645), // 580
      FlSpot(21, 88.772), // 641
      FlSpot(23, 90.803), // 702
    ],
  );

  static const _chartPercentile95Low = ChartPercentile(
    [
      FlSpot(0, 46.084), // 0
      FlSpot(2, 53.73), // 61
      FlSpot(4, 58.546), // 122
      FlSpot(6, 62.022), // 183
      FlSpot(8, 64.882), // 244
      FlSpot(10, 67.408), // 304
      FlSpot(12, 69.808), // 366
      FlSpot(14, 71.962), // 426
      FlSpot(16, 74.009), // 487
      FlSpot(18, 75.935), // 548
      FlSpot(20, 77.755), // 609
      FlSpot(22, 79.481), // 670
      FlSpot(24, 80.422), // 731

      FlSpot(1, 50.54), // 31
      FlSpot(3, 56.394), // 92
      FlSpot(5, 60.429), // 153
      FlSpot(7, 63.522), // 214
      FlSpot(9, 66.215), // 275
      FlSpot(11, 68.67), // 336
      FlSpot(13, 70.939), // 397
      FlSpot(15, 73.052), // 458
      FlSpot(17, 75.034), // 519
      FlSpot(19, 76.902), // 580
      FlSpot(21, 78.672), // 641
      FlSpot(23, 80.353), // 702
    ],
  );

  static const _chartPercentile90High = ChartPercentile(
    [
      FlSpot(0.0, 55),
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

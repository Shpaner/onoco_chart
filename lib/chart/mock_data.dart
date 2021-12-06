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

  /// chart line to wykres punktow z inputu uzytkownika
  static const ChartLine _chartLine = ChartLine(
    [
      /// kazdy punkt to odpowiednio (X, Y), gdzie 'X' to miesiac,
      /// a 'Y' to wartosc (wzrost, waga lub obwod glowy)
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

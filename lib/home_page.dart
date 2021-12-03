import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percentile_chart/chart/mock_data.dart';

import 'chart/chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Chart(
          lineData: MockData().lineData,
          linePercentile95High: MockData().linePercentile95High,
          linePercentile95Low: MockData().linePercentile95Low,
          linePercentile90High: MockData().linePercentile90High,
          linePercentile90Low: MockData().linePercentile90Low,
          linePercentile75High: MockData().linePercentile75High,
          linePercentile75Low: MockData().linePercentile75Low,
          linePercentile50High: MockData().linePercentile50High,
          linePercentile50Low: MockData().linePercentile50Low,
        ),
      ),
    );
  }
}

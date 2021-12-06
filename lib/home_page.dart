import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percentile_chart/chart/constants.dart';
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
          chartData: MockData().chartData,
          chartType: ChartType.height,
        ),
      ),
    );
  }
}

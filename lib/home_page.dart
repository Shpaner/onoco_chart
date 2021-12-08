import 'dart:core';

import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percentile_chart/chart/mock_data.dart';

import 'chart/chart.dart';
import 'chart/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoaded = false;
  late final List<List<double>> data;

  loadAsset() async {
    final myData = await rootBundle.loadString("assets/data.csv");
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(myData);
    setState(() {
      data = csvTable.map<List<double>>((e) => e.cast<double>()).toList();
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        onPressed: () => loadAsset(),
      ),
      body: SafeArea(
        child: isLoaded
            ? Chart(
                chartData: chartData(
                  days: [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24],
                  data: data,
                ),
                chartType: ChartType.head,
                isDarkMode: true,
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
  //
  // void getData() async {
  //   final _data = await rootBundle.loadString("assets/data.csv");
  //   final _list =
  //       const CsvToListConverter().convert(_data).cast<List<double>>();
  //   setState(() {
  //     data = _list;
  //   });
  // }

  // Future<List<List<dynamic>>> loadingCsvData() async {
  //   final _data = await rootBundle.loadString("assets/data.csv");
  //   return const CsvToListConverter()
  //       .convert(_data)
  //       .cast<List<double>>()
  //       .toList();
  // }
  //   final csvFile = File("assets/data.csv");
  //   return await csvFile
  //       .transform(utf8.decoder)
  //       .transform(const CsvToListConverter())
  //       .toList();
  // }
}

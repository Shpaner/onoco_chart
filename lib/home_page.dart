import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chart/chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Chart(),
      ),
    );
  }
}

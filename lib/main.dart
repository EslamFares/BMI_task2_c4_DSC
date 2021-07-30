import 'package:bmi_calculator_task2_c4/view/home.dart';
import 'package:bmi_calculator_task2_c4/view/themes/ligthTheme.dart';
import 'package:flutter/material.dart';

import 'view/themes/darkThem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ligthTheme(),
      darkTheme: darkThem(),
      themeMode: ThemeMode.dark,
      home: BmiScreen(),
    );
  }
}

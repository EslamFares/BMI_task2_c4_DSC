import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkThem() {
  return ThemeData(
    scaffoldBackgroundColor: Color(0xff192734),
    primaryColor: Color(0xff192734),
    textTheme: TextTheme(
      // ignore: deprecated_member_use
      body1: TextStyle(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xff22303c),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey),
    appBarTheme: AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white, size: 25.0),
      color: Color(0xff192734),
      centerTitle: false,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xff192734),
          statusBarIconBrightness: Brightness.light),
    ),
  );
}

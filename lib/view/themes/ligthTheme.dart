import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData ligthTheme() {
  return ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.white,
        centerTitle: false,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black, size: 25),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black, size: 25.0),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey[700],
        selectedLabelStyle: TextStyle(color: Colors.deepOrange),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
      ),
      primarySwatch: Colors.deepOrange,
      scaffoldBackgroundColor: Colors.white);
}

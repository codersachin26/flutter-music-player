import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData darkBlueTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.blueGrey[926],
      appBarTheme: AppBarTheme(
          color: Colors.blueGrey[900],
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme));
}

import 'package:flutter/material.dart';

BoxDecoration myDecoration() => BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.blueGrey[900], Colors.blueGrey[700]]));

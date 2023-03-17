import 'package:flutter/material.dart';
import 'package:gham_pani/Pages/home.dart';
import 'package:gham_pani/Pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => HomeScreen(),
    },
  ));
}

// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio_getx_mvvm/view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(), // Entry point to your app
    );
  }
}

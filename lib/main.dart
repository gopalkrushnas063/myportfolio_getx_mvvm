import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio_getx_mvvm/routes/routes.dart';
import 'package:myportfolio_getx_mvvm/view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: allPage,
      home: HomeView(),
    );
  }
}

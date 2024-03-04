import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio_getx_mvvm/controller/dat_controller.dart';
import 'package:myportfolio_getx_mvvm/controller/pichart_controller.dart';
import 'package:myportfolio_getx_mvvm/routes/routes.dart';
import 'package:myportfolio_getx_mvvm/view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
        Get.put(PieChartController());
        Get.put(DataController());

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

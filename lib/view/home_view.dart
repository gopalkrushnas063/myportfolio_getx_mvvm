// view/home_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio_getx_mvvm/viewmodel/home_view_model.dart';

class HomeView extends StatelessWidget {
  final HomeViewModel homeViewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Obx(() {
          if (homeViewModel.isLoading.value) {
            return CircularProgressIndicator();
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display image
                Image.network(
                  homeViewModel.homeModel.value.image,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                Text(
                  homeViewModel.homeModel.value.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                  child: Text(
                    homeViewModel.homeModel.value.careerObjective,
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('View Resume'),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}

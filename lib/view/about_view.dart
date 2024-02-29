// view/about_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio_getx_mvvm/viewmodel/about_view_model.dart';

class AboutView extends StatelessWidget {
  final AboutViewModel aboutViewModel = Get.put(AboutViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Obx(() {
          if (aboutViewModel.isLoading.value) {
            return CircularProgressIndicator();
          } else {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Position: ${aboutViewModel.aboutModel.value.position}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Name: ${aboutViewModel.aboutModel.value.name}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'About: ${aboutViewModel.aboutModel.value.about}',
                    style: TextStyle(fontSize: 18),
                  ),
                  // Display more about information here
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}

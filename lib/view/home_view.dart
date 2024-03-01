import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myportfolio_getx_mvvm/viewmodel/home_view_model.dart';
import 'package:myportfolio_getx_mvvm/widgets/custom_drawer.dart';

class HomeView extends StatelessWidget {
  final HomeViewModel homeViewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: buildDrawer(),
      body: Center(
        child: Obx(() {
          if (homeViewModel.isLoading.value) {
            return const CircularProgressIndicator();
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    homeViewModel.homeModel.value.image,
                    width: 170,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  homeViewModel.homeModel.value.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: DefaultTextStyle(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: homeViewModel.homeModel.value.position
                          .map((position) {
                        return TyperAnimatedText(position);
                      }).toList(),
                      repeatForever: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0, right: 13.0),
                  child: Text(
                    homeViewModel.homeModel.value.careerObjective,
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('View Resume'),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}

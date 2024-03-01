import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio_getx_mvvm/view/banner_view.dart';
import 'package:myportfolio_getx_mvvm/viewmodel/home_view_model.dart';
import 'package:myportfolio_getx_mvvm/widgets/custom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

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
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
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
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: Text(
                      homeViewModel.homeModel.value.careerObjective,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    constraints:
                        const BoxConstraints(maxHeight: 200, maxWidth: 400),
                    child: BannerView(),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                    child: SizedBox(
                      width: double.infinity, // Make the button wide
                      child: ElevatedButton(
                        onPressed: () async {
                          String url = homeViewModel.homeModel.value.resumeUrl;
                          try {
                            await launch(url, forceSafariVC: false);
                          } catch (e) {
                            print('Error launching URL: $e');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Set background color
                        ),
                        child: const Text(
                          'View Resume',
                          style: TextStyle(color: Colors.white), // Set text color
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}

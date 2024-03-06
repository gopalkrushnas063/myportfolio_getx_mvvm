import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:myportfolio_getx_mvvm/controller/bottom_navigation_controller.dart';
import 'package:myportfolio_getx_mvvm/view/about_view.dart';
import 'package:myportfolio_getx_mvvm/view/home_view.dart';
import 'package:myportfolio_getx_mvvm/view/soft_skill_view.dart';
import 'package:myportfolio_getx_mvvm/view/tech_skill_view.dart';

class HomePage extends StatelessWidget {
  final BottomNavigationController _bottomNavigationController =
      Get.put(BottomNavigationController());
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    HomeView(),
    AboutView(),
    SoftSkillView(),
    TechSkillView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () {
          final controller = Get.find<BottomNavigationController>();
          return ConvexAppBar(
            backgroundColor: Colors.red,
            items: const [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.person, title: 'About'),
              TabItem(icon: Icons.star, title: 'SoftSkills'),
              TabItem(icon: Icons.memory, title: 'TechSkills'),
            ],
            initialActiveIndex: controller.selectedIndex.value,
            onTap: (int index) {
              controller.changeTabIndex(index);
              _pageController.jumpToPage(index);
            },
          );
        },
      ),
      body: PageView(
        controller: _pageController,
        children: _pages,
      ),
    );
  }
}

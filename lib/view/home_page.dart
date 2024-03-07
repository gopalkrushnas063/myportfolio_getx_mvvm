import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:myportfolio_getx_mvvm/controller/bottom_navigation_controller.dart';
import 'package:myportfolio_getx_mvvm/view/about_view.dart';
import 'package:myportfolio_getx_mvvm/view/certification_view.dart';
import 'package:myportfolio_getx_mvvm/view/home_view.dart';
import 'package:myportfolio_getx_mvvm/view/project_view.dart';

class HomePage extends StatelessWidget {
  final BottomNavigationController _bottomNavigationController =
      Get.put(BottomNavigationController());
  final PageController _pageController = PageController();
  
  final List<Widget> _pages = [
    HomeView(),
    AboutView(),
    ProjectView(),
    CertificationView()
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
              TabItem(icon: Icons.assessment, title: 'Projects'),
              TabItem(icon: Icons.memory, title: 'Certifications'),
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

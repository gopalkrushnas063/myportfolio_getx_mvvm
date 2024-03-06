import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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
      bottomNavigationBar: Obx(() {
        final controller = Get.find<BottomNavigationController>();
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'About',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'SoftSkills',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.memory),
              label: 'TechSkills',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.diagramProject),
              label: 'Project',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: _getSelectedColor(controller.selectedIndex.value),
          onTap: (index) {
            controller.changeTabIndex(index);
            _pageController.jumpToPage(index);
          },
        );
      }),
      body: PageView(
        controller: _pageController,
        children: _pages,
      ),
    );
  }

  Color _getSelectedColor(int index) {
    switch (index) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.green;
      case 2:
        return Colors.red;
      default:
        return Colors.blue;
    }
  }
}

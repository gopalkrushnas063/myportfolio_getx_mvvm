import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildDrawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: const Text('Home'),
          onTap: () {
            Get.back();
          },
        ),
        ListTile(
          title: const Text('About'),
          onTap: () {
            Get.toNamed("/about");
          },
        ),
        ListTile(
          title: const Text('Skill'),
          onTap: () {
            Get.back();
          },
        ),
        ListTile(
          title: const Text('Resume'),
          onTap: () {
            Get.back();
          },
        ),
        ListTile(
          title: const Text('Projects'),
          onTap: () {
            Get.back();
          },
        ),
        ListTile(
          title: const Text('Certifications'),
          onTap: () {
            Get.back();
          },
        ),
        ListTile(
          title: const Text('Contact'),
          onTap: () {
            Get.back();
          },
        ),
      ],
    ),
  );
}

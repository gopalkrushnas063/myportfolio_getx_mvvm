import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          child: Row(
            children: [
              Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          title: const Row(
            children: [
              Icon(Icons.home_outlined),
              SizedBox(width: 10),
              Text('Home'),
            ],
          ),
          onTap: () {
            Get.back();
          },
        ),
        ListTile(
          title: const Row(
            children: [
              Icon(Icons.info_outline),
              SizedBox(width: 10),
              Text('About'),
            ],
          ),
          onTap: () {
            Get.toNamed("/about");
          },
        ),
        ListTile(
          title: const Row(
            children: [
              Icon(Icons.memory_outlined),
              SizedBox(width: 10),
              Text('Skill'),
            ],
          ),
          onTap: () {
            Get.back();
          },
        ),
        ListTile(
          title: const Row(
            children: [
              Icon(Icons.file_present_outlined),
              SizedBox(width: 10),
              Text('Resume'),
            ],
          ),
          onTap: () {
            Get.back();
          },
        ),
        ListTile(
          title: const Row(
            children: [
              FaIcon(
                FontAwesomeIcons.laptopFile,
                size: 20,
              ),
              SizedBox(width: 10),
              Text('Projects'),
            ],
          ),
          onTap: () {
            Get.back();
          },
        ),
        ListTile(
          title: const Row(
            children: [
              Icon(
                FontAwesomeIcons.award,
                size: 20,
              ),
              SizedBox(width: 10),
              Text('Certifications'),
            ],
          ),
          onTap: () {
            Get.back();
          },
        ),
        ListTile(
          title: const Row(
            children: [
              Icon(
                Icons.contact_mail_outlined,
                size: 20,
              ),
              SizedBox(width: 10),
              Text('Contact'),
            ],
          ),
          onTap: () {
            Get.back();
          },
        ),
      ],
    ),
  );
}

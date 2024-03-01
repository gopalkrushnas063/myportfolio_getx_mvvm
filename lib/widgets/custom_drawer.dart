import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.red,
          ),
          child: Center(
              child: Column(
            children: [
              const ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
                child: FaIcon(
                  FontAwesomeIcons.star,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'PortFolio',
                style: GoogleFonts.actor(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 21,
                  ),
                ),
              ),
              Text(
                "My Profile",
                style: GoogleFonts.actor(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          )),
        ),
        ListTile(
          leading: const Icon(
            Icons.home_outlined,
            size: 25,
          ),
          title: Text(
            'Home',
            style: GoogleFonts.actor(
              textStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          onTap: () {
            Get.toNamed("/");
          },
        ),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: Text(
            'About',
            style: GoogleFonts.actor(
              textStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          onTap: () {
            Get.toNamed("/about");
          },
        ),
        ListTile(
          leading: const FaIcon(Icons.memory),
          title: Text(
            'Skill',
            style: GoogleFonts.actor(
              textStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          onTap: () {
            Get.back();
          },
        ),
        ListTile(
          leading: const FaIcon(
            FontAwesomeIcons.award,
            size: 22,
          ),
          title: Text(
            'Certification',
            style: GoogleFonts.actor(
              textStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const FaIcon(FontAwesomeIcons.file),
          title: Text(
            'Resume',
            style: GoogleFonts.actor(
              textStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          onTap: () {},
        ),
      ],
    ),
  );
}

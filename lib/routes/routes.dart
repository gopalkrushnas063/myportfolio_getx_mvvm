import 'package:get/get.dart';
import 'package:myportfolio_getx_mvvm/view/about_view.dart';
import 'package:myportfolio_getx_mvvm/view/home_view.dart';
import 'package:myportfolio_getx_mvvm/view/soft_skill_view.dart';
import 'package:myportfolio_getx_mvvm/view/tech_skill_view.dart';


final allPage = [
  GetPage(name: "/", page: () => HomeView()),
  GetPage(
    name: "/about",
    page: () => AboutView(),
    transition: Transition.circularReveal,
  ),
  GetPage(
    name: "/soft_skill",
    page: () => SoftSkillView(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: "/tech_skill",
    page: () => TechSkillView(),
    transition: Transition.fadeIn,
  ),
];
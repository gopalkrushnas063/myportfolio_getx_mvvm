import 'package:get/get.dart';
import 'package:myportfolio_getx_mvvm/view/about_view.dart';
import 'package:myportfolio_getx_mvvm/view/home_view.dart';


final allPage = [
  GetPage(name: "/", page: () => HomeView()),
  GetPage(
    name: "/about",
    page: () => AboutView(),
    transition: Transition.fadeIn,
  ),
  // GetPage(
  //   name: "/all_cat_news",
  //   page: () => AllCategoryWiseNewsPage(),
  //   transition: Transition.fadeIn,
  // ),
  // GetPage(
  //   name: "/switch_languages",
  //   page: () => SwitchLanguageScreen(),
  //   transition: Transition.fadeIn,
  // ),
  
];
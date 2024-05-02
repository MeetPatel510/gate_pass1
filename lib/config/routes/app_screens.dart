
import 'package:gate_pass/screen/home_page/home_page.dart';
import 'package:gate_pass/screen/login_page/login_page.dart';
import 'package:gate_pass/screen/login_page/select_language.dart';
import 'package:get/get.dart';

import 'app_routes.dart';



class AppScreens {
  static const Duration _duration = Duration(milliseconds: 600);
  static const Transition _transition = Transition.fade;

  static var list = [


    GetPage(
      name: AppRoutes.loginpage,
      transition: _transition,
      page: () =>  LoginPage(),
    ),
    GetPage(
      name: AppRoutes.myhomepage,
      transition: _transition,
      page: () =>  MyHomePage(),
    ),
    GetPage(
      name: AppRoutes.chooselanguage,
      transition: _transition,
      page: () =>  ChooseLanguage(),
    ),
  ];
}

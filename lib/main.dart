
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gate_pass/network/http_helper.dart';
import 'package:gate_pass/test.dart';
import 'package:get/get.dart';

import 'config/routes/app_routes.dart';
import 'config/routes/app_screens.dart';
import 'config/routes/mybinding.dart';
import 'screen/login_page/controller.dart';


late HttpHelper helper = HttpHelper();

Future<void> main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return GetMaterialApp(
      title: 'Gate Pass',
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      getPages: AppScreens.list,
      // home: HomePage(),
      initialRoute: AppRoutes.chooselanguage,
      initialBinding: MyPageBinding(),
      // locale: const Locale('en', 'US'),
    );
  }
}

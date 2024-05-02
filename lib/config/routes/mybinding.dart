import 'package:gate_pass/screen/inpage/controller.dart';
import 'package:gate_pass/screen/login_page/controller.dart';
import 'package:get/get.dart';

import '../../language/controller.dart';


class MyPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LanguageController(), permanent: true);
    Get.put(LoginController(), permanent: true);
    Get.put(VisitorController(), permanent: true);



  }
}

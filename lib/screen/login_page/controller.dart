import 'package:flutter/material.dart';
import 'package:gate_pass/model/user_model.dart';
import 'package:gate_pass/network/api_end_point.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/routes/app_routes.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final String apiUrl = (baseUrl + adminLoginAPI);
    final response = await http.post(Uri.parse(apiUrl), body: {
      "user_email": emailController.text,
      "password": passwordController.text,
    });

    if (response.statusCode == 200) {
      final userDetails = userDetailsFromJson(response.body);
      final token = userDetails.data.token;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      await prefs.setString('email', emailController.text);
      await prefs.setString('password', passwordController.text);

      Get.offAllNamed(AppRoutes.myhomepage); // Navigate to the Home page
    } else {
      print("Failed to login: ${response.reasonPhrase}");
      Get.snackbar(
        "Error",
        "Failed to login: ${response.reasonPhrase}",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final String? email = prefs.getString('email');
    final String? password = prefs.getString('password');

    if (token != null && email != null && password != null) {
      Get.offAllNamed(AppRoutes.myhomepage);
    } else {
      Get.offAllNamed(AppRoutes.loginpage);
    }
  }
}

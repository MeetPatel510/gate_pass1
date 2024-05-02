import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gate_pass/language/controller.dart';
import 'package:gate_pass/screen/login_page/controller.dart';
import 'package:gate_pass/widget/b.dart';
import 'package:get/get.dart';
import 'package:gate_pass/config/routes/app_routes.dart';

class ChooseLanguage extends StatelessWidget {
  final LanguageController _languageController = Get.put(LanguageController());
  final LoginController loginController = Get.put(LoginController());

  String selectedLanguage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Language')),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'WELCOME',
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: '..!!',
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.blue,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Language Selection",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(width: 10,),
                  Image.asset('assets/images/world.png', width: 30, height: 30),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildLanguageContainer('en', 'united-kingdom', 'English'),
                buildLanguageContainer('hi', 'india', 'Hindi'),
                buildLanguageContainer('gu', 'india', 'Gujrati'),
              ],
            ), SizedBox(height: 10),
            Divider(
              color: Colors.blue,
            ),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  UnicornOutlineButton(
                strokeWidth: 4,
                radius: 16,
                gradient: LinearGradient(colors: [Colors.blueAccent, Colors.green],begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,),
                child: Text("Next", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                onPressed: () async{
                  if (selectedLanguage.isNotEmpty) {
                    _languageController.changeLanguage(selectedLanguage);
                    await loginController.checkLoginStatus();
                  } else {
                    Get.snackbar(
                      'Error',
                      'Please select any language',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLanguageContainer(String languageCode, String flagImage, String languageName) {
    return InkWell(
      onTap: () {
        selectedLanguage = languageCode;
        Get.forceAppUpdate();
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: selectedLanguage == languageCode ? Colors.blue : Colors.white),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/$flagImage.png', width: 64, height: 64), // Replace 'flag_english.png' with the path to your English flag image
            SizedBox(height: 10),
            Text(languageName),
          ],
        ),
      ),
    );
  }
}

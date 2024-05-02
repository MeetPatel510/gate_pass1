import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gate_pass/language/controller.dart';
import 'package:gate_pass/screen/login_page/controller.dart';
import 'package:gate_pass/widget/b.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = Get.find<LoginController>();
  final LanguageController languageController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: _buildContent(context),
          ),
        ),resizeToAvoidBottomInset:false
    );
  }

  Widget _buildContent(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return isMobile
        ? Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildLogoWidget(),
        SizedBox(height: 20),
        _buildResponsiveTextFormFields(context),
        SizedBox(height: 260),



        UnicornOutlineButton(
          strokeWidth: 4,
          radius: 16,
          gradient: LinearGradient(colors: [Colors.blueAccent, Colors.green],begin: Alignment.topCenter,
            end: Alignment.bottomCenter,),
          child: Text(languageController.getTranslatedValue("Login"), style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          onPressed: () {
            _controller.login();
          },        ),










        SizedBox(height: 10),
      ],
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogoWidget(),
              SizedBox(height: 20),




              SizedBox(height: 10),
            ],
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: _buildResponsiveTextFormFields(context),
        ),
      ],
    );
  }

  Widget _buildLogoWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 150, // Adjust width according to your logo size
          height: 150, // Adjust height according to your logo size
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue, // Example color, replace with your logo
          ),
          child: Center(
            child: Text(
              'Get Pass',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),

      ],
    );
  }


  Widget _buildResponsiveTextFormFields(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      // child: Form(
      //   key: _controller.loginFormKey,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         'Mobile Number',
      //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //       ),
      //       SizedBox(height: 10),
      //       TextFormField(
      //         decoration: InputDecoration(
      //           hintText: 'Contact No',
      //           filled: true,
      //           border: OutlineInputBorder(),
      //         ),
      //         inputFormatters: [
      //           FilteringTextInputFormatter.digitsOnly,
      //           LengthLimitingTextInputFormatter(10),
      //         ],
      //         keyboardType: TextInputType.number,
      //
      //         onChanged: _controller.updateMobileNumber,
      //       ),
      //       SizedBox(height: 20),
      //       Text(
      //         'Password',
      //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //       ),
      //       SizedBox(height: 10),
      //       TextFormField(
      //         keyboardType: TextInputType.text,
      //         obscureText: true,
      //         decoration: InputDecoration(
      //           labelText: 'Password',                filled: true,
      //
      //           border: OutlineInputBorder(),
      //         ),
      //
      //
      //         onChanged: _controller.updatePassword,
      //       ),
      //
      //     ],
      //   ),
      // ),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ), SizedBox(height: 10,),
            TextFormField(
              controller: _controller.emailController,
              decoration: const InputDecoration(
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.person, color: Colors.black),
                  border: OutlineInputBorder()
              ),
              cursorColor: Colors.black,
              style: const TextStyle(color: Colors.black),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Username.';
                }
                return null;
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _controller.passwordController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(color: Colors.black),
                prefixIcon: const Icon(Icons.password, color: Colors.black),
                border: OutlineInputBorder(),

              ),
              style: const TextStyle(color: Colors.black),
              obscureText: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Password.';
                }
                return null;
              },
            ),
            const SizedBox(height: 5),

          ],
        ),

      ),
    );
  }}

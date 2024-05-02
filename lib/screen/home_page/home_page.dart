import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gate_pass/config/routes/app_routes.dart';
import 'package:gate_pass/constants/colors.dart';
import 'package:gate_pass/language/controller.dart';
import 'package:gate_pass/screen/inpage/in_page.dart';
import 'package:gate_pass/screen/outpage/out_page.dart';
import 'package:gate_pass/widget/b.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final LanguageController languageController = Get.find<LanguageController>();

  bool? _showInPage; // Change the type to bool?

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gate Pass'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.chooselanguage);
                },
                icon: Icon(Icons.logout)),
          )
        ],
      ),
      body: Column(
        children: [

          Expanded(
            child: Container(
              child: _showInPage == null || _showInPage!
                  ? InPage() // Show InPage if _showInPage is null or true
                  : OutPage(), // Show OutPage if _showInPage is false
            ),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:


                  Container(
                    child:OutlinedButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(BorderSide(color: CommonConstants.downPaymentColor)), // Gradient border
                        backgroundColor: _showInPage == true || _showInPage == null ? MaterialStateProperty.all(CommonConstants.downPaymentColor) : MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        setState(() {
                          _showInPage = true;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "In",
                            // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _showInPage == true ? Colors.white : Colors.black),
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:_showInPage == true || _showInPage == null ? Colors.white : Colors.black),
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.input_rounded, size: 25,  color:_showInPage == true || _showInPage == null ? Colors.white : Colors.black),
                        ],
                      ),
                    ),

                  ),

                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: OutlinedButton(
                      style: ButtonStyle(

                        side: MaterialStateProperty.all(BorderSide(color: CommonConstants.primarygradient1)),
                        // Gradient border
                        backgroundColor: _showInPage==false ? MaterialStateProperty.all(CommonConstants.primarygradient1) : MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        setState(() {
                          _showInPage = false;

                        });
                      },
                      child: Row(     mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Out",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _showInPage==false ? Colors.white : Colors.black),
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.output_rounded, size: 25, color: _showInPage==false ? Colors.white : Colors.black),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}


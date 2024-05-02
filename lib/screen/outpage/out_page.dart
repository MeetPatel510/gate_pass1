import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gate_pass/constants/colors.dart';
import 'package:gate_pass/language/controller.dart';
import 'package:gate_pass/widget/b.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';

class OutPage extends StatelessWidget {
  final LanguageController languageController = Get.find<LanguageController>();

  final TextEditingController gatePassController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();

  final RxBool showCard = false.obs;

  void _onOkPressed() {
    if (contactNoController.text.length == 10) {
      showCard.value = true;
    } else {
      Get.snackbar('Error', 'Contact number is required.',colorText: Colors.white,backgroundColor:CommonConstants.downPaymentColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonConstants.primarygradient1, // Set background color to light blue
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    languageController.getTranslatedValue("(OUT) Gate Pass No"),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    ' : 02',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(languageController.getTranslatedValue("Mobile Number"),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: contactNoController,
                      decoration: InputDecoration(
                        // labelText: 'Contact No',
                        fillColor: Colors.white,
                        hintText: "Contact No",
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Contact number is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Container(
                    height: 50,
                    width: 70,
                    child: UnicornOutlineButton(
                      strokeWidth: 4,
                      radius: 16,
                      gradient: LinearGradient(colors: [Colors.black, Colors.black],begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,),
                      child: Text(languageController.getTranslatedValue("Ok"), style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                      onPressed:_onOkPressed
                    ),
                  ),

                ],
              ),
              Obx(() {
                if (showCard.value) {
                  return Column(
                    children: [
                      CardWidget(),
                    ],
                  );
                } else {
                  return SizedBox();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final LanguageController languageController = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    // This is a placeholder card widget
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ABC123'),
                      SizedBox(height: 10), Text('Vehicle Number: ABC123'),
                      SizedBox(height: 10),
                      Text('Date: April 25, 2024'),
                      // Add additional vehicle details here
                    ],
                  ),
                ),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(

                              image: DecorationImage(
                                image: AssetImage(
                                    AssetImageOrIcon.PlasticbagImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            "05",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(

                              image: DecorationImage(
                                image: AssetImage(AssetImageOrIcon.CbagImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            "15",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),       Divider(                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(

                              image: DecorationImage(
                                image: AssetImage(AssetImageOrIcon.BoxImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            "04",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),       Divider(                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(

                              image: DecorationImage(
                                image:
                                    AssetImage(AssetImageOrIcon.CarrateImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            "08",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),       Divider(                      thickness: 2,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Remarks',
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      elevation: 4, // Set the elevation for the shadow effect
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50), // Same radius as your UnicornOutlineButton
                      ),
                      child: UnicornOutlineButton(
                        strokeWidth: 2,
                        radius: 50,
                        gradient: LinearGradient(
                          colors: [Colors.black, Colors.black],
                          begin: Alignment.topRight,
                          end: Alignment.bottomCenter,
                        ),
                        child: Row(
                          children: [
                            Text(
                              languageController.getTranslatedValue("Accepet"),
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.done_outlined, color: Colors.black, size: 25),
                          ],
                        ),
                        onPressed: () {
                        },
                      ),
                    ),
                    Material(
                      elevation: 4, // Set the elevation for the shadow effect
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50), // Same radius as your UnicornOutlineButton
                      ),
                      child: UnicornOutlineButton(
                        strokeWidth: 2,
                        radius: 50,
                        gradient: LinearGradient(
                          colors: [Colors.black, Colors.black],
                          begin: Alignment.topRight,
                          end: Alignment.bottomCenter,
                        ),
                        child: Row(
                          children: [
                            Text(
                              languageController.getTranslatedValue("Reject"),
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.close_rounded, color: Colors.black, size: 25),
                          ],
                        ),
                        onPressed: () {
                        },
                      ),
                    )




                  ],
                )),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gate_pass/constants/assets.dart';
import 'package:gate_pass/constants/colors.dart';
import 'package:gate_pass/language/controller.dart';
import 'package:gate_pass/screen/inpage/controller.dart';
import 'package:gate_pass/widget/b.dart';
import 'package:get/get.dart';

class InPage extends StatelessWidget {
  final LanguageController languageController = Get.find<LanguageController>();

  final VisitorController visitorController = Get.find<VisitorController>();


  final TextEditingController contactNoController = TextEditingController();

  final RxBool showCard = false.obs;

  void _onOkPressed() async {
    if (contactNoController.text.length == 10) {
      await visitorController.fetchData(contactNoController.text);

      if (visitorController.visitorData.value.id != null) {
        showCard.value = true;
      } else {
        Get.snackbar('Error', 'User not found', colorText: Colors.white, backgroundColor: CommonConstants.primarygradient1);
      }
    } else {
      showCard.value = false;
      Get.snackbar('Error', 'Contact number must be 10 characters long.', colorText: Colors.white, backgroundColor: CommonConstants.primarygradient1);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonConstants.downPaymentColor,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    languageController.getTranslatedValue("(IN) Gate Pass No"),
                    style: TextStyle(
                      color: CommonConstants.textcolor,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    ' : 02',
                    style: TextStyle(
                      color: CommonConstants.textcolor,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(languageController.getTranslatedValue("Mobile Number"),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: CommonConstants.textcolor),),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: contactNoController,
                      decoration: InputDecoration(
                        // labelText: 'Contact No',
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
                      gradient: LinearGradient(colors: [Colors.black, Colors.black],begin: Alignment.topRight,
                        end: Alignment.bottomCenter,),
                      child: Text(languageController.getTranslatedValue("Ok"), style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: CommonConstants.textcolor)),
                      onPressed: _onOkPressed,
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
                      Row(
                        children: [
                          Text('Name'),
                          SizedBox(width: 75,),
                          SizedBox(
                            width: 190,
                            height: 50,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Enter Name',                        filled: true,

                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text('Vehicle Number'),SizedBox(width: 10,),
                          SizedBox(
                            height: 50,
                            width: 190,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Enter Vehical Number',                        filled: true,

                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text('Date'),SizedBox(width: 80,),
                          SizedBox(
                            height: 50,
                            width: 190,
                            child:Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black45,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  "14/5/2024",style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            )

                          ),

                        ],
                      ),
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
                                image:
                                    AssetImage(AssetImageOrIcon.PlasticbagImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: '00',                        filled: true,


                                  border: OutlineInputBorder(),

                                ),              keyboardType: TextInputType.number,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ), Divider(
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
                          SizedBox(
                            width: 25,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: '00',filled: true,
                                  border: OutlineInputBorder(),
                                ),              keyboardType: TextInputType.number,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ), Divider(
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
                                image: AssetImage(AssetImageOrIcon.BoxImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: '00',filled: true,
                                  border: OutlineInputBorder(),
                                ),              keyboardType: TextInputType.number,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ), Divider(
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
                                image: AssetImage(AssetImageOrIcon.CarrateImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: '00',filled: true,
                                  border: OutlineInputBorder(),
                                ),              keyboardType: TextInputType.number,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ), Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Remarks',
                        fillColor: CommonConstants.textcolor,
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
                              languageController.getTranslatedValue("Save"),
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
                              languageController.getTranslatedValue("Reset"),
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.close_rounded, color: Colors.black, size: 25),
                          ],
                        ),
                        onPressed: () {
                          // Add your onPressed functionality here
                        },
                      ),
                    )


                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}

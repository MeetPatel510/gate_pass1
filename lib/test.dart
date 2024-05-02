import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/inpage/controller.dart';

class VisitorPage extends StatelessWidget {
  final visitorController = Get.put(VisitorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visitor Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter Visitor Number'),
              keyboardType: TextInputType.phone,
              maxLength: 10,
              onChanged: (value) {
                // You can add validation logic here if needed
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String visitorPhone =
                    visitorController.visitorNameController.text;
                if (visitorPhone.length == 10) {
                  visitorController.fetchData(visitorPhone);
                } else {
                  Get.snackbar('Error', 'Please enter a valid 10-digit number');
                }
              },
              child: Text('Check'),
            ),
            SizedBox(height: 20),
            Obx(() {
              if (visitorController.visitorData.value.id != null) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: visitorController.visitorNameController,
                          decoration: InputDecoration(labelText: 'Visitor Name'),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: visitorController.vehicleNoController,
                          decoration: InputDecoration(labelText: 'Vehicle Number'),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return SizedBox(); // Return an empty container if data is not available yet
              }
            }),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gate_pass/model/contact_details.dart';
import 'package:gate_pass/network/http_helper.dart';
import 'package:get/get.dart';

class VisitorController extends GetxController {
  var visitorNameController = TextEditingController();
  var vehicleNoController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();

  var visitorData = Data(
    id: 0,
    visitorPhone: '',
    visitorName: '',
    vehicleNo: '',
    status: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ).obs;

  Future<void> fetchData(String visitorPhone) async {
    final data = await HttpHelper.fetchVisitorData(visitorPhone);
    if (data != null) {
      visitorData.value = data;
      visitorNameController.text = visitorData.value.visitorName;
      vehicleNoController.text = visitorData.value.vehicleNo;
    } else {
      Get.snackbar('Error', 'User not found');
    }
  }
}

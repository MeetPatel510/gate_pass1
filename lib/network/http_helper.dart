// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/contact_details.dart';
import 'api_end_point.dart';

class HttpHelper {
  static HttpHelper instance = HttpHelper._();


  factory HttpHelper() {
    return instance;
  }

  HttpHelper._();

  static final String baseUrl = 'http://192.168.1.3:3000/api';
  static final String authToken =
      'Bearer eyJhbGciOiJIUzI1NiJ9.ZGVtb0BnbWFpbC5jb20.TYvANvZ3mA4XJDByMtC7IS0m4b5S4rCqXvfsPL-X2YU';

  static Future<Data?> fetchVisitorData(String visitorPhone) async {
    final url = Uri.parse('$baseUrl/visitor');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json', 'Authorization': authToken},
      body: json.encode({'visitor_phone': visitorPhone}),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return Data.fromJson(responseData);
    } else {
      return null;
    }
  }

}

// To parse this JSON data, do
//
//     final contactDetails = contactDetailsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';



class Data {
  final int id;
  final String visitorPhone;
  final String visitorName;
  final String vehicleNo;
  final bool status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.id,
    required this.visitorPhone,
    required this.visitorName,
    required this.vehicleNo,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    visitorPhone: json["visitor_phone"],
    visitorName: json["visitor_name"],
    vehicleNo: json["vehicle_no"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "visitor_phone": visitorPhone,
    "visitor_name": visitorName,
    "vehicle_no": vehicleNo,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserDetails userDetailsFromJson(String str) => UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  final Data data;

  UserDetails({
    required this.data,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  final String token;
  final User user;

  Data({
    required this.token,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user.toJson(),
  };
}

class User {
  final int id;
  final String userName;
  final String userEmail;

  User({
    required this.id,
    required this.userName,
    required this.userEmail,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    userName: json["user_name"],
    userEmail: json["user_email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_name": userName,
    "user_email": userEmail,
  };
}

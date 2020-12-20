// To parse this JSON data, do
//
//     final signUpResponse = signUpResponseFromJson(jsonString);

import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) =>
    SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
  SignUpResponse({
    this.code,
    this.message,
    this.data,
  });

  String code;
  String message;
  Data data;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.fullName,
    this.username,
    this.email,
    this.password,
    this.role,
    this.updatedAt,
    this.createdAt,
  });

  int id;
  String fullName;
  String username;
  String email;
  String password;
  String role;
  DateTime updatedAt;
  DateTime createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        fullName: json["full_name"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "username": username,
        "email": email,
        "password": password,
        "role": role,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.code,
    this.message,
    this.data,
  });

  String code;
  String message;
  Login data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        code: json["code"],
        message: json["message"],
        data: Login.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class Login {
  Login({
    this.token,
  });

  String token;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

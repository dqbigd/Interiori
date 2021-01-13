// To parse this JSON data, do
//
//     final designerResponse = designerResponseFromJson(jsonString);

import 'dart:convert';

DesignerResponse designerResponseFromJson(String str) =>
    DesignerResponse.fromJson(json.decode(str));

String designerResponseToJson(DesignerResponse data) =>
    json.encode(data.toJson());

class DesignerResponse {
  DesignerResponse({
    this.code,
    this.message,
    this.data,
  });

  String code;
  String message;
  List<DesignerData> data;

  factory DesignerResponse.fromJson(Map<String, dynamic> json) =>
      DesignerResponse(
        code: json["code"],
        message: json["message"],
        data: List<DesignerData>.from(
            json["data"].map((x) => DesignerData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DesignerData {
  DesignerData({
    this.id,
    this.username,
    this.fullName,
    this.email,
    this.password,
    this.role,
    this.chatId,
    this.crId,
    this.token,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String username;
  String fullName;
  String email;
  String password;
  String role;
  dynamic chatId;
  dynamic crId;
  String token;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  factory DesignerData.fromJson(Map<String, dynamic> json) => DesignerData(
        id: json["id"],
        username: json["username"],
        fullName: json["full_name"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        chatId: json["chat_id"],
        crId: json["cr_id"],
        token: json["token"] == null ? null : json["token"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "full_name": fullName,
        "email": email,
        "password": password,
        "role": role,
        "chat_id": chatId,
        "cr_id": crId,
        "token": token == null ? null : token,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

DesignerDetailResponse designerDetailResponseFromJson(String str) =>
    DesignerDetailResponse.fromJson(json.decode(str));

String designerDetailResponseToJson(DesignerDetailResponse data) =>
    json.encode(data.toJson());

class DesignerDetailResponse {
  DesignerDetailResponse({
    this.code,
    this.message,
    this.data,
  });

  String code;
  String message;
  DesignerDetailData data;

  factory DesignerDetailResponse.fromJson(Map<String, dynamic> json) =>
      DesignerDetailResponse(
        code: json["code"],
        message: json["message"],
        data: DesignerDetailData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class DesignerDetailData {
  DesignerDetailData({
    this.id,
    this.username,
    this.fullName,
    this.email,
    this.password,
    this.role,
    this.chatId,
    this.crId,
    this.token,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String username;
  String fullName;
  String email;
  String password;
  String role;
  dynamic chatId;
  dynamic crId;
  dynamic token;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  factory DesignerDetailData.fromJson(Map<String, dynamic> json) =>
      DesignerDetailData(
        id: json["id"],
        username: json["username"],
        fullName: json["full_name"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        chatId: json["chat_id"],
        crId: json["cr_id"],
        token: json["token"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "full_name": fullName,
        "email": email,
        "password": password,
        "role": role,
        "chat_id": chatId,
        "cr_id": crId,
        "token": token,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

DesignerDetailPostResponse designerDetailPostResponseFromJson(String str) =>
    DesignerDetailPostResponse.fromJson(json.decode(str));

String designerDetailPostResponseToJson(DesignerDetailPostResponse data) =>
    json.encode(data.toJson());

class DesignerDetailPostResponse {
  DesignerDetailPostResponse({
    this.code,
    this.message,
    this.data,
  });

  String code;
  String message;
  List<DesignerDetailPostData> data;

  factory DesignerDetailPostResponse.fromJson(Map<String, dynamic> json) =>
      DesignerDetailPostResponse(
        code: json["code"],
        message: json["message"],
        data: List<DesignerDetailPostData>.from(
            json["data"].map((x) => DesignerDetailPostData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DesignerDetailPostData {
  DesignerDetailPostData({
    this.id,
    this.userId,
    this.name,
    this.category,
    this.image,
    this.description,
    this.vote,
    this.saved,
    this.rate,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  String name;
  String category;
  String image;
  String description;
  int vote;
  int saved;
  double rate;
  DateTime createdAt;
  DateTime updatedAt;

  factory DesignerDetailPostData.fromJson(Map<String, dynamic> json) =>
      DesignerDetailPostData(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        category: json["category"],
        image: json["image"],
        description: json["description"],
        vote: json["vote"],
        saved: json["saved"],
        rate: json["rate"].toDouble(),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "category": category,
        "image": image,
        "description": description,
        "vote": vote,
        "saved": saved,
        "rate": rate,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

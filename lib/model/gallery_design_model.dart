// To parse this JSON data, do
//
//     final galleryDesignResponse = galleryDesignResponseFromJson(jsonString);

import 'dart:convert';

GalleryDesignResponse galleryDesignResponseFromJson(String str) =>
    GalleryDesignResponse.fromJson(json.decode(str));

String galleryDesignResponseToJson(GalleryDesignResponse data) =>
    json.encode(data.toJson());

class GalleryDesignResponse {
  GalleryDesignResponse({
    this.code,
    this.message,
    this.data,
  });

  String code;
  String message;
  List<GalleryDesignData> data;

  factory GalleryDesignResponse.fromJson(Map<String, dynamic> json) =>
      GalleryDesignResponse(
        code: json["code"],
        message: json["message"],
        data: List<GalleryDesignData>.from(
            json["data"].map((x) => GalleryDesignData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GalleryDesignData {
  GalleryDesignData({
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

  factory GalleryDesignData.fromJson(Map<String, dynamic> json) =>
      GalleryDesignData(
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

GalleryDesignDetailResponse galleryDesignDetailResponseFromJson(String str) =>
    GalleryDesignDetailResponse.fromJson(json.decode(str));

String galleryDesignDetailResponseToJson(GalleryDesignDetailResponse data) =>
    json.encode(data.toJson());

class GalleryDesignDetailResponse {
  GalleryDesignDetailResponse({
    this.code,
    this.message,
    this.data,
  });

  String code;
  String message;
  GalleryDesignDetailData data;

  factory GalleryDesignDetailResponse.fromJson(Map<String, dynamic> json) =>
      GalleryDesignDetailResponse(
        code: json["code"],
        message: json["message"],
        data: GalleryDesignDetailData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class GalleryDesignDetailData {
  GalleryDesignDetailData({
    this.id,
    this.userId,
    this.name,
    this.category,
    this.image,
    this.description,
    this.vote,
    this.saved,
    this.rate,
    this.linkWa,
    this.linkSkype,
    this.linkEmail,
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
  String linkWa;
  String linkSkype;
  String linkEmail;
  DateTime createdAt;
  DateTime updatedAt;

  factory GalleryDesignDetailData.fromJson(Map<String, dynamic> json) =>
      GalleryDesignDetailData(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        category: json["category"],
        image: json["image"],
        description: json["description"],
        vote: json["vote"],
        saved: json["saved"],
        rate: json["rate"].toDouble(),
        linkWa: json["link_wa"],
        linkSkype: json["link_skype"],
        linkEmail: json["link_email"],
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
        "link_wa": linkWa,
        "link_skype": linkSkype,
        "link_email": linkEmail,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

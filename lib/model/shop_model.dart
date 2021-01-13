// To parse this JSON data, do
//
//     final shopResponse = shopResponseFromJson(jsonString);

import 'dart:convert';

ShopResponse shopResponseFromJson(String str) =>
    ShopResponse.fromJson(json.decode(str));

String shopResponseToJson(ShopResponse data) => json.encode(data.toJson());

class ShopResponse {
  ShopResponse({
    this.code,
    this.message,
    this.data,
  });

  String code;
  String message;
  List<ShopData> data;

  factory ShopResponse.fromJson(Map<String, dynamic> json) => ShopResponse(
        code: json["code"],
        message: json["message"],
        data:
            List<ShopData>.from(json["data"].map((x) => ShopData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ShopData {
  ShopData({
    this.id,
    this.name,
    this.price,
    this.shopLink,
    this.shopLogo,
    this.shopName,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String price;
  String shopLink;
  String shopLogo;
  String shopName;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  factory ShopData.fromJson(Map<String, dynamic> json) => ShopData(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        shopLink: json["shop_link"],
        shopLogo: json["shop_logo"],
        shopName: json["shop_name"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "shop_link": shopLink,
        "shop_logo": shopLogo,
        "shop_name": shopName,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

import 'dart:convert';

List<SafeAndSecureDataModel> safeAndSecureItemFromJson(String str) =>
    List<SafeAndSecureDataModel>.from(
        json.decode(str).map((x) => SafeAndSecureDataModel.fromJson(x)));

String safeAndSecureItemToJson(List<SafeAndSecureDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SafeAndSecureDataModel {
  SafeAndSecureDataModel({
    required this.imageUrlSafeAndSecure,
  });

  String imageUrlSafeAndSecure;

  factory SafeAndSecureDataModel.fromJson(Map<String, dynamic> json) =>
      SafeAndSecureDataModel(
        imageUrlSafeAndSecure: json["imageUrlSafeAndSecure"],
      );

  Map<String, dynamic> toJson() => {
    "imageUrlSafeAndSecure": imageUrlSafeAndSecure,
  };
}

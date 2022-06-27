import 'dart:convert';

List<StoredItemModel> storedItemFromJson(String str) =>
    List<StoredItemModel>.from(
        json.decode(str).map((x) => StoredItemModel.fromJson(x)));

String storedItemToJson(List<StoredItemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoredItemModel {
  StoredItemModel({
    required this.imageUrlStoredItem,
  });

  String imageUrlStoredItem;

  factory StoredItemModel.fromJson(Map<String, dynamic> json) =>
      StoredItemModel(
        imageUrlStoredItem: json["imageUrlStoredItem"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrlStoredItem": imageUrlStoredItem,
      };
}

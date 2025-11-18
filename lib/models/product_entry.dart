// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String id;
  String name;
  int price;
  String description;
  String thumbnail;
  bool isFeatured;
  String brand;
  String availableSizes;
  int productViews;
  int userId;

  ProductEntry({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.isFeatured,
    required this.brand,
    required this.availableSizes,
    required this.productViews,
    required this.userId,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    thumbnail: json["thumbnail"],
    isFeatured: json["is_featured"],
    brand: json["brand"],
    availableSizes: json["available_sizes"],
    productViews: json["product_views"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
    "thumbnail": thumbnail,
    "is_featured": isFeatured,
    "brand": brand,
    "available_sizes": availableSizes,
    "product_views": productViews,
    "user_id": userId,
  };
}

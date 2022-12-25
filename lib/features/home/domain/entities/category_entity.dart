import 'package:equatable/equatable.dart';
import 'dart:convert';

CategoryEntity categoryEntityFromJson(String str) =>
    CategoryEntity.fromJson(json.decode(str));

String categoryEntityToJson(CategoryEntity data) => json.encode(data.toJson());

class CategoryEntity extends Equatable {
  final bool status;
  final Data data;

  const CategoryEntity({
    required this.status,
    required this.data,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) => CategoryEntity(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };

  @override
  List<Object?> get props => [status, data];
}

class Data {
  int currentPage;
  List<Category> data;

  Data({
    required this.currentPage,
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data:
            List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Category {
  final int id;
  final String name;
  final String image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}

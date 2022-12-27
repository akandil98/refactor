import 'package:equatable/equatable.dart';

class SearchEntity extends Equatable {
  final bool status;
  final Data data;

  const SearchEntity({required this.status, required this.data});

  factory SearchEntity.fromJson(Map<String, dynamic> json) => SearchEntity(
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
  final List<Datum> data;

  Data({
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final int id;
  final double price;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  Datum({
    required this.id,
    required this.price,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        price: json["price"].toDouble(),
        image: json["image"],
        name: json["name"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        inFavorites: json["in_favorites"],
        inCart: json["in_cart"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "image": image,
        "name": name,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "in_favorites": inFavorites,
        "in_cart": inCart,
      };
}

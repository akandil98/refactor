import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;
  final bool inFavorites;
  final bool inCart;
  final List<String> images;

  const ProductEntity({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.inFavorites,
    required this.inCart,
    required this.images,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) => ProductEntity(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
        inFavorites: json["in_favorites"],
        inCart: json["in_cart"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "old_price": oldPrice,
        "discount": discount,
        "image": image,
        "name": name,
        "description": description,
        "in_favorites": inFavorites,
        "in_cart": inCart,
        "images": List<dynamic>.from(images.map((x) => x)),
      };

  @override
  List<Object?> get props => [
        id,
        price,
        oldPrice,
        discount,
        image,
        name,
        description,
        inFavorites,
        inCart,
        images,
      ];
}

import 'package:equatable/equatable.dart';

class FavouriteProductEntity extends Equatable {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;

  const FavouriteProductEntity({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory FavouriteProductEntity.fromJson(Map<String, dynamic> json) =>
      FavouriteProductEntity(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "old_price": oldPrice,
        "discount": discount,
        "image": image,
        "name": name,
        "description": description,
      };
  @override
  List<Object?> get props =>
      [id, price, oldPrice, discount, image, name, description];
}

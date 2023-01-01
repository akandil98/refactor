import 'package:equatable/equatable.dart';

class ChangeFavouriteEntity extends Equatable {
  final int id;
  final ChangeFavouriteProductEntity changeFavouriteProductEntity;
  const ChangeFavouriteEntity({
    required this.id,
    required this.changeFavouriteProductEntity,
  });

  factory ChangeFavouriteEntity.fromJson(Map<String, dynamic> json) =>
      ChangeFavouriteEntity(
        id: json["id"],
        changeFavouriteProductEntity:
            ChangeFavouriteProductEntity.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": changeFavouriteProductEntity.toJson(),
      };

  @override
  List<Object?> get props => [id, changeFavouriteProductEntity];
}

class ChangeFavouriteProductEntity extends Equatable {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;

  const ChangeFavouriteProductEntity({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  factory ChangeFavouriteProductEntity.fromJson(Map<String, dynamic> json) =>
      ChangeFavouriteProductEntity(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "old_price": oldPrice,
        "discount": discount,
        "image": image,
      };

  @override
  List<Object?> get props => [id, price, oldPrice, discount, image];
}

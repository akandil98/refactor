import 'package:equatable/equatable.dart';

class FavouriteEntity extends Equatable {
  final bool status;
  final Data data;

  const FavouriteEntity({required this.status, required this.data});

  factory FavouriteEntity.fromJson(Map<String, dynamic> json) =>
      FavouriteEntity(
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
  final List<Favourite> data;

  Data({
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: List<Favourite>.from(
            json["data"].map((x) => Favourite.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Favourite {
  final int id;
  final FavouriteProductItem favouriteProductItem;
  Favourite({
    required this.id,
    required this.favouriteProductItem,
  });

  factory Favourite.fromJson(Map<String, dynamic> json) => Favourite(
        id: json["id"],
        favouriteProductItem: FavouriteProductItem.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": favouriteProductItem.toJson(),
      };
}

class FavouriteProductItem {
  final int id;
  final double price;
  final double oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;

  FavouriteProductItem({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory FavouriteProductItem.fromJson(Map<String, dynamic> json) =>
      FavouriteProductItem(
        id: json["id"],
        price: json["price"].toDouble(),
        oldPrice: json["old_price"].toDouble(),
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
}

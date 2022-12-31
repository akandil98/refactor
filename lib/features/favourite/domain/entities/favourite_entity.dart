import 'package:equatable/equatable.dart';
import 'package:refactor/features/favourite/domain/entities/favourite_product_entity.dart';

class FavouriteEntity extends Equatable {
  final int id;
  final FavouriteProductEntity favouriteProductEntity;

  const FavouriteEntity({
    required this.id,
    required this.favouriteProductEntity,
  });

  factory FavouriteEntity.fromJson(Map<String, dynamic> json) =>
      FavouriteEntity(
        id: json["id"],
        favouriteProductEntity:
            FavouriteProductEntity.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": favouriteProductEntity.toJson(),
      };
  @override
  List<Object?> get props => [id, favouriteProductEntity];
}

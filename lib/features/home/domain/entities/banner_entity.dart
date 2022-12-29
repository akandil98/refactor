import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final int id;
  final String image;

  const BannerEntity({
    required this.id,
    required this.image,
  });

  factory BannerEntity.fromJson(Map<String, dynamic> json) => BannerEntity(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };

  @override
  List<Object?> get props => [id, image];
}

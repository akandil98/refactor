class BannerEntity {
  final int id;
  final String image;

  BannerEntity({
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
}

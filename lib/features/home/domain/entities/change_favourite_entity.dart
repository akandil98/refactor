import 'package:equatable/equatable.dart';

class ChangeFavouriteEntity extends Equatable {
  final bool status;
  final String message;

  const ChangeFavouriteEntity({
    required this.status,
    required this.message,
  });

  factory ChangeFavouriteEntity.fromJson(Map<String, dynamic> json) =>
      ChangeFavouriteEntity(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };

  @override
  List<Object?> get props => [status, message];
}

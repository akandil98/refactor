import 'package:equatable/equatable.dart';
import 'package:refactor/features/auth/domain/entities/user_entity.dart';

class TokenEntity extends Equatable {
  final String token;
  Data? data;

  TokenEntity({
    required this.token,
  });

  factory TokenEntity.fromJson(Map<String, dynamic> json) {
    return TokenEntity(
      token: Data.fromJson(json['data']).token,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }

  @override
  List<Object?> get props => [token];
}

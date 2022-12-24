import 'package:equatable/equatable.dart';

class TokenEntity extends Equatable {
  // TODO fix this String?
  final String? token;

  const TokenEntity({required this.token});

  factory TokenEntity.fromJson(Map<String, dynamic> json) {
    return TokenEntity(
      token: json['token'],
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

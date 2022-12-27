import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final bool status;

  final Data data;
  const UserEntity({
    required this.status,
    required this.data,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        status: json['status'],
        data: Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data.toJson(),
      };

  @override
  List<Object?> get props => [status, data];
}

class Data {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String? image;
  final int? points;
  final int? credit;
  final String token;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.image,
    this.points,
    this.credit,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        image: json['image'],
        points: json['points'],
        credit: json['credit'],
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'image': image,
        'points': points,
        'credit': credit,
        'token': token,
      };
}

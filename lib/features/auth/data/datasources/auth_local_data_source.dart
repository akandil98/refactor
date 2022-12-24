import 'package:refactor/core/error/exceptions.dart';
import 'package:refactor/features/auth/domain/entities/token_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheToken(TokenEntity token);
  Future<String> getToken();
  Future<void> deleteToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheToken(TokenEntity token) {
    // TODO fix this ?? ''
    return sharedPreferences.setString('token', token.token ?? '');
  }

  @override
  Future<void> deleteToken() {
    return sharedPreferences.remove('token');
  }

  @override
  Future<String> getToken() async {
    final token = sharedPreferences.getString('token');
    if (token != null) {
      return token;
    } else {
      throw CacheException();
    }
  }
}

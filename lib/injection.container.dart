import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:refactor/core/api/api_consumer.dart';
import 'package:refactor/core/api/api_interceptors.dart';
import 'package:refactor/core/api/dio_consumer.dart';
import 'package:refactor/core/network/network_info.dart';
import 'package:refactor/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:refactor/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:refactor/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:refactor/features/auth/domain/repositories/auth_repository.dart';
import 'package:refactor/features/auth/domain/usecases/user_login.dart';
import 'package:refactor/features/auth/domain/usecases/user_register.dart';
import 'package:refactor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // features

  //blocs
  //auth bloc
  sl.registerFactory(() => AuthCubit(userLogin: sl(), userRegister: sl()));

  //use cases
  //auth usecases
  sl.registerLazySingleton(() => UserLogin(authRepository: sl()));
  sl.registerLazySingleton(() => UserRegister(authRepository: sl()));

  //repository
  //auth repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(
        netWorkInfo: sl(),
        authRemoteDataSource: sl(),
        authLocalDataSource: sl(),
      ));

  // Data Source
  //auth data source
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(
        sharedPreferences: sl(),
      ));
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(apiConsumer: sl()));

  // core
  sl.registerLazySingleton<NetWorkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  // external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));

  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}

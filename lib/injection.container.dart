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
import 'package:refactor/features/home/data/datasources/home_remote_data_source.dart';
import 'package:refactor/features/home/data/repositories/home_repository_impl.dart';
import 'package:refactor/features/home/domain/repositories/home_repository.dart';
import 'package:refactor/features/home/domain/usecases/change_favourite.dart';
import 'package:refactor/features/home/domain/usecases/get_category.dart';
import 'package:refactor/features/home/domain/usecases/get_favourite.dart';
import 'package:refactor/features/home/domain/usecases/get_product.dart';
import 'package:refactor/features/home/domain/usecases/get_user.dart';
import 'package:refactor/features/home/domain/usecases/update_user.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';
import 'package:refactor/features/search/data/datasources/search_remote_data_source.dart';
import 'package:refactor/features/search/data/repositories/search_repository_impl.dart';
import 'package:refactor/features/search/domain/repositories/search_repository.dart';
import 'package:refactor/features/search/domain/usecases/search_products.dart';
import 'package:refactor/features/search/presentation/cubit/search_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // features

  //blocs
  //auth bloc
  sl.registerFactory(() => AuthCubit(
        userLogin: sl(),
        userRegister: sl(),
      ));
  sl.registerFactory(() => HomeCubit(
        getProduct: sl(),
        getCategory: sl(),
        getFavourite: sl(),
        changeFavourite: sl(),
        getUser: sl(),
        updateUser: sl(),
      ));
  sl.registerFactory(() => SearchCubit(searchProducts: sl()));

  //use cases
  //auth usecases
  sl.registerLazySingleton(() => UserLogin(authRepository: sl()));
  sl.registerLazySingleton(() => UserRegister(authRepository: sl()));
  //home usecase
  sl.registerLazySingleton(() => GetProduct(homeRepository: sl()));
  sl.registerLazySingleton(() => GetCategory(homeRepository: sl()));
  sl.registerLazySingleton(() => GetFavourite(homeRepository: sl()));
  sl.registerLazySingleton(() => ChangeFavourite(homeRepository: sl()));
  sl.registerLazySingleton(() => GetUser(homeRepository: sl()));
  sl.registerLazySingleton(() => UpdateUser(homeRepository: sl()));
  //search usecase
  sl.registerLazySingleton(() => SearchProducts(searchRepository: sl()));

  //repository
  //auth repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(
        netWorkInfo: sl(),
        authRemoteDataSource: sl(),
        authLocalDataSource: sl(),
      ));
  // home repositories
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
        netWorkInfo: sl(),
        homeRemoteDataSource: sl(),
      ));
  //search repository
  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(
        searchRemoteDataSource: sl(),
        netWorkInfo: sl(),
      ));

  // Data Source
  //auth data source
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(
        sharedPreferences: sl(),
      ));
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(apiConsumer: sl()));
  //home data source
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(apiConsumer: sl()));
  //search data source
  sl.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(apiConsumer: sl()));

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

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
import 'package:refactor/features/favourite/data/datasources/favourite_remote_data_source.dart';
import 'package:refactor/features/favourite/data/repositories/favourite_repository_impl.dart';
import 'package:refactor/features/favourite/domain/repositories/favourite_repository.dart';
import 'package:refactor/features/favourite/domain/usecases/get_favourites.dart';
import 'package:refactor/features/home/data/datasources/home_remote_data_source.dart';
import 'package:refactor/features/home/data/repositories/home_repository_impl.dart';
import 'package:refactor/features/home/domain/repositories/home_repository.dart';
import 'package:refactor/features/home/domain/usecases/get_banners.dart';
import 'package:refactor/features/home/domain/usecases/get_categories.dart';
import 'package:refactor/features/home/domain/usecases/get_products.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';
import 'package:refactor/features/search/data/datasources/search_remote_data_source.dart';
import 'package:refactor/features/search/data/repositories/search_repository_impl.dart';
import 'package:refactor/features/search/domain/repositories/search_repository.dart';
import 'package:refactor/features/search/domain/usecases/search_products.dart';
import 'package:refactor/features/search/presentation/cubit/search_cubit.dart';
import 'package:refactor/features/settings/data/datasources/settings_remote_data_source.dart';
import 'package:refactor/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:refactor/features/settings/domain/repositories/settings_repository.dart';
import 'package:refactor/features/settings/domain/usecases/get_user.dart';
import 'package:refactor/features/settings/domain/usecases/update_user.dart';
import 'package:refactor/features/settings/presentation/cubit/settings_cubit.dart';
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
  // Home bloc
  sl.registerFactory(() => HomeCubit(
        getBanners: sl(),
        getProducts: sl(),
        getCategories: sl(),
        getFavourites: sl(),
      ));
  // Home bloc
  sl.registerFactory(() => SearchCubit(searchProducts: sl()));
  // Settings bloc
  sl.registerFactory(() => SettingsCubit(getUser: sl(), updateUser: sl()));

  //use cases
  //auth usecases
  sl.registerLazySingleton(() => UserLogin(authRepository: sl()));
  sl.registerLazySingleton(() => UserRegister(authRepository: sl()));
  //home usecase
  sl.registerLazySingleton(() => GetBanners(homeRepository: sl()));
  sl.registerLazySingleton(() => GetProducts(homeRepository: sl()));
  sl.registerLazySingleton(() => GetCategories(homeRepository: sl()));
  //favourite usecase
  sl.registerLazySingleton(() => GetFavourites(favouriteRepository: sl()));
  //search usecase
  sl.registerLazySingleton(() => SearchProducts(searchRepository: sl()));
  //settings usecase
  sl.registerLazySingleton(() => GetUser(settingsRepository: sl()));
  sl.registerLazySingleton(() => UpdateUser(settingsRepository: sl()));

  //repository
  //auth repository
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
  // Favourite repository
  sl.registerLazySingleton<FavouriteRepository>(() => FavouriteRepositoryImpl(
        favouriteRemoteDataSource: sl(),
        netWorkInfo: sl(),
      ));
  //search repository
  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(
        searchRemoteDataSource: sl(),
        netWorkInfo: sl(),
      ));
  sl.registerLazySingleton<SettingsRepository>(() => SettingsRepositoryImpl(
        settingsRemoteDataSource: sl(),
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
  // favourite Data source
  sl.registerLazySingleton<FavouriteRemoteDataSource>(
      () => FavouriteRemoteDataSourceImpl(apiConsumer: sl()));
  //search data source
  sl.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(apiConsumer: sl()));
  //settings data source
  sl.registerLazySingleton<SettingsRemoteDataSource>(
      () => SettingsRemoteDataSourceImpl(apiConsumer: sl()));

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

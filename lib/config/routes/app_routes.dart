import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:refactor/features/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:refactor/features/auth/presentation/screens/register_screen/register_screen.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';
import 'package:refactor/features/home/presentation/screens/home_layout.dart';
import 'package:refactor/features/splash/presentation/screens/splash_screen.dart';
import 'package:refactor/injection.container.dart' as di;

class Routes {
  static const String initialRoute = '/';

  static const String loginRoute = '/login';

  static const String registerRoute = '/register';

  static const String homeRoute = '/home';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => di.sl<AuthCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => di.sl<AuthCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => di.sl<HomeCubit>()
              ..getHomeData()
              ..getCategoryData()
              ..getFavouriteData()
              ..getCategoryData()
              ..getUserData(),
            child: const HomeLayout(),
          ),
        );

      default:
        return undefindedRoute();
    }
  }

  static Route<dynamic> undefindedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}


// Navigator.pushNamed(context, Routes.registerRoute)
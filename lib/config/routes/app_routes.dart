import 'package:flutter/material.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/features/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:refactor/features/auth/presentation/screens/register_screen/register_screen.dart';
import 'package:refactor/features/splash/presentation/screens/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';

  static const String loginRoute = '/login';

  static const String registerRoute = '/register';
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
          builder: (context) => const LoginScreen(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
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


// Mavogator.pushNamed(context, Routes.registerRoute)
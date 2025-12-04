import 'package:bravoo/src/features/auth/presentation/pages/login_screen.dart';
import 'package:bravoo/src/features/auth/presentation/pages/signup_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const signup = '/signup';
  static const forgePassword = '/forget-password';
  static const home = '/home';
  //

  static String currentRoute = splash;

  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    currentRoute = routeSettings.name ?? '';

    switch (routeSettings.name) {
      // case splash:
      //   return SplashScreen.route(routeSettings);
      case login:
        return LoginScreen.route(routeSettings);
      case signup:
        return SignupScreen.route(routeSettings);
      // case forgePassword:
      //   return ForgetPasswordScreen.route(routeSettings);
      // case home:
      //   return HomeScreen.route(routeSettings);

      // default:
      //   return PageNotFoundScreen.route(routeSettings);
    }
  }
}

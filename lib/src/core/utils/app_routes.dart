import 'package:bravoo/src/core/widgets/page_not_found.dart';
import 'package:bravoo/src/features/auth/presentation/pages/forget_password_screen.dart';
import 'package:bravoo/src/features/auth/presentation/pages/login_screen.dart';
import 'package:bravoo/src/features/auth/presentation/pages/signup_screen.dart';
import 'package:bravoo/src/features/home/presentation/pages/home_screen.dart';
import 'package:bravoo/src/features/onboarding/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const signup = '/signup';
  static const forgetPassword = '/forget-password';
  static const home = '/home';
  //

  static String currentRoute = splash;

  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    currentRoute = routeSettings.name ?? '';

    switch (routeSettings.name) {
      case splash:
        return SplashScreen.route(routeSettings);
      case login:
        return LoginScreen.route(routeSettings);
      case signup:
        return SignupScreen.route(routeSettings);
      case forgetPassword:
        return ForgetPasswordScreen.route(routeSettings);
      case home:
        return HomeScreen.route(routeSettings);

      default:
        return PageNotFoundScreen.route(routeSettings);
    }
  }
}

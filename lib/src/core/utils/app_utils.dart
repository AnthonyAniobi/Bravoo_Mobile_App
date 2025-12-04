import 'package:bravoo/src/core/utils/app_routes.dart';
import 'package:bravoo/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUtils {
  static const String appName = 'Bravoo';
  static const String packageName = 'com.anonsoft.bravoo';
  static const kPageTransitionDuration = Duration(milliseconds: 300);

  static String get supabaseProjectUrl {
    return dotenv.env['SUPABASE_PROJECT_URL'] ?? '';
  }

  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  static String get googleAndroidClientId =>
      dotenv.env['ANDROID_GOOGLE_CLIENT_ID'] ?? '';

  static String get googleIosClientId =>
      dotenv.env['IOS_GOOGLE_CLIENT_ID'] ?? '';

  static String get googleServerId => dotenv.env['GOOGLE_SERVER_ID'] ?? '';

  static String authToken = '';

  static bool get isTestMode => false;

  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static Future<void> logout(
    BuildContext context, {
    bool removePages = true,
  }) async {
    // clear all cubits
    await context.read<AuthCubit>().signOut();
    if (removePages) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.login,
        (route) => false,
      );
    }
  }

  // check if widget is visible

  static void removeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

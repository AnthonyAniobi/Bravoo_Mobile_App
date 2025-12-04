import 'package:bravoo/src/core/services/dependency_injection_service.dart';
import 'package:bravoo/src/core/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future setupMain() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: AppUtils.supabaseProjectUrl,
    anonKey: AppUtils.supabaseAnonKey,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await GetInjectionService.init();
}

import 'package:bravoo/src/core/services/bloc_service.dart';
import 'package:bravoo/src/core/utils/app_routes.dart';
import 'package:bravoo/src/core/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BravooApp extends StatelessWidget {
  const BravooApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 815),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, context) {
        return MultiBlocProvider(
          providers: [...BlocService.providers],
          child: Builder(
            builder: (context) {
              return MaterialApp(
                title: AppUtils.appName,
                navigatorKey: AppUtils.navKey,
                debugShowCheckedModeBanner: false,
                initialRoute: AppRoutes.splash,
                onGenerateRoute: AppRoutes.onGenerateRoute,
              );
            },
          ),
        );
      },
    );
  }
}

import 'package:bravoo/src/core/constants/app_colors.dart';
import 'package:bravoo/src/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  static Route<dynamic> route(RouteSettings routeSettings) {
    return MaterialPageRoute<dynamic>(
      settings: routeSettings,
      builder: (_) => const LoginScreen(),
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            20.verticalSpace,
            AppButton.white(child: Text('some information'), onTap: () {}),
            20.verticalSpace,
            AppButton.green(child: Text('text'), onTap: () {}),
            20.verticalSpace,
            AppButton.black(text: 'text', onTap: () {}),
          ],
        ),
      ),
    );
  }
}

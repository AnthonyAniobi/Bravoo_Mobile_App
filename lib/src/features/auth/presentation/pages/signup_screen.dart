import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();

  static Route<dynamic> route(RouteSettings routeSettings) {
    return MaterialPageRoute<dynamic>(
      settings: routeSettings,
      builder: (_) => const SignupScreen(),
    );
  }
}

class _LoginScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

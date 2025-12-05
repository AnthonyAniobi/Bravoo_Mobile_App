import 'dart:ui';

import 'package:bravoo/gen/assets.gen.dart';
import 'package:bravoo/src/core/utils/app_routes.dart';
import 'package:bravoo/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bravoo/src/features/auth/presentation/widgets/app_toast.dart';
import 'package:bravoo/src/features/auth/presentation/widgets/login_modal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loginModal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.isLoggedIn) {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
          } else if (state.loadStatus.isFailed) {
            AppToast.warn(context, state.errorMessage);
          }
        },
        child: Stack(
          children: [
            Positioned(
              left: -30,
              right: -30,
              top: 50,
              bottom: -100,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 20.w,
                  ),
                  itemBuilder: (context, index) {
                    return Image.asset(
                      Assets.images.bg.path,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loginModal() {
    scaffoldKey.currentState?.showBottomSheet(
      enableDrag: false,
      sheetAnimationStyle: AnimationStyle(
        curve: Curves.bounceInOut,
        duration: const Duration(milliseconds: 800),
      ),
      (context) {
        return LoginModalWidget(scaffoldKey: scaffoldKey);
      },
    );
  }
}

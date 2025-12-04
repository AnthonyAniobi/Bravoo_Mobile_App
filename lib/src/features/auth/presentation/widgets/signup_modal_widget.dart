import 'package:bravoo/gen/assets.gen.dart';
import 'package:bravoo/src/core/constants/app_colors.dart';
import 'package:bravoo/src/core/widgets/app_button.dart';
import 'package:bravoo/src/core/widgets/app_text_form_field.dart';
import 'package:bravoo/src/features/auth/presentation/widgets/forget_password_modal_widget.dart';
import 'package:bravoo/src/features/auth/presentation/widgets/login_modal_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupModalWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SignupModalWidget({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 642.h,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            12.verticalSpace,
            Align(child: topNotch()),
            const Row(),
            20.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create a new account',
                  style: GoogleFonts.manrope(
                    color: AppColors.textDefault,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Welcome aboard! Let\'s get you set up',
                  style: GoogleFonts.manrope(
                    color: AppColors.textSecondary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            AppTextFormField(
              hintText: 'First Name',
              keyboardType: TextInputType.emailAddress,
            ),
            10.verticalSpace,
            AppTextFormField(
              hintText: 'Email Address',
              keyboardType: TextInputType.emailAddress,
            ),
            10.verticalSpace,
            AppTextFormField(hintText: 'Password', obscureText: true),
            10.verticalSpace,
            AppButton.black(text: 'Continue', onTap: () {}),
            10.verticalSpace,
            Align(
              child: Text(
                'OR',
                style: GoogleFonts.manrope(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            10.verticalSpace,
            AppButton.white(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.svg.google,
                      height: 20.r,
                      width: 20.r,
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: Text(
                        'Continue with Google',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.dmSans(
                          color: AppColors.textDefault,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            10.verticalSpace,
            AppButton.white(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.svg.apple,
                      height: 20.r,
                      width: 20.r,
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: Text(
                        'Continue with Apple',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.dmSans(
                          color: AppColors.textDefault,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            20.verticalSpace,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(text: 'Already have an account? '),
                  TextSpan(
                    text: 'Login',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        navigateToLogin(context);
                      },
                    style: GoogleFonts.manrope(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                style: GoogleFonts.manrope(
                  color: AppColors.textSecondary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            5.verticalSpace,
            Text(
              'By continuing you agree to the Rules and Policy',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                color: AppColors.textSecondary,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container topNotch() {
    return Container(
      height: 4.h,
      width: 75.w,
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }

  void navigateToLogin(BuildContext context) {
    scaffoldKey.currentState?.showBottomSheet(
      enableDrag: true,
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

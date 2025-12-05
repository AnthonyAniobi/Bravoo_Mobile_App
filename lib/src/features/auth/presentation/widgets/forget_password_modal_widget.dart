import 'package:bravoo/src/core/constants/app_colors.dart';
import 'package:bravoo/src/core/widgets/app_button.dart';
import 'package:bravoo/src/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordModalWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const ForgetPasswordModalWidget({super.key, required this.scaffoldKey});

  @override
  State<ForgetPasswordModalWidget> createState() =>
      _ForgetPasswordModalWidgetState();
}

class _ForgetPasswordModalWidgetState extends State<ForgetPasswordModalWidget> {
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
                  'Enter your email',
                  style: GoogleFonts.manrope(
                    color: AppColors.textDefault,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Enter your email and we will send you a code',
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
              hintText: 'Email Address',
              keyboardType: TextInputType.emailAddress,
            ),
            10.verticalSpace,
            AppButton.black(text: 'Send code', onTap: () {}),
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

  void navigateToSignUp(BuildContext context) {
    widget.scaffoldKey.currentState?.showBottomSheet(
      sheetAnimationStyle: AnimationStyle(
        curve: Curves.bounceInOut,
        duration: const Duration(milliseconds: 800),
      ),
      (context) {
        return Container();
      },
    );
  }

  void navigateToForgotPassword(BuildContext context) {
    Navigator.of(context).pop();
  }
}

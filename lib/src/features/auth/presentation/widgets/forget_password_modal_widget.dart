import 'package:bravoo/src/core/constants/app_colors.dart';
import 'package:bravoo/src/core/widgets/app_button.dart';
import 'package:bravoo/src/core/widgets/app_text_form_field.dart';
import 'package:bravoo/src/features/auth/presentation/cubit/forget_password_cubit.dart';
import 'package:bravoo/src/features/auth/presentation/widgets/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late final TextEditingController emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    context.read<ForgetPasswordCubit>().reset();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

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
            Form(
              key: _formKey,
              child: AppTextFormField(
                controller: emailController,
                hintText: 'Email Address',
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            10.verticalSpace,
            BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                if (state.forgetPasswordStatus.isSuccess) {
                  Navigator.of(context).pop();
                  AppToast.success(
                    context,
                    'A password reset code has been sent to your email',
                  );
                } else if (state.forgetPasswordStatus.isFailed) {
                  AppToast.warn(
                    context,
                    state.errorMessage ?? 'Some error occured',
                  );
                }
              },
              builder: (context, state) {
                return ValueListenableBuilder(
                  valueListenable: emailController,
                  builder: (context, value, child) {
                    return AppButton.black(
                      disabled: emailController.text.isEmpty,
                      isLoading: state.forgetPasswordStatus.isLoading,
                      text: 'Send code',
                      onTap: forgetPassword,
                    );
                  },
                );
              },
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

  void forgetPassword() {
    if (_formKey.currentState != null && !_formKey.currentState!.validate()) {
      return;
    }
    context.read<ForgetPasswordCubit>().forgetPassword(
      emailController.text.trim(),
    );
  }
}

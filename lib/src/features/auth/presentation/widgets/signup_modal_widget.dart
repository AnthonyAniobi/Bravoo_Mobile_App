import 'package:bravoo/gen/assets.gen.dart';
import 'package:bravoo/src/core/constants/app_colors.dart';
import 'package:bravoo/src/core/utils/app_validators.dart';
import 'package:bravoo/src/core/widgets/app_button.dart';
import 'package:bravoo/src/core/widgets/app_text_form_field.dart';
import 'package:bravoo/src/features/auth/domain/entities/registration_entity.dart';
import 'package:bravoo/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bravoo/src/features/auth/presentation/widgets/login_modal_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

class SignupModalWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SignupModalWidget({super.key, required this.scaffoldKey});

  @override
  State<SignupModalWidget> createState() => _SignupModalWidgetState();
}

class _SignupModalWidgetState extends State<SignupModalWidget> {
  late final TextEditingController fullNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final ValueNotifier<bool> isPasswordVisible;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    isPasswordVisible = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    isPasswordVisible.dispose();
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
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Form(
              key: formKey,
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
                    controller: fullNameController,
                    hintText: 'Full Name',
                    keyboardType: TextInputType.emailAddress,
                    validator: AppValidators.name,
                  ),
                  10.verticalSpace,
                  AppTextFormField(
                    controller: emailController,
                    hintText: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    validator: AppValidators.email,
                  ),
                  10.verticalSpace,
                  ValueListenableBuilder(
                    valueListenable: isPasswordVisible,
                    builder: (context, value, child) {
                      return AppTextFormField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: !isPasswordVisible.value,
                        validator: AppValidators.password,
                        suffixIcon: IconButton(
                          onPressed: () {
                            isPasswordVisible.value = !value;
                          },
                          icon: Icon(
                            value ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                      );
                    },
                  ),
                  10.verticalSpace,
                  MultiValueListenableBuilder(
                    valueListenables: [
                      fullNameController,
                      emailController,
                      passwordController,
                    ],
                    builder: (context, value, child) {
                      return AppButton.black(
                        isLoading: state.loadStatus.isLoading,
                        disabled:
                            fullNameController.text.isEmpty ||
                            emailController.text.isEmpty ||
                            passwordController.text.isEmpty,
                        text: 'Continue',
                        onTap: signup,
                      );
                    },
                  ),
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
                    onTap: googleSignup,
                    isLoading: state.googleSigninStatus.isLoading,
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
                    onTap: appleSignup,
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
            );
          },
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
    widget.scaffoldKey.currentState?.showBottomSheet(
      enableDrag: true,
      sheetAnimationStyle: AnimationStyle(
        curve: Curves.bounceInOut,
        duration: const Duration(milliseconds: 800),
      ),
      (context) {
        return LoginModalWidget(scaffoldKey: widget.scaffoldKey);
      },
    );
  }

  void signup() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    context.read<AuthCubit>().registerEmail(
      RegistrationEntity(
        fullName: fullNameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }

  void googleSignup() {
    context.read<AuthCubit>().googleSignin();
  }

  void appleSignup() {
    // not available yet
  }
}

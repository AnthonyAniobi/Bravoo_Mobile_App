import 'package:bravoo/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatefulWidget {
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final bool disabled;
  final bool isLoading;
  final Widget child;
  final LinearGradient? gradient;
  final List<BoxShadow>? boxShadow;

  const AppButton._({
    super.key,
    required this.onTap,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.child,
    this.disabled = false,
    this.isLoading = false,
    this.gradient,
    this.boxShadow,
  });

  static Widget black({
    required String text,
    required VoidCallback onTap,
    bool disabled = false,
    bool isLoading = false,
  }) {
    return AppButton._(
      onTap: onTap,
      backgroundColor: AppColors.black,
      borderColor: AppColors.primary,
      textColor: Colors.white,
      isLoading: isLoading,
      disabled: disabled,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(109, 97, 118, 255),
          Color.fromRGBO(98, 88, 106, 255),
          Color.fromRGBO(89, 80, 96, 255),
          Color.fromRGBO(70, 64, 75, 255),
          Color.fromRGBO(45, 41, 47, 255),
          Color.fromRGBO(32, 31, 33, 255),
          Color.fromRGBO(18, 18, 18, 255),
        ],
        stops: const [0.0, 0.07, 0.14, 0.28, 0.5, 0.75, 1.0],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.manrope(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static Widget green({
    required Widget child,
    required VoidCallback onTap,
    bool disabled = false,
    bool isLoading = false,
  }) {
    return AppButton._(
      onTap: onTap,
      backgroundColor: AppColors.green,
      borderColor: AppColors.white,
      textColor: Colors.white,
      isLoading: isLoading,
      disabled: disabled,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(114, 183, 151, 255),
          Color.fromRGBO(106, 179, 146, 255),
          Color.fromRGBO(71, 160, 116, 255),
          Color.fromRGBO(39, 137, 86, 255),
          Color.fromRGBO(27, 125, 70, 255),
        ],
        stops: const [0.0, 0.07, 0.14, 0.28, 0.5],
      ),
      child: child,
    );
  }

  static Widget white({
    required Widget child,
    required VoidCallback onTap,
    bool disabled = false,
    bool isLoading = false,
  }) {
    return AppButton._(
      onTap: onTap,
      backgroundColor: AppColors.green,
      borderColor: const Color(0xFF1C636F).withAlpha((0.15 * 255).toInt()),
      textColor: AppColors.black,
      isLoading: isLoading,
      disabled: disabled,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          offset: const Offset(0, 2),
          blurRadius: 2.0,
          spreadRadius: 1.0,
        ),
        BoxShadow(
          color: Colors.white,
          offset: const Offset(0, -2),
          blurRadius: 2.0,
          spreadRadius: 1.0,
        ),
      ],
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFFFFFFF), Color(0xFFF3F3F3)],
      ),
      child: child,
    );
  }

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1, end: 0.9).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticIn),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    if (!widget.disabled) {
      await _animationController.forward().then((_) {
        _animationController.reverse();
      });
      widget.onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: InkWell(
        onTap: widget.disabled ? null : _handleTap,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: Container(
                padding: EdgeInsets.all(3.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                    color: widget.borderColor.withAlpha((0.15 * 255).toInt()),
                    width: 1.r,
                  ),
                ),

                child: Opacity(
                  opacity: widget.disabled ? 0.6 : 1.0,
                  child: Container(
                    height: 48.h,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      boxShadow: widget.boxShadow,
                      gradient: widget.gradient,
                    ),
                    child: widget.isLoading
                        ? Padding(
                            padding: EdgeInsets.all(8.r),
                            child: CircularProgressIndicator(
                              constraints: BoxConstraints(
                                minHeight: 24.h,
                                minWidth: 24.h,
                                maxHeight: 24.h,
                                maxWidth: 24.h,
                              ),
                              color: widget.textColor,
                            ),
                          )
                        : widget.child,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

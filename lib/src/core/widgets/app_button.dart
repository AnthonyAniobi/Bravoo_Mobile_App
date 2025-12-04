import 'package:bravoo/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatefulWidget {
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final bool disabled;
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
    this.gradient,
    this.boxShadow,
  });

  static Widget black({
    required String text,
    required VoidCallback onTap,
    bool disabled = false,
  }) {
    return AppButton._(
      onTap: onTap,
      backgroundColor: AppColors.black,
      borderColor: AppColors.primary,
      textColor: Colors.white,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
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
  }) {
    return AppButton._(
      onTap: onTap,
      backgroundColor: AppColors.green,
      borderColor: AppColors.white,
      textColor: Colors.white,
      child: child,
    );
  }

  static Widget white({
    required Widget child,
    required VoidCallback onTap,
    bool disabled = false,
  }) {
    return AppButton._(
      onTap: onTap,
      backgroundColor: AppColors.green,
      borderColor: const Color(0xFF1C636F).withAlpha((0.15 * 255).toInt()),
      textColor: Colors.white,
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

                child: Container(
                  height: 48.h,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: widget.boxShadow,
                    gradient:
                        widget.gradient ??
                        LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            widget.backgroundColor.withAlpha(100),
                            widget.backgroundColor.withAlpha(150),
                            widget.backgroundColor.withAlpha(200),
                            widget.backgroundColor.withAlpha(220),
                            widget.backgroundColor.withAlpha(240),
                            widget.backgroundColor,
                          ],
                          // stops: const [0.0, 1.0],
                        ),
                  ),
                  child: widget.child,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

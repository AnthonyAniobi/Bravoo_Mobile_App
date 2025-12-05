import 'package:bravoo/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha((0.05 * 255).toInt()),
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(Assets.images.avatarImage.path, width: 24.w),
          Divider(
            color: Colors.white.withAlpha((0.2 * 255).toInt()),
            thickness: 1,
            // indent: 8.w,
            // endIndent: 8.w,
          ),
          Image.asset(Assets.images.avatarImage.path, width: 24.w),
        ],
      ),
    );
  }
}

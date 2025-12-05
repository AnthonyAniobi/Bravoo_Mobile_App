import 'package:bravoo/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CopyLinkButton extends StatelessWidget {
  const CopyLinkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white.withAlpha((0.08 * 255).toInt()),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'https://Bravoo.ref.12419',
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          5.horizontalSpace,
          SvgPicture.asset(
            Assets.svg.copy,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}

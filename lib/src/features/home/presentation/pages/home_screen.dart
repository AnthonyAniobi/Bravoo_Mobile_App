import 'package:bravoo/gen/assets.gen.dart';
import 'package:bravoo/src/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static Route<dynamic> route(RouteSettings routeSettings) {
    return MaterialPageRoute<dynamic>(
      settings: routeSettings,
      builder: (_) => const HomeScreen(),
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C0066),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              top: -23.h,
              right: -1,
              left: 0,
              child: Image.asset(
                Assets.images.spotlight.path,
                colorBlendMode: BlendMode.difference,
                color: const Color(0xFF2C0066),
              ),
            ),
            Positioned(
              top: 55.h,
              left: 16.w,
              right: 16.w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(Assets.svg.arrowBack),
                  Expanded(
                    child: Text(
                      'Enter to win the Oraimo OpenSnap!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.baloo2(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 109.h,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(Assets.images.earpiece.path, width: 152.w),
              ),
            ),
            Positioned(
              top: 234.h,
              left: 0,
              right: 0,
              child: Align(
                child: Image.asset(Assets.images.cube.path, width: 103.w),
              ),
            ),
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(16.w, 300.h, 16.w, 0),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      height: 156.h,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2C0066),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16.r),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'DRAW ENDS IN',
                            style: GoogleFonts.manrope(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              timerWidget('02', 'Hours'),
                              Text(
                                ':',
                                style: GoogleFonts.baloo2(
                                  fontSize: 36.sp,
                                  height: 1,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              timerWidget('24', 'Hours'),
                              Text(
                                ':',
                                style: GoogleFonts.baloo2(
                                  fontSize: 36.sp,
                                  height: 1,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              timerWidget('00', 'Mins'),
                              Text(
                                ':',
                                style: GoogleFonts.baloo2(
                                  fontSize: 36.sp,
                                  height: 1,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              timerWidget('00', 'Secs'),
                            ],
                          ),
                          Container(
                            // margin: EdgeInsets.only(top: 12.h),
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(
                                (0.1 * 255).toInt(),
                              ),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Center(
                              child: Text(
                                '4,327 users have entered so far',
                                style: GoogleFonts.baloo2(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
                      height: 600.h,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(58, 0, 105, 255),
                        // color: const Color(0xFF2C0066),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(16.r),
                        ),
                      ),
                      child: Column(
                        children: [
                          20.verticalSpace,
                          Image.asset(
                            Assets.images.announce.path,
                            height: 40.h,
                          ),
                          10.verticalSpace,
                          Text(
                            'QUALIFICATION RULE',
                            style: GoogleFonts.baloo2(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          10.verticalSpace,
                          SizedBox(
                            width: 221.w,
                            child: Text(
                              'Invite at least 2 friends who sign up through your link to qualify.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.manrope(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          20.verticalSpace,
                          Container(
                            height: 436.33.h,
                            width: double.maxFinite,
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            padding: EdgeInsets.all(16.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: Colors.white.withAlpha(
                                (0.2 * 255).toInt(),
                              ),
                            ),
                            child: Column(
                              children: [
                                AppButton.green(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        Assets.svg.checkmark,
                                        color: Colors.white,
                                      ),
                                      5.horizontalSpace,
                                      Text(
                                        'You\'ve Entered',
                                        style: GoogleFonts.manrope(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {},
                                ),
                                20.verticalSpace,
                                AvatarWidget(),
                                10.verticalSpace,
                                Text(
                                  'Your entry is confirmed for this draw.',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.manrope(
                                    color: Color(0xFF767676),
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                10.verticalSpace,
                                Divider(
                                  color: Colors.white.withAlpha(
                                    (0.08 * 255).toInt(),
                                  ),
                                ),
                                10.verticalSpace,
                                Text(
                                  'Invite your friends quick & easy.',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.manrope(
                                    color: Colors.white.withAlpha(
                                      (0.64 * 255).toInt(),
                                    ),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                10.verticalSpace,
                                CopyLinkButton(),
                                20.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    socialMediaTile(
                                      Assets.images.whatsapp.path,
                                      'WhatsApp',
                                    ),
                                    socialMediaTile(
                                      Assets.images.x.path,
                                      'X(Twiiter)',
                                    ),
                                    socialMediaTile(
                                      Assets.images.linkedin.path,
                                      'LinkedIn',
                                    ),
                                  ],
                                ),
                                10.verticalSpace,
                                Divider(
                                  color: Colors.white.withAlpha(
                                    (0.08 * 255).toInt(),
                                  ),
                                ),
                                10.verticalSpace,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    50.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget socialMediaTile(String icon, String title) {
    return Container(
      width: 86.r,
      height: 86.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white.withAlpha((0.08 * 255).toInt()),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon, width: 32.r, height: 32.r),
          4.verticalSpace,
          Text(
            title,
            style: GoogleFonts.manrope(
              color: Colors.white.withAlpha((0.64 * 255).toInt()),
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Container timerWidget(String title, String subtitle) {
    return Container(
      width: 67.r,
      height: 67.r,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha((0.1 * 255).toInt()),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.baloo2(
              fontSize: 36.sp,
              height: 1,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            subtitle,
            style: GoogleFonts.manrope(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white.withAlpha((0.48 * 255).toInt()),
            ),
          ),
        ],
      ),
    );
  }
}

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
          SvgPicture.asset(Assets.svg.copy, color: Colors.white),
        ],
      ),
    );
  }
}

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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udrive/core/app_fonts/text_styles.dart';
import 'package:udrive/presentation/screens/onboarding_2_screen.dart';
import 'package:udrive/presentation/widgets/custom_circle_button.dart';
import 'package:udrive/resources/resources.dart';

class OnBoardingFirstScreen extends StatelessWidget {
  const OnBoardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Container(
              color: const Color(0xff0870FF),
            ),
            Positioned.fill(
              child: Align(
                alignment: const Alignment(0.37, -0.28),
                child: Image.asset(
                  Images.mockup,
                  height: 480.h,
                  width: 250.w,
                ),
              ),
            ),
            Positioned(
              left: 30.w,
              top: 200.h,
              child: Image.asset(
                Images.excited,
                height: 100.h,
                width: 100.w,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: const Alignment(0.85, -0.72),
                child: Image.asset(
                  Images.bubble,
                  height: 120.h,
                  width: 120.w,
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: const Alignment(0.6, -0.3),
                child: Image.asset(
                  Images.boss,
                  height: 80.h,
                  width: 80.w,
                ),
              ),
            ),
            Positioned(
              bottom: 0.h,
              child: Container(
                height: 380.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(32.r))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Make your way more comfortable",
                        style: AppFonts.w700s32,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Find the mechanic along the entire route without interrupting your route using this platform.",
                        style: AppFonts.w500s14,
                        textAlign: TextAlign.center,
                      ),
                      CustomCircleButton(
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return const SeconOnBoardingScreen();
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);

                              return SlideTransition(
                                  position: offsetAnimation, child: child);
                            },
                          ));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

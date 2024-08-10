import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udrive/core/app_fonts/text_styles.dart';
import 'package:udrive/presentation/screens/choose_action_screen.dart';
import 'package:udrive/presentation/widgets/custom_circle_button.dart';
import 'package:udrive/resources/resources.dart';

class SeconOnBoardingScreen extends StatelessWidget {
  const SeconOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  Images.car,
                  height: 133.h,
                  width: 200.w,
                ),
                Image.asset(
                  Images.udrive,
                  height: 133.h,
                  width: 111.w,
                ),
              ],
            ),
            Image.asset(
              Images.man,
            ),
            Text(
              "Solution for drivers striving for successful work",
              style: AppFonts.w700s32,
              textAlign: TextAlign.center,
            ),
            Text(
              "Be part of a new era of work with this innovative app",
              style: AppFonts.w500s14,
              textAlign: TextAlign.center,
            ),
            CustomCircleButton(onTap: () {
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const ChooseActionScreen();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
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
            })
          ],
        ),
      )),
    );
  }
}

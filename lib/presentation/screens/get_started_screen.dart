import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udrive/core/app_fonts/text_styles.dart';
import 'package:udrive/presentation/screens/login_screen.dart';
import 'package:udrive/presentation/screens/onboarding_1_screen.dart';
import 'package:udrive/presentation/widgets/custom_button.dart';
import 'package:udrive/presentation/widgets/custom_elevated_button.dart';
import 'package:udrive/resources/resources.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Container(
              color: const Color(0xff2742F7),
            ),
            Positioned(
              right: 10.w,
              top: 40.h,
              child: IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  const AssetImage(Images.global),
                  size: 24.h,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 216.h,
              left: 70.w,
              child: Image.asset(
                Images.logo,
                height: 150.h,
                width: 190.w,
              ),
            ),
            Positioned(
              bottom: 0.h,
              child: Container(
                height: 341.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(32.r))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Images.hand,
                          width: 40.w,
                          height: 40.h,
                        ),
                        Text("Hello", style: AppFonts.w700s32),
                      ],
                    ),
                    Text(
                        "Choose how you will use the app for better experience",
                        style: AppFonts.w500s14),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: CustomButton(
                        color: const Color(0xff0870FF),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const OnBoardingFirstScreen()));
                        },
                        text: "I'm a driver",
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: CustomElevatedButton(
                          hasSize: false,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OnBoardingFirstScreen()));
                          },
                          text: "I'm a mechanic",
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: AppFonts.w400s14,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child: Text(
                              "Login",
                              style: AppFonts.w400s14
                                  .copyWith(color: const Color(0xff0870FF)),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

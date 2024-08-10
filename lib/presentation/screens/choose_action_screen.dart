import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udrive/core/app_fonts/text_styles.dart';
import 'package:udrive/presentation/screens/login_screen.dart';
import 'package:udrive/presentation/screens/signup_screen.dart';
import 'package:udrive/presentation/widgets/custom_button.dart';
import 'package:udrive/presentation/widgets/custom_elevated_button.dart';
import 'package:udrive/resources/resources.dart';

class ChooseActionScreen extends StatelessWidget {
  const ChooseActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Stack(
          children: [
            Image.asset(
              Images.track,
            ),
            Positioned(
              bottom: 0.h,
              child: Container(
                height: 370.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(32.r))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Your Successful Journey Starts Here",
                      style: AppFonts.w700s32,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                        "Take your drive career to the next level with this  app.",
                        style: AppFonts.w500s14),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: CustomButton(
                        color: const Color(0xff0870FF),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        text: "Login to Account",
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomElevatedButton(
                            onTap: () {},
                            text: "Google",
                            hasSize: true,
                            icon: Images.google,
                          ),
                          CustomElevatedButton(
                            onTap: () {},
                            text: "Apple",
                            hasSize: true,
                            icon: Images.apple,
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "New to udrive?",
                          style: AppFonts.w400s14,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen()));
                            },
                            child: Text(
                              "Create Account",
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

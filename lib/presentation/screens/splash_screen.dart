import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udrive/presentation/screens/get_started_screen.dart';
import 'package:udrive/resources/resources.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      childWidget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 93.w),
        child: Image.asset(Images.icon),
      ),
      backgroundColor: Colors.white,
      onAnimationEnd: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const GetStartedScreen()));
      },
    );
  }
}

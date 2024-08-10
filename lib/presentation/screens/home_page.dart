import 'package:flutter/material.dart';
import 'package:udrive/core/app_fonts/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "You log in successfully",
          style: AppFonts.w700s32,
        ),
      ),
    );
  }
}

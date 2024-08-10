import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udrive/core/app_fonts/text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final bool hasSize;
  final String? icon;

  const CustomElevatedButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.hasSize,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: hasSize ? 155.w : double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            side: BorderSide(
              color: const Color(0xff1D2048),
              width: 1.0.w,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 16.0.h),
          ),
          onPressed: () {
            onTap();
          },
          child: Row(
            mainAxisAlignment: icon!= null? MainAxisAlignment.spaceEvenly: MainAxisAlignment.center,
            children: [
              (icon != null) ? Image.asset(icon!) : const SizedBox(),
              Text(
                text,
                style: AppFonts.w600s16.copyWith(color: Colors.black),
              ),
            ],
          )),
    );
  }
}

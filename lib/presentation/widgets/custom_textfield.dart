import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udrive/core/app_fonts/text_styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final bool hasPassword;
  final String errorText;
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      required this.hasPassword,
      required this.errorText});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscured = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.hasPassword ? obscured : false,
      style: AppFonts.w400s14,
      cursorErrorColor: const Color(0xffDB2E20),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Can not be empty";
        } else if (widget.errorText == "Email does not exist") {
          return "Email does not exist";
        } else if (widget.errorText == "Incorrect password") {
          return "Incorrect password";
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: widget.hasPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscured = !obscured;
                  });
                },
                icon: const Icon(Icons.visibility))
            : null,
        hintText: widget.hintText,
        hintStyle: AppFonts.w500s14.copyWith(
            color: const Color(0xffCBD5E1), fontWeight: FontWeight.w100),
        errorBorder: widget.hasPassword
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
                borderSide: const BorderSide(
                  color: Color(0xffDB2E20),
                ))
            : null,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(
              color: Color(0xff0870FF),
            )),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(
              color: Color(0xffCBD5E1),
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(color: Color(0xffCBD5E1))),
        labelText: widget.labelText,
        labelStyle: AppFonts.w400s14.copyWith(color: const Color(0xffCBD5E1)),
      ),
    );
  }
}

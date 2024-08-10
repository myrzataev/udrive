import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udrive/core/app_fonts/text_styles.dart';
import 'package:udrive/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:udrive/presentation/screens/home_page.dart';

import 'package:udrive/presentation/screens/signup_screen.dart';
import 'package:udrive/presentation/widgets/custom_button.dart';
import 'package:udrive/presentation/widgets/custom_elevated_button.dart';
import 'package:udrive/presentation/widgets/custom_textfield.dart';
import 'package:udrive/resources/resources.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool remember = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            if (state.response == "Login successful") {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (Route<dynamic> route) => false,
              );
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.response)));
            }
           
          } else if (state is LoginError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorText)));
          }
        },
        child: SizedBox.expand(
          child: Stack(
            children: [
              Container(
                color: const Color(0xff1D1F48),
              ),
              Positioned.fill(
                child: Align(
                  alignment: const Alignment(0.0, -0.8),
                  child: Image.asset(
                    Images.logowithouttext,
                    fit: BoxFit.fill,
                    height: 150.h,
                    width: 150.w,
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                    alignment: const Alignment(0.0, -0.55),
                    child: Text(
                      "Welcome Back!",
                      style: AppFonts.w700s32.copyWith(color: Colors.white),
                    )),
              ),
              Positioned.fill(
                child: Align(
                    alignment: const Alignment(0.0, -0.40),
                    child: Text(
                      "Please login first to start your Udrive",
                      style: AppFonts.w500s14.copyWith(color: Colors.white),
                    )),
              ),
              Positioned(
                bottom: 0.h,
                child: Container(
                  height: 450.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(32.r))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextField(
                            errorText: errorText ?? "",
                            hintText: "Input your registered email or phone ",
                            labelText: "Email or phone number",
                            controller: emailController,
                            hasPassword: false,
                          ),
                          CustomTextField(
                            errorText: errorText ?? "",
                            hintText: "Input your password account ",
                            labelText: "Input your password account",
                            controller: passwordController,
                            hasPassword: true,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.r)),
                                    activeColor: const Color(0xff0870FF),
                                    tristate: true,
                                    value: remember,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        remember = !remember;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Remember Me",
                                    style: AppFonts.w500s14,
                                  )
                                ],
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forgot Password",
                                    style: AppFonts.w500s14,
                                  ))
                            ],
                          ),
                          CustomButton(
                            color: const Color(0xff0870FF),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<LoginBloc>(context).add(
                                    LoginEvent(
                                        email: emailController.text,
                                        password: passwordController.text));
                              }
                            },
                            text: "Login",
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
                                    style: AppFonts.w400s14.copyWith(
                                        color: const Color(0xff0870FF)),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

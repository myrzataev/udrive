import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udrive/core/app_fonts/text_styles.dart';
import 'package:udrive/presentation/blocs/create_user_bloc/create_user_bloc.dart';
import 'package:udrive/presentation/screens/login_screen.dart';
import 'package:udrive/presentation/widgets/custom_button.dart';
import 'package:udrive/presentation/widgets/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Signup'),
        backgroundColor: Colors.white,
      ),
      body: BlocListener<CreateUserBloc, CreateUserState>(
        listener: (context, state) {
          if (state is CreateUserSuccess) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          } else if (state is CreateUserError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorText)));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  style: AppFonts.w400s14,
                  cursorErrorColor: const Color(0xffDB2E20),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Can not be empty";
                    } else if ((value.contains("@gmail.com") == false)) {
                      return "Incorrect email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "email or phone number",
                    hintStyle: AppFonts.w500s14.copyWith(
                        color: const Color(0xffCBD5E1),
                        fontWeight: FontWeight.w100),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: const BorderSide(
                          color: Color(0xffDB2E20),
                        )),
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
                    labelText: "email or phone number",
                    labelStyle: AppFonts.w400s14
                        .copyWith(color: const Color(0xffCBD5E1)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: CustomTextField(
                      hintText: "your password",
                      labelText: "your password",
                      controller: _passwordController,
                      hasPassword: true,
                      errorText: "errorText"),
                ),
                CustomButton(
                    text: "Sign Up",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<CreateUserBloc>(context).add(
                            CreateUserEvent(
                                email: _emailController.text,
                                password: _passwordController.text));
                      }
                    },
                    color: Colors.blue)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

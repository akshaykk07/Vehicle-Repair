import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'MechHome.dart';
import 'Signup.dart';

class MechLogin extends StatefulWidget {
  MechLogin({super.key});

  @override
  State<MechLogin> createState() => _MechLoginState();
}

class _MechLoginState extends State<MechLogin> {
  @override
  final username = TextEditingController();

  final password = TextEditingController();

  final formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 45,
          right: 45,
        ).r,
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100).r,
                    child: Image.asset(
                      "assets/logo.png",
                      width: 140.w,
                      height: 140.h,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  const AppText(
                      text: "LOGIN",
                      weight: FontWeight.w700,
                      size: 23,
                      textcolor: customBalck),
                  SizedBox(
                    height: 50.h,
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: AppText(
                        text: "Enter Username",
                        weight: FontWeight.w500,
                        size: 16,
                        textcolor: customBalck),
                  ),
                  CustomTextField(
                      hint: "username",
                      controller: username,
                      validator: (value) {
                        if (value!.isEmpty || value == null) {        // validation.................
                          // validator.........
                          return "enter username";
                        }
                      }),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: AppText(
                        text: "Enter Password",
                        weight: FontWeight.w500,
                        size: 16,
                        textcolor: customBalck),
                  ),
                  CustomTextField(
                      hint: "password",
                      controller: password,
                      obscure: true,
                      validator: (value) {
                        if (value!.isEmpty || value == null) {     // validation.................
                          // validator.........
                          return "enter password";
                        }
                      }),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          // Forgot password......................
                        },
                        child: const AppText(
                            text: "Forgot password ?",
                            weight: FontWeight.w400,
                            size: 14,
                            textcolor: customBalck),
                      )),
                  SizedBox(
                    height: 60.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50).r,
                    child: CustomButton(
                        //Login Button.........
                        btnname: "LOGIN",
                        btntheam: customBlue,
                        textcolor: white,
                        click: () {
                          // formkey.currentState!.validate();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MechHome(),
                              ));
                        }),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppText(
                          text: "Do you have account ?",
                          weight: FontWeight.w400,
                          size: 13,
                          textcolor: customBalck),
                      SizedBox(
                        width: 10.w,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MechSignup(), // SignUp .......
                              ));
                        },
                        child: const AppText(
                            text: "Sign up",
                            weight: FontWeight.w400,
                            size: 13,
                            textcolor: customBlue),
                      )
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

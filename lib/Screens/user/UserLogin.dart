import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UserHome.dart';
import 'UserSignup.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final username = TextEditingController();
  final password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String? id;
  String? name;
  String? email;
  String? phone;
  String? location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: maincolor,
      body: Padding(
        padding: const EdgeInsets.only(left: 45, right: 45, top: 100).r,
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    width: 140.w,
                    height: 140.h,
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
                        if (value!.isEmpty || value == null) {
                          return "enter username"; // validation.................
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
                        if (value!.isEmpty || value == null) {
                          // validation.................
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
                        btnname: "LOGIN", // Login Button.....
                        btntheam: customBlue,
                        textcolor: white,
                        click: () {
                          if (formkey.currentState!.validate()) {
                            userLogin();
                          }
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserSignup(),
                              )); // SignUp ..................................
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

  void userLogin() async {
    final user = await FirebaseFirestore.instance
        .collection('userSignUp')
        .where('email', isEqualTo: username.text)
        .where('password', isEqualTo: password.text)
        .where('status', isEqualTo: 1)
        .get();
    if (user.docs.isNotEmpty) {
      id = user.docs[0].id;
      name = user.docs[0]['username'];
      email = user.docs[0]['email'];
      phone = user.docs[0]['phone'];
      location = user.docs[0]['location'];
      SharedPreferences data = await SharedPreferences.getInstance();
      data.setString('id', id!);
      data.setString('name', name!);
      data.setString('email', email!);
      data.setString('phone', phone!);
      data.setString('location', location!);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => UserHome(),
          ));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("username and password error")));
    }
  }
}

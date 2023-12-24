import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'adminHome.dart';

class AdminLogin extends StatelessWidget {
  AdminLogin({super.key});

  @override
  final username = TextEditingController();
  final password = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Padding(
        padding: const EdgeInsets.only(left: 45, right: 45, top: 10).r,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 50).r,
              child: Image.asset(
                "assets/logo.png",
                width: 140.w,
                height: 140.h,
              ),
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
                controller: username, // controller...
                validator: (value) {}),
            SizedBox(
              height: 20.h,
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
                hint: "password", // controller...
                controller: password,
                obscure: true,
                validator: (value) {}),
            SizedBox(
              height: 80.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50).r,
              child: CustomButton(
                  btnname: "LOGIN",
                  btntheam: customBlue,
                  textcolor: white,
                  click: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminHome(),
                        )); //Login Function.....
                  }),
            )
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/CustomButton.dart';
import 'package:flutter_application_1/widgets/CustomTextfield.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminLogin extends StatelessWidget {
  AdminLogin({super.key});

  @override
  final username = TextEditingController();
  final password = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Padding(
        padding: const EdgeInsets.only(left: 45, right: 45, top: 100).r,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              "assets/logo.png",
              width: 140.w,
              height: 140.h,
            ),
            SizedBox(
              height: 50.h,
            ),
            AppText(
                text: "LOGIN",
                weight: FontWeight.w700,
                size: 23.sp,
                textcolor: customBalck),
            SizedBox(
              height: 50.h,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: AppText(
                  text: "Enter Username",
                  weight: FontWeight.w500,
                  size: 16.sp,
                  textcolor: customBalck),
            ),
            CustomTextField(
                hint: "username", controller: username, validator: (value) {}),
            SizedBox(
              height: 30.h,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: AppText(
                  text: "Enter Password",
                  weight: FontWeight.w500,
                  size: 16.sp,
                  textcolor: customBalck),
            ),
            CustomTextField(
                hint: "password",
                controller: password,
                Obscure: true,
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
                  click: () {}),
            )
          ]),
        ),
      ),
    );
  }
}

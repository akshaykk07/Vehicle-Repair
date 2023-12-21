import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserSignup extends StatelessWidget {
  UserSignup({super.key});

  @override
  final username = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final experience = TextEditingController();
  final workshop = TextEditingController();
  final password = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: maincolor,
      body: Padding(
        padding: const EdgeInsets.only(left: 45, right: 45).r,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
            AppText(
                text: "SIGN UP",
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
                hint: "Enter Username",
                controller: username,
                validator: (value) {}),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: AppText(
                  text: "Enter Phone number",
                  weight: FontWeight.w500,
                  size: 16.sp,
                  textcolor: customBalck),
            ),
            CustomTextField(
                hint: "Enter Phone number",
                controller: phone,
                kebordtype: TextInputType.number,
                validator: (value) {}),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: AppText(
                  text: "Enter your email",
                  weight: FontWeight.w500,
                  size: 16.sp,
                  textcolor: customBalck),
            ),
            CustomTextField(
                hint: "Enter your email",
                controller: email,
                kebordtype: TextInputType.emailAddress,
                validator: (value) {}),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: AppText(
                  text: "Enter your work experience",
                  weight: FontWeight.w500,
                  size: 16.sp,
                  textcolor: customBalck),
            ),
            CustomTextField(
                hint: "Enter your work experience",
                controller: experience,
                validator: (value) {}),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: AppText(
                  text: "Enter your work shop name",
                  weight: FontWeight.w500,
                  size: 16.sp,
                  textcolor: customBalck),
            ),
            CustomTextField(
                hint: "Enter your work shop name",
                controller: workshop,
                validator: (value) {}),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: AppText(
                  text: "Enter your password",
                  weight: FontWeight.w500,
                  size: 16.sp,
                  textcolor: customBalck),
            ),
            CustomTextField(
                hint: "Enter your password",
                controller: password,
                validator: (value) {}),
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 30).r,
              child: CustomButton(
                  btnname: "LOGIN",
                  btntheam: customBlue,
                  textcolor: white,
                  click: () {}),
            ),
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserLogin extends StatelessWidget {
  UserLogin({super.key});

  @override
  final username = TextEditingController();

  final password = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
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
                obscure: true,
                validator: (value) {}),
            SizedBox(
              height: 20.h,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    // Forgot password......................
                  },
                  child: AppText(
                      text: "Forgot password ?",
                      weight: FontWeight.w400,
                      size: 14.sp,
                      textcolor: customBalck),
                )),
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50).r,
              child: CustomButton(
                  btnname: "LOGIN",
                  btntheam: customBlue,
                  textcolor: white,
                  click: () {}),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                    text: "Do you have account ?",
                    weight: FontWeight.w400,
                    size: 13.sp,
                    textcolor: customBalck),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    // SignUp ..................................
                  },
                  child: AppText(
                      text: "Sign up",
                      weight: FontWeight.w400,
                      size: 13.sp,
                      textcolor: customBlue),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

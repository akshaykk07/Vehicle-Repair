import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MechSignup extends StatefulWidget {
  MechSignup({super.key});

  @override
  State<MechSignup> createState() => _MechSignupState();
}

class _MechSignupState extends State<MechSignup> {
  @override
  final username = TextEditingController();

  final phone = TextEditingController();

  final email = TextEditingController();

  final experience = TextEditingController();

  final workshop = TextEditingController();

  final password = TextEditingController();
  final formkey=GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: maincolor,
      appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: customBalck,
              ))),
      body: Padding(
        padding: const EdgeInsets.only(left: 45, right: 45).r,
        child: SingleChildScrollView(
          child:
              Form(
                key: formkey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                            Padding(
                padding: const EdgeInsets.only(top: 70).r,
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
                  text: "SIGN UP",
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
                  hint: "Enter Username",
                  controller: username,
                  validator: (value) {if(value!.isEmpty||value==null)return "enter username";}),
                            const Align(
                alignment: Alignment.bottomLeft,
                child: AppText(
                    text: "Enter Phone number",
                    weight: FontWeight.w500,
                    size: 16,
                    textcolor: customBalck),
                            ),
                            CustomTextField(
                  hint: "Enter Phone number",
                  controller: phone,
                  kebordtype: TextInputType.number,
                  validator: (value) {}),
                            const Align(
                alignment: Alignment.bottomLeft,
                child: AppText(
                    text: "Enter your email",
                    weight: FontWeight.w500,
                    size: 16,
                    textcolor: customBalck),
                            ),
                            CustomTextField(
                  hint: "Enter your email",
                  controller: email,
                  kebordtype: TextInputType.emailAddress,
                  validator: (value) {}),
                            const Align(
                alignment: Alignment.bottomLeft,
                child: AppText(
                    text: "Enter your work experience",
                    weight: FontWeight.w500,
                    size: 16,
                    textcolor: customBalck),
                            ),
                            CustomTextField(
                  hint: "Enter your work experience",
                  controller: experience,
                  validator: (value) {}),
                            const Align(
                alignment: Alignment.bottomLeft,
                child: AppText(
                    text: "Enter your work shop name",
                    weight: FontWeight.w500,
                    size: 16,
                    textcolor: customBalck),
                            ),
                            CustomTextField(
                  hint: "Enter your work shop name",
                  controller: workshop,
                  validator: (value) {}),
                            const Align(
                alignment: Alignment.bottomLeft,
                child: AppText(
                    text: "Enter your password",
                    weight: FontWeight.w500,
                    size: 16,
                    textcolor: customBalck),
                            ),
                            CustomTextField(
                  hint: "Enter your password",
                  controller: password,
                  validator: (value) {}),
                            Padding(
                padding: const EdgeInsets.only(
                        left: 50, right: 50, bottom: 30, top: 50)
                    .r,
                child: CustomButton(
                    btnname: "SIGN UP",
                    btntheam: customBlue,
                    textcolor: white,
                    click: () {
                      formkey.currentState!.validate();
                      //signUp();
                    }),
                            ),
                          ]),
              ),
        ),
      ),
    );
  }

  Future<void> signUp()async{
 await FirebaseFirestore.instance.collection('mechanicSignUp').add({
   'username':username.text,
   'phone':phone.text,
   'email':email.text,
   'experience':experience.text,
   'workshop':workshop.text,
   'password':password.text,
 });
 username.clear();
 phone.clear();
 email.clear();
 experience.clear();
 workshop.clear();
 password.clear();
  }
}

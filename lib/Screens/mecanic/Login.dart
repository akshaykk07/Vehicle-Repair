import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/mecanic/MechHome.dart';
import 'package:flutter_application_1/Screens/user/Usermain.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  String? id;
  String? name;
  String? email;
  String? phone;
  String? location;
  String? experience;
  String? workshop;
  String? profile;
  bool isLoading = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 45,
          right: 45,
        ).r,
        child: Stack(
          children: [
            SingleChildScrollView(
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
                            if (value!.isEmpty || value == null) {
                              // validation.................
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
                            if (value!.isEmpty || value == null) {
                              // validation.................
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
                              if (formkey.currentState!.validate()) {
                                getDATA();
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
            isLoading == true
                ? Center(child: CircularProgressIndicator())
                : SizedBox()
          ],
        ),
      ),
    );
  }

  getDATA() async {
    setState(() {
      isLoading = true;
    });
    final user = await FirebaseFirestore.instance
        .collection('mechanicSignUp')
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
      experience = user.docs[0]['experience'];
      workshop = user.docs[0]['workshop'];
      profile = user.docs[0]['profileimage'];
      SharedPreferences mecdata = await SharedPreferences.getInstance();
      mecdata.setString('id', id!);
      mecdata.setString('name', name!);
      mecdata.setString('email', email!);
      mecdata.setString('phone', phone!);
      mecdata.setString('location', location!);
      mecdata.setString('workshop', workshop!);
      mecdata.setString('profile', profile!);
      mecdata.setString('experiece', experience!);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MechHome(),
          ));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("username and password error")));
    }
  }
}

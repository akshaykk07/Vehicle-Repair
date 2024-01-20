import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserSignup extends StatefulWidget {
  const UserSignup({super.key});

  @override
  State<UserSignup> createState() => _UserSignupState();
}

class _UserSignupState extends State<UserSignup> {
  final username = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  List<String> locationlist = [
    'Alappuzha',
    'Ernakulam',
    'Idukki',
    'Kannur',
    'Kasaragod',
    'Kollam',
    'Kottayam',
    'Kozhikode',
    'Malappuram',
    'Pathanamthitta',
    'Thiruvananthapuram',
    'Thrissur',
    'Wayanad',
  ];
  String? selectedvalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: customBalck,
              ))),
      backgroundColor: maincolor,
      body: Padding(
        padding: const EdgeInsets.only(left: 45, right: 45).r,
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70).r,
                    child: Image.asset(
                      "assets/logo.png",
                      width: 140.w,
                      height: 140.h,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
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
                      //Custom Textfield..............
                      hint: "Enter Username",
                      controller: username,
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return "enter username"; // validation............
                        }
                      }),
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
                      validator: (value) {
                        if (value?.length != 10) {
                          // validation............
                          return 'Please enter mobile number';
                        }
                      }),
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
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          // validation............
                          return 'Enter a valid email!';
                        }
                      }),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: AppText(
                        text: "Enter Location",
                        weight: FontWeight.w500,
                        size: 16,
                        textcolor: customBalck),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6).r,
                      color: white,
                    ),
                    child: DropdownButton<String>(
                        isExpanded: true,
                        elevation: 0,
                        dropdownColor: lightBlue,
                        hint: const Text("Location"),
                        underline: const SizedBox(),
                        value: selectedvalue,
                        items: locationlist.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (newvalue) {
                          setState(() {
                            selectedvalue = newvalue;
                            print(selectedvalue);
                          });
                        },
                        padding: const EdgeInsets.symmetric(horizontal: 10)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
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
                      obscure: true,
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return "enter password"; // validation............
                        }
                      }),
                      SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 30)
                            .r,
                    child: CustomButton(
                        //sign up button.......
                        btnname: "SIGN UP",
                        btntheam: customBlue,
                        textcolor: white,
                        click: () {
                          if (formkey.currentState!.validate()) {
                            signUp();
                          }
                        }),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    await FirebaseFirestore.instance.collection('userSignUp').add({
      'username': username.text,
      'phone': phone.text,
      'email': email.text,
      'password': password.text,
      'location': selectedvalue,
      'status': 0,
       "profileimage": "https://w1.pngwing.com/pngs/386/684/png-transparent-face-icon-user-icon-design-user-profile-share-icon-avatar-black-and-white-silhouette.png",
    });
    username.clear();
    phone.clear();
    email.clear();
    password.clear();
  }
}

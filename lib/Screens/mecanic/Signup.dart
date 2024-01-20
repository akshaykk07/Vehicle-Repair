import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/mecanic/Login.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MechSignup extends StatefulWidget {
  const MechSignup({super.key});

  @override
  State<MechSignup> createState() => _MechSignupState();
}

class _MechSignupState extends State<MechSignup> {
  final username = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final experience = TextEditingController();
  final workshop = TextEditingController();
  final location = TextEditingController();
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
  String? selectedloc;
  List<String> experieancelist = [
    '1+ year experience',
    '2+ year experience',
    '3+ year experience',
    '4+ year experience',
    '5+ year experience',
  ];
  String? selectedexp;
  bool isLoading = false;
  @override
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
        child: Stack(
          children: [
            SingleChildScrollView(
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
                        height: 40.h,
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
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              // validator.........
                              return "enter username";
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
                              return 'Please enter mobile number'; // validator.........
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
                            // validator.........
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Enter a valid email!';
                            }
                          }),
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: AppText(
                            text: "Enter your work experience",
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
                            hint: const Text("Select experience"),
                            underline: const SizedBox(),
                            value: selectedexp,
                            items: experieancelist.map((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList(),
                            onChanged: (newvalue) {
                              setState(() {
                                selectedexp = newvalue;
                                print(selectedexp);
                              });
                            },
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: AppText(
                            text: "Enter your workshop name",
                            weight: FontWeight.w500,
                            size: 16,
                            textcolor: customBalck),
                      ),
                      CustomTextField(
                          hint: "Enter your workshop name",
                          controller: workshop,
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              // validator.........
                              return "enter Location";
                            }
                          }),
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: AppText(
                            text: "Enter your Location",
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
                            value: selectedloc,
                            items: locationlist.map((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList(),
                            onChanged: (newvalue) {
                              setState(() {
                                selectedloc = newvalue;
                                print(selectedloc);
                              });
                            },
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10)),
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
                          controller: password,
                          obscure: true,
                          validator: (value) {
                            if (value!.isEmpty ||
                                value == null ||
                                value?.length != 6) {
                              // validator.........
                              return "enter min 6 character";
                            }
                          }),
                      Padding(
                        padding: const EdgeInsets.only(
                                left: 50, right: 50, bottom: 30, top: 50)
                            .r,
                        child: CustomButton(
                            btnname: "SIGN UP",
                            btntheam: customBlue,
                            textcolor: white,
                            click: () {
                              // formkey.currentState!.validate();
                              signUp();
                            }),
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

  Future<void> signUp() async {
    setState(() {
      isLoading = true;
    });
    await FirebaseFirestore.instance.collection('mechanicSignUp').add({
      'username': username.text,
      'phone': phone.text,
      'email': email.text,
      'experience': selectedexp,
      'workshop': workshop.text,
      'location': selectedloc,
      'password': password.text,
      'status': 0,
      "profileimage":
          "https://static.vecteezy.com/system/resources/thumbnails/002/387/693/small/user-profile-icon-free-vector.jpg",
    }).then((value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MechLogin(),
        )));
    username.clear();
    phone.clear();
    email.clear();
    workshop.clear();
    password.clear();
  }
}

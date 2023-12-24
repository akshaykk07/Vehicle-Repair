import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});

  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();

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
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35).r,
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 100.h,),
            CircleAvatar(
              radius: 50.r,
              backgroundImage: const AssetImage("assets/admin.png"),
            ),
            SizedBox(
              height: 10.h,
            ),
            const AppText(
                text: "Name",
                weight: FontWeight.w500,
                size: 10,
                textcolor: customBalck),
            SizedBox(
              height: 50.h,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                    text: "Enter your Name",
                    weight: FontWeight.w400,
                    size: 14,
                    textcolor: customBalck)),
            CustomTextField(
                hint: "Name",
                fillcolor: maincolor,
                controller: name,
                validator: (value) {}),
            const Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                    text: "Enter you phone number",
                    weight: FontWeight.w400,
                    size: 14,
                    textcolor: customBalck)),
            CustomTextField(
                hint: "phone number",
                fillcolor: maincolor,
                controller: name,
                validator: (value) {}),
            const Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                    text: "Enter your email",
                    weight: FontWeight.w400,
                    size: 14,
                    textcolor: customBalck)),
            CustomTextField(
                hint: "email",
                fillcolor: maincolor,
                controller: name,
                validator: (value) {}),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 150).r,
              child: CustomButton(
                  btnname: "Done", //Custom Button......
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

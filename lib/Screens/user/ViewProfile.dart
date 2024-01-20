import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile(
      {super.key,
      required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.location,
      required this.image});
  final id;
  final name;
  final email;
  final phone;
  final location;
  final image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteone,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const AppText(
            text: "My Profile",
            weight: FontWeight.w500,
            size: 20,
            textcolor: customBalck),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35).r,
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 100.h,
            ),
            CircleAvatar(
              radius: 50.r,
              backgroundImage: NetworkImage(image.toString()),
            ),
            SizedBox(
              height: 10.h,
            ),
            AppText(
                text: name.toString(),
                weight: FontWeight.w500,
                size: 20,
                textcolor: customBalck),
            SizedBox(
              height: 50.h,
            ),
            CustomTextField(
              hint: "Name",
              fillcolor: white,
              controller: TextEditingController(text: name),
              validator: (value) {},
              readonly: true,
            ),
            CustomTextField(
              hint: "",
              fillcolor: white,
              controller: TextEditingController(text: phone),
              validator: (value) {},
              readonly: true,
            ),
            CustomTextField(
              hint: "email",
              fillcolor: white,
              controller: TextEditingController(text: email),
              validator: (value) {},
              readonly: true,
            ),
            CustomTextField(
              hint: "",
              fillcolor: white,
              controller: TextEditingController(text: location),
              validator: (value) {},
              readonly: true,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 20).r,
              child: CustomButton(
                  btnname: "Back", //Custom Button......
                  btntheam: customBalck,
                  textcolor: white,
                  click: () {
                    Navigator.pop(context);
                  }),
            )
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/customTextfield.dart';

class AddNotification extends StatelessWidget {
  AddNotification({super.key});

  @override
  final matter = TextEditingController();
  final content = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: customBalck,
          ),
        ),
      ),
      backgroundColor: lightBlue,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20).r,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
            const Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                    text: "Enter Matter",
                    weight: FontWeight.w500,
                    size: 16,
                    textcolor: customBalck)),
            CustomTextField(
              hint: "enter matter",
              controller: matter,
              validator: (value) {},
              fillcolor: white,
            ),
            SizedBox(
              height: 30.h,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                    text: "Enter Content",
                    weight: FontWeight.w500,
                    size: 16,
                    textcolor: customBalck)),
            Padding(
              padding: const EdgeInsets.only(top: 10).r,
              child: TextFormField(
                controller: content,
                decoration: const InputDecoration(
                    hintText: "Contents...",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: white)),
                    fillColor: white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: white))),
                maxLines: 10,
                keyboardType: TextInputType.multiline,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 60,bottom: 30).r,
              child: CustomButton(
                  btnname: "Submit",
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

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminUser extends StatelessWidget {
  AdminUser({super.key});

  @override
  final username = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40).r,
        child: Container(
            height: double.infinity,
            width: double.infinity,
            color: white,
            child: Padding(
              padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 15, bottom: 30)
                  .r,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: customBalck,
                                ))),
                        CircleAvatar(
                          radius: 60.r,
                          backgroundColor: lightBlue,
                          child: Image.asset(
                            "assets/pro.png",
                            width: 80.w,
                            height: 80.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        AppText(
                            text: "Name",
                            weight: FontWeight.w600,
                            size: 18.sp,
                            textcolor: customBalck),
                        AppText(
                            text: "Location",
                            weight: FontWeight.w600,
                            size: 18.sp,
                            textcolor: customBalck),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30).r,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: AppText(
                                  text: "Username",
                                  weight: FontWeight.w500,
                                  size: 16.sp,
                                  textcolor: customBalck)),
                          CustomTextField(
                            hint: "name",
                            controller: username,
                            validator: (value) {},
                            fillcolor: lightBlue,
                            readonly: true,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: AppText(
                                  text: "Phone number",
                                  weight: FontWeight.w500,
                                  size: 16.sp,
                                  textcolor: customBalck)),
                          CustomTextField(
                            hint: "phone number",
                            controller: phone,
                            validator: (value) {},
                            fillcolor: lightBlue,
                            readonly: true,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: AppText(
                                  text: "email adders",
                                  weight: FontWeight.w500,
                                  size: 16.sp,
                                  textcolor: customBalck)),
                          CustomTextField(
                            hint: "email",
                            controller: email,
                            validator: (value) {},
                            fillcolor: lightBlue,
                            readonly: true,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CustomButton(
                                btnname: "Accept",
                                btntheam: maincolor,
                                textcolor: white,
                                click: () {})),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: CustomButton(
                                btnname: "reject",
                                btntheam: lightred,
                                textcolor: white,
                                click: () {})),
                      ],
                    )
                  ]),
            )),
      ),
    );
  }
}
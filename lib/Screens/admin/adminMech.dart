import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminMechanic extends StatelessWidget {
  AdminMechanic({super.key});

  @override
  final username = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final experience = TextEditingController();
  final workshop = TextEditingController();
  final location = TextEditingController();

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
              child: SingleChildScrollView(
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
                          SizedBox(
                            height: 10.h,
                          ),
                          AppText(
                              text: "Name",
                              weight: FontWeight.w600,
                              size: 18.sp,
                              textcolor: customBalck),
                          SizedBox(
                            height: 20.h,
                          ),
                          RatingBar.builder(
                            initialRating: 3,
                            itemSize: 25,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          AppText(
                              text: "Location",
                              weight: FontWeight.w600,
                              size: 18.sp,
                              textcolor: customBalck),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 30,
                        ).r,
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: AppText(
                                    text: "Mechanic Username",
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
                              height: 20.h,
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
                              height: 20.h,
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
                            SizedBox(
                              height: 20.h,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: AppText(
                                    text: "work experience",
                                    weight: FontWeight.w500,
                                    size: 16.sp,
                                    textcolor: customBalck)),
                            CustomTextField(
                              hint: "work experience",
                              controller: experience,
                              validator: (value) {},
                              fillcolor: lightBlue,
                              readonly: true,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: AppText(
                                    text: "workshop name",
                                    weight: FontWeight.w500,
                                    size: 16.sp,
                                    textcolor: customBalck)),
                            CustomTextField(
                              hint: "workshop name",
                              controller: workshop,
                              validator: (value) {},
                              fillcolor: lightBlue,
                              readonly: true,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: AppText(
                                    text: "your location",
                                    weight: FontWeight.w500,
                                    size: 16.sp,
                                    textcolor: customBalck)),
                            CustomTextField(
                              hint: "your location",
                              controller: location,
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
                                  btntheam: tabcolor,
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
              ),
            )),
      ),
    );
  }
}

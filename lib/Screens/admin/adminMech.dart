import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/provider/statusProvider.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AdminMechanic extends StatelessWidget {
  AdminMechanic({super.key, this.id});

  final id;

  final mechanicdata = FirebaseFirestore.instance.collection('mechanicSignUp');
  Widget build(BuildContext context) {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>1");
    final sts = Provider.of<StatusProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: lightBlue,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40).r,
        child: Container(
            height: double.infinity,
            width: double.infinity,
            color: white,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 30)
                      .r,
              child: SingleChildScrollView(
                child: StreamBuilder(
                    stream: mechanicdata.doc(id).snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Text("Error${snapshot.error}");
                      }

                      return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 15.h,
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
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
                                    text: snapshot.data!['username'],
                                    weight: FontWeight.w600,
                                    size: 18,
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
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                const AppText(
                                    text: "Location",
                                    weight: FontWeight.w600,
                                    size: 18,
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
                                  const Align(
                                      alignment: Alignment.centerLeft,
                                      child: AppText(
                                          text: "Mechanic Username",
                                          weight: FontWeight.w500,
                                          size: 16,
                                          textcolor: customBalck)),
                                  CustomTextField(
                                    hint: "name",
                                    controller: TextEditingController(
                                        text: snapshot.data!['username']),
                                    validator: (value) {},
                                    fillcolor: lightBlue,
                                    readonly: true,
                                  ),
                                  const Align(
                                      alignment: Alignment.centerLeft,
                                      child: AppText(
                                          text: "Phone number",
                                          weight: FontWeight.w500,
                                          size: 16,
                                          textcolor: customBalck)),
                                  CustomTextField(
                                    hint: "phone number",
                                    controller: TextEditingController(
                                        text: snapshot.data!['phone']),
                                    validator: (value) {},
                                    fillcolor: lightBlue,
                                    readonly: true,
                                  ),
                                  const Align(
                                      alignment: Alignment.centerLeft,
                                      child: AppText(
                                          text: "email adders",
                                          weight: FontWeight.w500,
                                          size: 16,
                                          textcolor: customBalck)),
                                  CustomTextField(
                                    hint: "email",
                                    controller: TextEditingController(
                                        text: snapshot.data!['email']),
                                    validator: (value) {},
                                    fillcolor: lightBlue,
                                    readonly: true,
                                  ),
                                  const Align(
                                      alignment: Alignment.centerLeft,
                                      child: AppText(
                                          text: "work experience",
                                          weight: FontWeight.w500,
                                          size: 16,
                                          textcolor: customBalck)),
                                  CustomTextField(
                                    hint: "work experience",
                                    controller: TextEditingController(
                                        text: snapshot.data!['experience']),
                                    validator: (value) {},
                                    fillcolor: lightBlue,
                                    readonly: true,
                                  ),
                                  const Align(
                                      alignment: Alignment.centerLeft,
                                      child: AppText(
                                          text: "workshop name",
                                          weight: FontWeight.w500,
                                          size: 16,
                                          textcolor: customBalck)),
                                  CustomTextField(
                                    hint: "workshop name",
                                    controller: TextEditingController(
                                        text: snapshot.data!['workshop']),
                                    validator: (value) {},
                                    fillcolor: lightBlue,
                                    readonly: true,
                                  ),
                                  const Align(
                                      alignment: Alignment.centerLeft,
                                      child: AppText(
                                          text: "your location",
                                          weight: FontWeight.w500,
                                          size: 16,
                                          textcolor: customBalck)),
                                  CustomTextField(
                                    hint: "your location",
                                    controller: TextEditingController(),
                                    validator: (value) {},
                                    fillcolor: lightBlue,
                                    readonly: true,
                                  ),
                                ],
                              ),
                            ),
                            snapshot.data!['status'] == 0
                                ? Row(
                                    children: [
                                      Expanded(
                                          child: CustomButton(
                                              btnname: "Accept",
                                              btntheam: tabcolor,
                                              textcolor: white,
                                              click: () {
                                                sts.accept(
                                                    //statusProvider.............
                                                    id,
                                                    'mechanicSignUp');
                                              })),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          child: CustomButton(
                                              btnname: "reject",
                                              btntheam: lightred,
                                              textcolor: white,
                                              click: () {
                                                sts.reject(
                                                    //statusProvider.............
                                                    id,
                                                    'mechanicSignUp');
                                              })),
                                    ],
                                  )
                                : snapshot.data!['status'] == 1
                                    ? CustomButton(
                                        btnname: "Accepted",
                                        btntheam: Colors.green,
                                        textcolor: white,
                                        click: () {})
                                    : CustomButton(
                                        btnname: "Rejected",
                                        btntheam: Colors.red,
                                        textcolor: white,
                                        click: () {})
                          ]);
                    }),
              ),
            )),
      ),
    );
  }
}

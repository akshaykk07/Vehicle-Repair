import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/provider/statusProvider.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AdminUser extends StatelessWidget {
  AdminUser({super.key, required this.id});
  final id;

  final userdata = FirebaseFirestore.instance.collection('userSignUp');

  @override
  Widget build(BuildContext context) {
    final sts = Provider.of<StatusProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: lightBlue,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40).r,
        child: StreamBuilder(
            stream: userdata.doc(id).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text('Error${snapshot.error}');
              }

              return Container(
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
                              const AppText(
                                  text: "Location",
                                  weight: FontWeight.w600,
                                  size: 18,
                                  textcolor: customBalck),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30).r,
                            child: Column(
                              children: [
                                const Align(
                                    alignment: Alignment.centerLeft,
                                    child: AppText(
                                        text: "Username",
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
                                SizedBox(
                                  height: 10.h,
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
                                SizedBox(
                                  height: 10.h,
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
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20, right: 20).r,
                            child: snapshot.data!['status'] == 0
                                ? Row(
                                    children: [
                                      Expanded(
                                          child: CustomButton(
                                              btnname: "Accept",
                                              btntheam: tabcolor,
                                              textcolor: white,
                                              click: () {
                                                sts.accept(id,'userSignUp');
                                                // accept(widget.id);
                                              })),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Expanded(
                                          child: CustomButton(
                                              btnname: "reject",
                                              btntheam: lightred,
                                              textcolor: white,
                                              click: () {
                                                sts.reject(id,'userSignUp');
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
                                        click: () {}),
                          )
                        ]),
                  ));
            }),
      ),
    );
  }
}

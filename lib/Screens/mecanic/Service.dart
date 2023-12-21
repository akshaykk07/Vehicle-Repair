import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/serviceTale.dart';

class Services extends StatelessWidget {
  Services({super.key});

  final service = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20).r,
            child: const Icon(
              Icons.arrow_back_ios,
              color: customBalck,
            ),
          ),
          backgroundColor: maincolor,
          title: AppText(
              text: "Service",
              weight: FontWeight.w400,
              size: 20.sp,
              textcolor: customBalck),
          centerTitle: true),
      body: Padding(
          padding: const EdgeInsets.only(left: 28, right: 28, top: 20).r,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return const ServiceTale(
                title: "Tyre puncture service ",
              );
            },
            itemCount: 5,
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          add(context);
        },
        shape: const CircleBorder(
          side: BorderSide(color: customBalck),
        ),
        backgroundColor: white,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> add(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            height: 330.h,
            width: 300.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: maincolor),
            child: Padding(
              padding: const EdgeInsets.all(20).r,
              child: Padding(
                padding: const EdgeInsets.all(15).r,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                          text: "Add service",
                          weight: FontWeight.w500,
                          size: 20.sp,
                          textcolor: customBalck),
                      Padding(
                        padding: const EdgeInsets.only(top: 40).r,
                        child: CustomTextField(
                            hint: "service",
                            controller: service,
                            validator: (value) {}),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 30, right: 30, top: 40).r,
                        child: CustomButton(
                            btnname: "Add",
                            btntheam: customBlue,
                            textcolor: white,
                            click: () {}),
                      )
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color.dart';
import 'apptext.dart';

class UserRequestTile extends StatelessWidget {
  UserRequestTile({
    super.key,
    required this.name,
    required this.date,
    required this.time,
    required this.issue,
    this.status = 0,
  });

  final String name;
  final String date;
  final String time;
  final String issue;
  var status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15).r,
      child: Container(
        height: 122.h,
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5.0,
              offset: const Offset(0.0, 3.0)),
        ], borderRadius: BorderRadius.circular(15).r, color: Colors.teal),
        child: Row(children: [
          Expanded(
              child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 20).r,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                        text: name,
                        weight: FontWeight.w400,
                        size: 14,
                        textcolor: white),
                    AppText(
                        text: date,
                        weight: FontWeight.w400,
                        size: 14,
                        textcolor: white),
                    AppText(
                        text: time,
                        weight: FontWeight.w400,
                        size: 14,
                        textcolor: white),
                    AppText(
                        text: issue,
                        weight: FontWeight.w400,
                        size: 14,
                        textcolor: white)
                  ]),
            ),
          )),
          SizedBox(
            width: 150.w,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: status == 0
                  ? Container(
                      height: 30,
                      width: 110.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10).r,
                          color: Colors.teal),
                      child: const Center(
                        child: AppText(
                            text: "Pending",
                            weight: FontWeight.w400,
                            size: 14,
                            textcolor: white),
                      ))
                  : status == 1
                      ? Container(
                          height: 30,
                          width: 110.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10).r,
                              color: white),
                          child: const Center(
                            child: AppText(
                                text: "Approved",
                                weight: FontWeight.w400,
                                size: 14,
                                textcolor: Colors.green),
                          ))
                      : Container(
                          height: 30,
                          width: 110.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10).r,
                              color: white),
                          child: const Center(
                            child: AppText(
                                text: "Rejected",
                                weight: FontWeight.w400,
                                size: 14,
                                textcolor: Colors.redAccent),
                          )),
            ),
          )
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color.dart';
import 'apptext.dart';

class ServiceTale extends StatelessWidget {
  const ServiceTale({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10).r,
      child: Container(
        height: 80.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15).r, color: maincolor),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20).r,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Flexible(
              child: AppText(
                  text: title,
                  weight: FontWeight.w400,
                  size: 13,
                  textcolor: customBalck),
            ),
            InkWell(
              onTap: () {
                //delete...........
              },
              child: const Icon(
                Icons.delete,
                color: customBalck,
              ),
            )
          ]),
        ),
      ),
    );
  }
}

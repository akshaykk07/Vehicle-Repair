import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color.dart';
import 'apptext.dart';

class ServiceTile extends StatelessWidget {
  const ServiceTile({
    super.key,
    required this.title,
    required this.click,
  });

  final String title;
  final void Function() click;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10).r,
      child: Container(
        height: 80.h,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5.0,
              offset: const Offset(0.0, 3.0)),
        ], borderRadius: BorderRadius.circular(15).r, color: white),
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
              onTap: click,
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

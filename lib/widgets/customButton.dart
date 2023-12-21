import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.btnname,
    required this.btntheam,
    required this.textcolor,
    required this.click,
    this.height = 50,
  });

  final String btnname;
  final Color btntheam;
  final Color textcolor;
  final double height;
  final void Function() click;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: Container(
        height: height.h,
        width: double.infinity.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8).r,
          color: btntheam,
        ),
        child: Center(
          child: AppText(
              text: btnname,
              textcolor: textcolor,
              size: 16.sp,
              weight: FontWeight.w700),
        ),
      ),
    );
  }
}

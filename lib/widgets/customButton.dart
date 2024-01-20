import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, //Custom Button......
    required this.btnname,
    required this.btntheam,
    required this.textcolor,
    required this.click,
    this.height = 50,
    this.textsize = 16,
    this.outline = false,
  });

  final String btnname;
  final Color btntheam;
  final Color textcolor;
  final double height;
  final double textsize;
  final bool outline;
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
          border: Border.all(color: outline == true ? offblack : btntheam),
          color: btntheam,
        ),
        child: Center(
          child: AppText(
              text: btnname,
              textcolor: textcolor,
              size: textsize.sp,
              weight: FontWeight.w700),
        ),
      ),
    );
  }
}

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    super.key, //Custom Button......
    required this.btnname,
    required this.btntheam,
    required this.textcolor,
    required this.click,
    this.height = 50,
    this.textsize = 16,
    this.outline = false,
    required this.icon,
  });

  final String btnname;
  final Color btntheam;
  final Color textcolor;
  final double height;
  final double textsize;
  final bool outline;
  final IconData icon;
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
          border: Border.all(color: outline == true ? offblack : btntheam),
          color: btntheam,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(
              width: 10.h,
            ),
            AppText(
                text: btnname,
                textcolor: textcolor,
                size: textsize.sp,
                weight: FontWeight.w700),
          ],
        ),
      ),
    );
  }
}

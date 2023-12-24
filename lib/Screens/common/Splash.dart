import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Center(
        child: Image.asset(
          "assets/logo.png",
          width: 160.w,
          height: 160.h,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

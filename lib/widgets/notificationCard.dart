import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color.dart';
import 'apptext.dart';

class NotifiactionCard extends StatelessWidget {
  const NotifiactionCard({
    super.key,
    required this.title,
    required this.time,
    required this.date,
  });

  final String title;
  final String time;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
      shape: OutlineInputBorder(
          borderSide: const BorderSide(color: customBalck),
          borderRadius: BorderRadius.circular(12).r),
      child: Padding(
        padding: const EdgeInsets.all(10).r,
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          AppText(
              text: time,
              weight: FontWeight.w400,
              size: 12,
              textcolor: customBalck),
          Padding(
            padding: const EdgeInsets.only(right: 10).r,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: Colors.grey),
                )),
          ),
          AppText(
              text: date,
              weight: FontWeight.w400,
              size: 12,
              textcolor: Colors.grey),
        ]),
      ),
    );
  }
}

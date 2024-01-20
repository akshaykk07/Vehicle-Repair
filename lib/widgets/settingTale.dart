import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingTale extends StatelessWidget {
  const SettingTale({
    super.key,
    required this.iconslist,
    required this.talename,
    required this.click,
  });

  final iconslist;
  final talename;
  final void Function() click;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: Padding(
        padding: const EdgeInsets.only(top: 10).r,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10).r,
            color: whiteone,
          ),
          child: Row(children: [
            SizedBox(
              width: 80.w,
              child: CircleAvatar(
                  radius: 25,
                  backgroundColor: white,
                  child: Center(child: iconslist)),
            ),
            Expanded(child: SizedBox(width: 80.w, child: talename)),
            SizedBox(
              width: 40.w,
              child: Center(
                  child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.grey[400],
              )),
            ),
          ]),
        ),
      ),
    );
  }
}

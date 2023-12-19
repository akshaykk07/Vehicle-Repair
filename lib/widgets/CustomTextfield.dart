import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.kebordtype = TextInputType.text,
    required this.controller,
    required this.validator,
    this.Obscure = false,
    this.fillcolor = white,
  });

  final String hint;
  final TextInputType kebordtype;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool Obscure;
  final Color fillcolor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8).r,
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: Obscure,
        decoration: InputDecoration(
            fillColor: fillcolor,
            filled: true,
            hintText: hint,
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: customGrey),
                borderRadius: BorderRadius.circular(8).r),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: customGrey),
                borderRadius: BorderRadius.circular(8).r),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: customGrey))),
      ),
    );
  }
}

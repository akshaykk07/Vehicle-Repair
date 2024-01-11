import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    // custom TextField........
    super.key,
    required this.hint,
    this.kebordtype = TextInputType.text,
    required this.controller,
    required this.validator,
    this.obscure = false,
    this.fillcolor = white,
    this.readonly = false, this.onChanged,
  });

  final String hint;
  final TextInputType kebordtype;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool readonly;
  final Color fillcolor;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 15).r,
      child: TextFormField(
        keyboardType: kebordtype,
        controller: controller,
        validator: validator,
        obscureText: obscure,
        readOnly: readonly,
        onChanged:onChanged,
        decoration: InputDecoration(
            fillColor: fillcolor,
            filled: true,
            hintText: hint,
            contentPadding:
                EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
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

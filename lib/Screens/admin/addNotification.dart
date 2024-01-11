import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../widgets/customTextfield.dart';

class AddNotification extends StatefulWidget {
  const AddNotification({super.key});

  @override
  State<AddNotification> createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {
  final formkey = GlobalKey<FormState>();

  final matter = TextEditingController();

  final content = TextEditingController();

  final date = DateTime.now();

  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: customBalck,
          ),
        ),
      ),
      backgroundColor: lightBlue,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20).r,
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                          text: "Enter Matter",
                          weight: FontWeight.w500,
                          size: 16,
                          textcolor: customBalck)),
                  CustomTextField(
                    hint: "enter matter",
                    controller: matter,
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return "enter matter";
                      }
                      return null;
                    },
                    fillcolor: white,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                          text: "Enter Content",
                          weight: FontWeight.w500,
                          size: 16,
                          textcolor: customBalck)),
                  Padding(
                    padding: const EdgeInsets.only(top: 10).r,
                    child: TextFormField(
                      controller: content,
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return "enter contents";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Contents...",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: white)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: white)),
                          fillColor: white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: white))),
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                            left: 50, right: 50, top: 60, bottom: 30)
                        .r,
                    child: CustomButton(
                        btnname: "Submit",
                        btntheam: customBlue,
                        textcolor: white,
                        click: () {
                          if (formkey.currentState!.validate()) {
                            addNotifiaction();
                            Navigator.pop(context);
                          }
                        }),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  Future addNotifiaction() async {
    await FirebaseFirestore.instance.collection('Notification').add({
      'heading': matter.text,
      'content': content.text,
      'time': time.format(context),
      'date': DateFormat('dd/mm/yy').format(date)
    });
  }
}

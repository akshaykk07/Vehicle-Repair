import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

String? id;
String? name;
String? email;
String? phone;
String? location;
bool edit = false;

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    userData();
    super.initState();
  }

  final nameconrollor = TextEditingController();
  final phoneconrollor = TextEditingController();
  final emailconrollor = TextEditingController();
  final locationconrollor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameconrollor.text = name!;
    emailconrollor.text = email!;
    phoneconrollor.text = phone!;
    locationconrollor.text = location!;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: customBalck,
            )),
        centerTitle: true,
        title: edit == true
            ? const AppText(
                text: "Edit Profile",
                weight: FontWeight.w500,
                size: 20,
                textcolor: customBalck)
            : const SizedBox(),
        actions: [
          edit == false
              ? InkWell(
                  onTap: () {
                    setState(() {
                      edit = true;
                    });
                  },
                  child: const Icon(
                    Icons.edit_note_outlined,
                    color: customBalck,
                    size: 30,
                  ),
                )
              : const SizedBox(),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35).r,
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 100.h,
            ),
            CircleAvatar(
              radius: 50.r,
              backgroundImage: const AssetImage("assets/admin.png"),
            ),
            SizedBox(
              height: 10.h,
            ),
            AppText(
                text: name.toString(),
                weight: FontWeight.w500,
                size: 20,
                textcolor: customBalck),
            SizedBox(
              height: 50.h,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                    text: "Enter your Name",
                    weight: FontWeight.w400,
                    size: 14,
                    textcolor: customBalck)),
            CustomTextField(
              hint: "Name",
              fillcolor: edit == false ? maincolor : Colors.grey.shade400,
              controller: nameconrollor,
              validator: (value) {},
              readonly: edit == false ? true : false,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                    text: "Enter you phone number",
                    weight: FontWeight.w400,
                    size: 14,
                    textcolor: customBalck)),
            CustomTextField(
              hint: "",
              fillcolor: edit == false ? maincolor : Colors.grey.shade400,
              controller: phoneconrollor,
              validator: (value) {},
              readonly: edit == false ? true : false,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                    text: "Enter your email",
                    weight: FontWeight.w400,
                    size: 14,
                    textcolor: customBalck)),
            CustomTextField(
              hint: "email",
              fillcolor: edit == false ? maincolor : Colors.grey.shade400,
              controller: emailconrollor,
              validator: (value) {},
              readonly: edit == false ? true : false,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                    text: "Enter Location",
                    weight: FontWeight.w400,
                    size: 14,
                    textcolor: customBalck)),
            CustomTextField(
              hint: "",
              fillcolor: edit == false ? maincolor : Colors.grey.shade400,
              controller: locationconrollor,
              validator: (value) {},
              readonly: edit == false ? true : false,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 50).r,
              child: edit == false
                  ? CustomButton(
                      btnname: "Done", //Custom Button......
                      btntheam: customBlue,
                      textcolor: white,
                      click: () {})
                  : CustomButton(
                      btnname: "Edit", //Custom Button......
                      btntheam: Colors.green,
                      textcolor: white,
                      click: () {
                        updateData();
                      }),
            )
          ]),
        ),
      ),
    );
  }

  userData() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    setState(() {
      id = data.getString('id');
      name = data.getString('name');
      email = data.getString('email');
      phone = data.getString('phone');
      location = data.getString('location');
      edit = false;
    });
  }

  updateData() async {
    await FirebaseFirestore.instance.collection('userSignUp').doc(id).update({
      "username": nameconrollor.text,
      "email": emailconrollor.text,
      "phone": phoneconrollor.text,
      'location': locationconrollor.text,
    });

    SharedPreferences data = await SharedPreferences.getInstance();
    data.setString('name', nameconrollor.text);
    data.setString('email', emailconrollor.text);
    data.setString('phone', phoneconrollor.text);
    data.setString('location', locationconrollor.text);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }
}

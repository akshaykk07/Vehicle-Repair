import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_application_1/widgets/customTextfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    userData();
    super.initState();
  }

  final nameconrollor = TextEditingController();
  final phoneconrollor = TextEditingController();
  final emailconrollor = TextEditingController();
  final locationconrollor = TextEditingController();
  File? selectImage;
  XFile? img;
  String? imageurl;

  String? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? location;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    nameconrollor.text = name!;
    emailconrollor.text = email!;
    phoneconrollor.text = phone!;
    locationconrollor.text = location!;
    return Scaffold(
      backgroundColor: whiteone,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const AppText(
            text: "Edit Profile",
            weight: FontWeight.w500,
            size: 20,
            textcolor: customBalck),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35).r,
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 100.h,
                ),
                selectImage != null
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(selectImage!),
                      )
                    : CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          image.toString(),
                        ),
                      ),
                SizedBox(
                  height: 5.h,
                ),
                TextButton(
                    onPressed: () {
                      pickImage();
                    },
                    child: const Text("Edit Image")),
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
                  hint: "",
                  fillcolor: white,
                  controller: nameconrollor,
                  validator: (value) {},
                  readonly: false,
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
                  fillcolor: white,
                  controller: phoneconrollor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      "enter your phone no";
                    }
                  },
                  readonly: false,
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                        text: "Enter your email",
                        weight: FontWeight.w400,
                        size: 14,
                        textcolor: customBalck)),
                CustomTextField(
                  hint: "",
                  fillcolor: white,
                  controller: emailconrollor,
                  validator: (value) {},
                  readonly: false,
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
                  fillcolor: white,
                  controller: locationconrollor,
                  validator: (value) {},
                  readonly: false,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 50, right: 50, top: 20).r,
                  child: CustomButton(
                      btnname: "Save", //Custom Button......
                      btntheam: customBalck,
                      textcolor: white,
                      click: () {
                        updateData();
                      }),
                )
              ]),
            ),
          ),
          isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(
                  color: customBalck,
                ))
              : const SizedBox()
        ],
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
      image = data.getString("profile");
    });
  }

  updateData() async {
    if (selectImage != null) {
      Reference reference =
          FirebaseStorage.instance.ref().child('profile/${img!.name}');
      await reference.putFile(File(selectImage!.path));
      imageurl = await reference.getDownloadURL();
      await FirebaseFirestore.instance.collection('userSignUp').doc(id).update({
        "username": nameconrollor.text,
        "email": emailconrollor.text,
        "phone": phoneconrollor.text,
        'location': locationconrollor.text,
        "profileimage": imageurl,
      });

      SharedPreferences data = await SharedPreferences.getInstance();
      setState(() {
        data.setString('name', nameconrollor.text);
        data.setString('email', emailconrollor.text);
        data.setString('phone', phoneconrollor.text);
        data.setString('profile', imageurl.toString());
        data
            .setString('location', locationconrollor.text)
            .then((value) => Navigator.pop(context));
      });
    } else {
      await FirebaseFirestore.instance.collection('userSignUp').doc(id).update({
        "username": nameconrollor.text,
        "email": emailconrollor.text,
        "phone": phoneconrollor.text,
        'location': locationconrollor.text,
        "profileimage": image,
      });

      SharedPreferences data = await SharedPreferences.getInstance();
      setState(() {
        data.setString('name', nameconrollor.text);
        data.setString('email', emailconrollor.text);
        data.setString('phone', phoneconrollor.text);
        data.setString('profile', image.toString());
        data
            .setString('location', locationconrollor.text)
            .then((value) => Navigator.pop(context));
      });
    }
  }

  pickImage() async {
    img = (await ImagePicker().pickImage(source: ImageSource.gallery))!;
    if (img != null) {
      setState(() {
        selectImage = File(img!.path);
      });
    } else {
      print("image errror");
    }
  }
}

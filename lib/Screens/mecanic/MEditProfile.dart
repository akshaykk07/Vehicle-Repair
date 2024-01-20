import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/mecanic/MechHome.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/apptext.dart';
import '../../widgets/customTextfield.dart';

class MEditProfile extends StatefulWidget {
  const MEditProfile({
    super.key,
  });
  @override
  State<MEditProfile> createState() => _MEditProfileState();
}

class _MEditProfileState extends State<MEditProfile> {
  @override
  void initState() {
    getMechdata();
    super.initState();
  }

  String? username;
  String? phone;
  String? email;
  String? experience;
  String? workshop;
  String? location;
  String? id;
  String? image;
  final usernamecontrollor = TextEditingController();
  final phonecontrollor = TextEditingController();
  final emailcontrollor = TextEditingController();
  final experiencecontrollor = TextEditingController();
  final workshopcontrollor = TextEditingController();
  final locationcontrollor = TextEditingController();
  File? selectImage;
  XFile? img;
  String? imageurl;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    usernamecontrollor.text = username!;
    phonecontrollor.text = phone!;
    emailcontrollor.text = email!;
    experiencecontrollor.text = experience!;
    workshopcontrollor.text = workshop!;
    locationcontrollor.text = location!;
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
            text: "Edit Profile",
            weight: FontWeight.w400,
            size: 20,
            textcolor: white),
        centerTitle: true,
        backgroundColor: offblack,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20).r,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: whiteone,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40).r,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
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
                    TextButton(
                        onPressed: () {
                          pickImage();
                        },
                        child: const Text("Edit image")),
                    Padding(
                      padding: const EdgeInsets.only(top: 20).r,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: AppText(
                            text: "Enter Username",
                            weight: FontWeight.w500,
                            size: 16.sp,
                            textcolor: customBalck),
                      ),
                    ),
                    CustomTextField(
                        hint: "Enter Username",
                        fillcolor: white,
                        controller: usernamecontrollor,
                        validator: (value) {}),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: AppText(
                          text: "Enter Phone number",
                          weight: FontWeight.w500,
                          size: 16.sp,
                          textcolor: customBalck),
                    ),
                    CustomTextField(
                        hint: "Enter Phone number",
                        fillcolor: white,
                        controller: phonecontrollor,
                        kebordtype: TextInputType.number,
                        validator: (value) {}),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: AppText(
                          text: "Enter your email",
                          weight: FontWeight.w500,
                          size: 16.sp,
                          textcolor: customBalck),
                    ),
                    CustomTextField(
                        hint: "Enter your email",
                        fillcolor: white,
                        controller: emailcontrollor,
                        kebordtype: TextInputType.emailAddress,
                        validator: (value) {}),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: AppText(
                          text: "Enter your work experience",
                          weight: FontWeight.w500,
                          size: 16.sp,
                          textcolor: customBalck),
                    ),
                    CustomTextField(
                        hint: "Enter your work experience",
                        fillcolor: white,
                        controller: experiencecontrollor,
                        validator: (value) {}),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: AppText(
                          text: "Enter your work shop name",
                          weight: FontWeight.w500,
                          size: 16.sp,
                          textcolor: customBalck),
                    ),
                    CustomTextField(
                        hint: "Enter your work shop name",
                        fillcolor: white,
                        controller: workshopcontrollor,
                        validator: (value) {}),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: AppText(
                          text: "Enter your location",
                          weight: FontWeight.w500,
                          size: 16.sp,
                          textcolor: customBalck),
                    ),
                    CustomTextField(
                        hint: "Enter your location",
                        fillcolor: white,
                        controller: locationcontrollor,
                        validator: (value) {}),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 50).r,
                      child: CustomButton(
                          btnname: "Save",
                          btntheam: offblack,
                          textcolor: white,
                          click: () {
                            updateData();
                          }),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  getMechdata() async {
    SharedPreferences mecdata = await SharedPreferences.getInstance();
    setState(() {
      id = mecdata.getString('id');
      username = mecdata.getString('name');
      location = mecdata.getString('location');
      email = mecdata.getString('email');
      phone = mecdata.getString('phone');
      workshop = mecdata.getString('workshop');
      experience = mecdata.getString('experiece');
      image = mecdata.getString('profile');
    });
  }

  updateData() async {
    if (selectImage != null) {
      Reference reference =
          FirebaseStorage.instance.ref().child('profile/${img!.name}');
      await reference.putFile(File(selectImage!.path));
      imageurl = await reference.getDownloadURL();

      await FirebaseFirestore.instance
          .collection('mechanicSignUp')
          .doc(id)
          .update({
        "username": usernamecontrollor.text,
        "email": emailcontrollor.text,
        "phone": phonecontrollor.text,
        "experience": experiencecontrollor.text,
        "workshop": workshopcontrollor.text,
        "location": locationcontrollor.text,
        "profileimage": imageurl,
      });

      SharedPreferences mecdata = await SharedPreferences.getInstance();
      setState(() {
        mecdata.setString('name', usernamecontrollor.text);
        mecdata.setString('email', emailcontrollor.text);
        mecdata.setString('profile', imageurl.toString());
        mecdata.setString('phone', phonecontrollor.text);
        mecdata.setString('location', locationcontrollor.text);
        mecdata.setString('workshop', workshopcontrollor.text);
        mecdata
            .setString('experiece', experiencecontrollor.text)
            .then((value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MechHome(),
                )));
      });
    } else {
      await FirebaseFirestore.instance
          .collection('mechanicSignUp')
          .doc(id)
          .update({
        "username": usernamecontrollor.text,
        "email": emailcontrollor.text,
        "phone": phonecontrollor.text,
        "experience": experiencecontrollor.text,
        "workshop": workshopcontrollor.text,
        "location": locationcontrollor.text,
        "profileimage": image,
      });

      SharedPreferences mecdata = await SharedPreferences.getInstance();
      setState(() {
        mecdata.setString('name', usernamecontrollor.text);
        mecdata.setString('email', emailcontrollor.text);
        mecdata.setString('profile', image.toString());
        mecdata.setString('phone', phonecontrollor.text);
        mecdata.setString('location', locationcontrollor.text);
        mecdata.setString('workshop', workshopcontrollor.text);
        mecdata
            .setString('experiece', experiencecontrollor.text)
            .then((value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MechHome(),
                )));
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

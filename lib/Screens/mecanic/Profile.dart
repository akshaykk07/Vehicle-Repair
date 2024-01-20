import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/customButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/customTextfield.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  String? username;
  String? phone;
  String? email;
  String? experience;
  String? workshop;
  String? location;
  String? mid;
  String? profile;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteone,
      appBar: AppBar(
        backgroundColor: offblack,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20).r,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: white,
            ),
          ),
        ),
        centerTitle: true,
        title: const AppText(
            text: "My Profile",
            weight: FontWeight.w400,
            size: 20,
            textcolor: whiteone),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 20).r,
        child:isLoading==false?Center(child: CircularProgressIndicator()): SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50.r,
                  backgroundImage: NetworkImage(
                    profile.toString(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40).r,
                  child: CustomTextField(
                    hint: "Enter Username",
                    fillcolor: white,
                    controller: TextEditingController(text: username),
                    validator: (value) {},
                    readonly: true,
                  ),
                ),
                CustomTextField(
                  hint: "Enter Phone number",
                  fillcolor: white,
                  controller: TextEditingController(text: phone),
                  kebordtype: TextInputType.number,
                  validator: (value) {},
                  readonly: true,
                ),
                CustomTextField(
                  hint: "Enter your email",
                  fillcolor: white,
                  controller: TextEditingController(text: email),
                  kebordtype: TextInputType.emailAddress,
                  validator: (value) {},
                  readonly: true,
                ),
                CustomTextField(
                  hint: "Enter your work experience",
                  fillcolor: white,
                  controller: TextEditingController(text: experience),
                  validator: (value) {},
                  readonly: true,
                ),
                CustomTextField(
                  hint: "Enter your work shop name",
                  fillcolor: white,
                  controller: TextEditingController(text: workshop),
                  validator: (value) {},
                  readonly: true,
                ),
                CustomTextField(
                  hint: "Enter your location",
                  fillcolor: white,
                  controller: TextEditingController(text: location),
                  validator: (value) {},
                  readonly: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20).r,
                  child: CustomButton(
                      btnname: "Done",
                      btntheam: offblack,
                      textcolor: white,
                      click: () {
                        Navigator.pop(context);
                      }),
                )
              ]),
        ),
      ),
    );
  }

  getData() async {
    SharedPreferences mecdata = await SharedPreferences.getInstance();
    setState(() {
      mid = mecdata.getString('id');
      username = mecdata.getString('name');
      phone = mecdata.getString('phone');
      email = mecdata.getString('email');
      workshop = mecdata.getString('workshop');
      experience = mecdata.getString('experiece');
      location = mecdata.getString('location');
      profile = mecdata.getString('profile');
      
    });
    isLoading=true;
  }
}

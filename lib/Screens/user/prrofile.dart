import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/user/EditProfile.dart';
import 'package:flutter_application_1/Screens/user/ViewProfile.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/settingTale.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsserProfile extends StatefulWidget {
  const UsserProfile({super.key});

  @override
  State<UsserProfile> createState() => _UsserProfileState();
}

class _UsserProfileState extends State<UsserProfile> {
  String? id;

  String? name;

  String? email;

  String? phone;

  String? location;
  String? image;
  bool isLoading = false;
  List iconslists = [
    const Icon(Icons.edit_note_outlined),
    const Icon(Icons.logout_outlined)
  ];

  List talenames = [
    const AppText(
        text: "Edit Profile",
        weight: FontWeight.w400,
        size: 17,
        textcolor: customBalck),
    const AppText(
        text: "Logout",
        weight: FontWeight.w400,
        size: 17,
        textcolor: customBalck),
  ];
  //late List functions = [gotoEdit(), gotoSettings(), gotoLogout()];
  @override
  void initState() {
    userData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30).r,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const AppText(
              text: "Profile",
              weight: FontWeight.w500,
              size: 30,
              textcolor: customBalck),
          Padding(
            padding: const EdgeInsets.only(top: 20).r,
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewProfile(
                        id: id,
                        name: name,
                        phone: phone,
                        email: email,
                        location: location,
                        image: image),
                  )),
              child: Container(
                height: 100.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10).r,
                    color: offblack),
                child: Row(children: [
                  SizedBox(
                    width: 80.w,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: white,
                      backgroundImage: NetworkImage(image.toString()),
                    ),
                  ),
                  Expanded(
                      child: SizedBox(
                    width: 80.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                            text: name.toString(),
                            weight: FontWeight.w500,
                            size: 20,
                            textcolor: whiteone),
                        AppText(
                            text: email.toString(),
                            weight: FontWeight.w400,
                            size: 15,
                            textcolor: whiteone),
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 40.w,
                    child: Center(
                        child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey.shade400,
                    )),
                  ),
                ]),
              ),
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          const AppText(
              text: "Account Settings",
              weight: FontWeight.w500,
              size: 20,
              textcolor: customBalck),
          SizedBox(
            height: 40.h,
          ),
          Expanded(
            child: ListView(
              children: [
                SettingTale(
                    iconslist: iconslists[0],
                    talename: talenames[0],
                    click: () {
                      gotoEdit();
                    }),
                SettingTale(
                    iconslist: iconslists[1],
                    talename: talenames[1],
                    click: () {
                      gotoLogout();
                    })
              ],
            ),
          )
        ]),
      ),
    );
  }

  userData() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    setState(() {
      isLoading = true;
      id = data.getString('id');
      name = data.getString('name');
      email = data.getString('email');
      phone = data.getString('phone');
      location = data.getString('location');
      image = data.getString('profile');
    });

    isLoading = false;
  }

  gotoEdit() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EditProfile(),
        ));
  }

  gotoLogout() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 300.h),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: white,
            ),
            height: 300,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 25, bottom: 15)
                  .r,
              child: Column(
                children: [
                  Expanded(
                      child: SizedBox(
                    child: Column(children: [
                      const AppText(
                          text: "Log Out?",
                          weight: FontWeight.w500,
                          size: 20,
                          textcolor: customBalck),
                      SizedBox(
                        height: 10.h,
                      ),
                      const AppText(
                          text: "Are you sure want to log out?.",
                          weight: FontWeight.w400,
                          size: 15,
                          textcolor: customBalck),
                      SizedBox(
                        height: 10.h,
                      ),
                    ]),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const AppText(
                            text: "Cancel",
                            weight: FontWeight.w400,
                            size: 15,
                            textcolor: customBalck),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        color: customBalck,
                        child: const Center(
                          child: AppText(
                              text: "Logout",
                              weight: FontWeight.w400,
                              size: 15,
                              textcolor: whiteone),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

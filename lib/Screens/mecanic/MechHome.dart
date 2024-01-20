import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/mecanic/AdminNotification.dart';
import 'package:flutter_application_1/Screens/mecanic/MEditProfile.dart';
import 'package:flutter_application_1/Screens/mecanic/Profile.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MechMain.dart';
import 'Rating.dart';
import 'Service.dart';

class MechHome extends StatefulWidget {
  const MechHome({super.key});

  @override
  State<MechHome> createState() => _MechHomeState();
}

class _MechHomeState extends State<MechHome> {
  int Index = 0;

  List pages = [const MechMain(), Services(), const Rating()];
  String? id;
  String? name;
  String? email;
  String? location;
  String? phone;
  String? workshop;
  String? experience;
  String? profileimage;
  bool isLoading = true;
  @override
  void initState() {
    getMechdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: whiteone),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
                text: name.toString(),
                weight: FontWeight.w400,
                size: 16,
                textcolor: whiteone),
            AppText(
                text: location.toString(),
                weight: FontWeight.w400,
                size: 13,
                textcolor: whiteone),
          ],
        ),
        backgroundColor: offblack,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20).r,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdminNotification(),
                    ));
              },
              child: Stack(
                children: [
                  const Icon(
                    Icons.notifications,
                    color: white,
                    size: 30,
                  ),
                  Positioned(
                      // notification Icon......
                      left: 15.r,
                      top: 5.r,
                      child: CircleAvatar(
                        radius: 6.r,
                        backgroundColor: Colors.red,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
      body: isLoading == false
          ? pages[Index]
          : const Center(child: CircularProgressIndicator()),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.engineering), label: "Request"),
            BottomNavigationBarItem(
                icon: Icon(Icons.handyman), label: "Service"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Rating")
          ],
          currentIndex: Index,
          backgroundColor: offblack,
          onTap: (newIndex) {
            setState(() {
              Index = newIndex;
            });
          },
          selectedItemColor: whiteone,
          unselectedItemColor: Colors.grey),
      drawer: Drawer(
          backgroundColor: whiteone,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: offblack),
                currentAccountPicture: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Profile(),
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.r),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(profileimage.toString()),
                      radius: 22,
                    ),
                  ),
                ),
                accountName: AppText(
                    text: name.toString(),
                    weight: FontWeight.w400,
                    size: 20,
                    textcolor: whiteone),
                accountEmail: AppText(
                    text: email.toString(),
                    weight: FontWeight.w400,
                    size: 15,
                    textcolor: whiteone),
              ),
              ListTile(
                leading: const AppText(
                    text: "Edit Profile",
                    weight: FontWeight.w400,
                    size: 15,
                    textcolor: customBalck),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: customBalck,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MEditProfile(),
                      ));
                },
              ),
              ListTile(
                onTap: () {},
                leading: const AppText(
                    text: "Log Out",
                    weight: FontWeight.w400,
                    size: 15,
                    textcolor: customBalck),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: customBalck,
                ),
              )
            ],
          )),
    );
  }

  getMechdata() async {
    SharedPreferences mecdata = await SharedPreferences.getInstance();
    setState(() {
      id = mecdata.getString('id');
      name = mecdata.getString('name');
      location = mecdata.getString('location');
      email = mecdata.getString('email');
      phone = mecdata.getString('phone');
      workshop = mecdata.getString('workshop');
      experience = mecdata.getString('experiece');
      profileimage = mecdata.getString('profile');
      isLoading = false;
    });
  }
}

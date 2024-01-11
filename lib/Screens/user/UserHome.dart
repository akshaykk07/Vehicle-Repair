import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/provider/getLat.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UserNotification.dart';
import 'UserProfile.dart';
import 'UserRequest.dart';
import 'UsermechList.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

var locality=finall;

class _UserHomeState extends State<UserHome> {
  final search = TextEditingController();
  @override
  void initState() {
    Provider.of<GetLatlong>(context, listen: false).getLatelong();
    userData();
    super.initState();
  }

  String? name;
  String? location;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            Column(children: [
              Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF614385),
                      Color(0xFF516395),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: const Radius.circular(40).r,
                  ),
                  color: maincolor,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, top: 20).r,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        // go to user profile screen..
                                        builder: (context) => UserProfile(),
                                      ));
                                },
                                child: CircleAvatar(
                                  radius: 30.r,
                                  backgroundImage:
                                      const AssetImage("assets/admin.png"),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                children: [
                                  AppText(
                                      text: name.toString(),
                                      weight: FontWeight.w500,
                                      size: 18,
                                      textcolor: white),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.green,
                                      ),
                                      AppText(
                                          text: location.toString(),
                                          weight: FontWeight.w500,
                                          size: 16,
                                          textcolor: white),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    // got to notification screen.....
                                    builder: (context) =>
                                        const UserNotification(),
                                  ));
                            },
                            child: Stack(
                              children: [
                                const Icon(
                                  Icons.notifications_none_sharp,
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
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 8.h),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: white),
                                borderRadius: BorderRadius.circular(40).r),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: white,
                                ),
                                borderRadius: BorderRadius.circular(40).r),
                            fillColor: white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40).r)),
                      )
                    ],
                  ),
                ),
              ),
              const Expanded(
                  child: TabBarView(children: [UserMecList(), UserRequest()])),
            ]),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 45, right: 45, bottom: 10).r,
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: white, width: 2),
                      borderRadius: BorderRadius.circular(10).r,
                      color: lightBlue),
                  child: TabBar(
                    tabs: [
                      Tab(
                          child: Text(
                        "Mechanic",
                        style: GoogleFonts.poppins(
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                      )),
                      Tab(
                        child: Text(
                          "Request",
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                    indicator: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF614385),
                            Color(0xFF516395),
                          ],
                        ),
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10).r),
                        // Creates border
                        color: customBlue),
                    labelColor: white,
                    dividerColor: Colors.transparent,
                    unselectedLabelColor: customBalck,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  userData() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    setState(() {
      name = data.getString('name');
      location = data.getString('location');
    });
  }
}

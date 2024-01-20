import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UserNotification.dart';
import 'UserRequest.dart';
import 'UsermechList.dart';

class UserHome extends StatefulWidget {
  UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final search = TextEditingController();
  String? name;

  String? location;
  @override
  void initState() {
    userData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: whiteone,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whiteone,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                  text: name.toString(),
                  weight: FontWeight.w500,
                  size: 18,
                  textcolor: customBalck),
              SizedBox(
                height: 5.h,
              ),
              AppText(
                  text: location.toString(),
                  weight: FontWeight.w500,
                  size: 15,
                  textcolor: customBalck)
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      // got to notification screen.....
                      builder: (context) => const UserNotification(),
                    ));
              },
              child: Stack(
                children: [
                  const Icon(
                    Icons.notifications_none_sharp,
                    color: customBalck,
                    size: 30,
                  ),
                  Positioned(
                      // notification Icon......
                      left: 17.r,
                      top: 5.r,
                      child: CircleAvatar(
                        radius: 6.r,
                        backgroundColor: Colors.red,
                      )),
                ],
              ),
            ),
            SizedBox(
              width: 20.w,
            )
          ],
        ),
        body: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20).r,
                child: Container(
                  height: 160.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: whiteone,
                        blurRadius: 20.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20).r,
                    color: white,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10).r,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xfff5f6f9), width: 5),
                                borderRadius: BorderRadius.circular(10).r,
                                color: const Color(0xfff5f6f9)),
                            child: TabBar(
                              tabs: [
                                Tab(
                                    child: Text(
                                  "Mechanic",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),
                                )),
                                Tab(
                                  child: Text(
                                    "Request",
                                    style: GoogleFonts.poppins(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    const Radius.circular(10).r),
                                // Creates border
                                color: white,
                              ),
                              labelColor: customBalck,
                              dividerColor: Colors.transparent,
                              unselectedLabelColor: Colors.grey,
                              indicatorSize: TabBarIndicatorSize.tab,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          cursorColor: Colors.grey.shade400,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                            ),
                            border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                            ),
                            hintText: "Search ",
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey[400],
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 8.h),
                            fillColor: white,
                            filled: true,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Expanded(
                  child: TabBarView(children: [UserMecList(), UserRequest()])),
            ]),
        drawer: Drawer(),
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

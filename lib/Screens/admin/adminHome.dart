import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: lightBlue,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40).r,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CircleAvatar(
              radius: 25.r,
              backgroundImage: AssetImage("assets/admin.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10).r, color: white),
                child: TabBar(
                  tabs: [
                    Tab(
                        child: Text(
                      "About Us",
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    )),
                    Tab(
                      child: Text(
                        "Post",
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10).r),
                      // Creates border
                      color: tabcolor),
                  labelColor: white,
                  unselectedLabelColor: customBalck,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
            ),
            Expanded(
                child: const TabBarView(children: [
              Center(child: Text("User")),
              Center(child: Text("Mechanic"))
            ]))
          ]),
        ),
      ),
    );
  }
}

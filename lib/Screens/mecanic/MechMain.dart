import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'AcceptList.dart';
import 'AdminNotification.dart';
import 'Profile.dart';
import 'RequestList.dart';

class MechMain extends StatelessWidget {
  const MechMain({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ));
            },
            child: Image.asset(
              "assets/men.png",
              height: 60.h,
              width: 60.w,
              fit: BoxFit.fill,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20).r,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminNotification(),
                      ));
                },
                child: Stack(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.yellow[700],
                      size: 30,
                    ),
                     Positioned( // notification Icon......
                        left: 15.r,
                        top: 5.r,
                        child: CircleAvatar(
                          radius: 6.r,
                          backgroundColor: Colors.red,
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30).r,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10).r,
                    color: lightBlue),
                child: TabBar(
                  // Tab Bar...........
                  tabs: const [
                    Tab(
                        child: AppText(
                            text: "Requests",
                            weight: FontWeight.w400,
                            size: 14,
                            textcolor: customBalck)),
                    Tab(
                        child: AppText(
                            text: "Accepted",
                            weight: FontWeight.w400,
                            size: 14,
                            textcolor: customBalck)),
                  ],
                  indicator: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(const Radius.circular(10).r),
                      // Creates border
                      color: maincolor),
                  dividerColor: Colors.transparent,
                  labelColor: white,
                  unselectedLabelColor: customBalck,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const Expanded(
                child: TabBarView(children: [
              // Tab bar View.......
              Center(child: RequestsList()),
              Center(child: AcceptedList())
            ]))
          ]),
        ),
      ),
    );
  }
}

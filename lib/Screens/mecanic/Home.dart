import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'AcceptList.dart';
import 'RequestList.dart';

class MechHome extends StatelessWidget {
  const MechHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "assets/men.png",
            height: 60.h,
            width: 60.w,
            fit: BoxFit.fill,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20).r,
              child: Icon(
                Icons.notifications,
                color: Colors.yellow[700],
                size: 30,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30).r,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10).r,
                    color: lightBlue),
                child: TabBar(
                  tabs: [
                    Tab(
                        child: AppText(
                            text: "Requests",
                            weight: FontWeight.w400,
                            size: 14.sp,
                            textcolor: customBalck)),
                    Tab(
                        child: AppText(
                            text: "Accepted",
                            weight: FontWeight.w400,
                            size: 14.sp,
                            textcolor: customBalck)),
                  ],
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10).r),
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
              Center(child: RequestsList()),
              Center(child: AcceptedList())
            ]))
          ]),
        ),
      ),
    );
  }
}

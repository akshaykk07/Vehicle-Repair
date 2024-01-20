import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'AcceptList.dart';

import 'RequestList.dart';

class MechMain extends StatefulWidget {
  const MechMain({super.key});

  @override
  State<MechMain> createState() => _MechMainState();
}

class _MechMainState extends State<MechMain> {
 
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: whiteone,
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30).r,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10).r, color: white),
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
                      color: Colors.grey[300]),
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

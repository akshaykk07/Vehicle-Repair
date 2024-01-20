import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/user/requestfull.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/userRequestTile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRequest extends StatefulWidget {
  const UserRequest({super.key});

  @override
  State<UserRequest> createState() => _UserRequestState();
}

class _UserRequestState extends State<UserRequest> {
  @override
  void initState() {
    userData();
    super.initState();
  }

  String? uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteone,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                    text: "Request status",
                    weight: FontWeight.w500,
                    size: 18,
                    textcolor: customBalck),
                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => RequestFull(uid: uid),
                //         ));
                //   },
                //   child: const AppText(
                //       text: "View All",
                //       weight: FontWeight.w500,
                //       size: 14,
                //       textcolor: customBalck),
                // ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('userRequest')
                      .where('uid', isEqualTo: uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text("Error ${snapshot.hasError}"));
                    }
                    if (!snapshot.hasData) {
                      return const Center(
                          child: AppText(
                              text: "Loading...",
                              weight: FontWeight.w500,
                              size: 24,
                              textcolor: customBalck));
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return Center(
                          child: AppText(
                              text: "No Requests",
                              weight: FontWeight.w500,
                              size: 24,
                              textcolor: Colors.grey.shade400));
                    }
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return UserRequestTile(
                            name: snapshot.data!.docs[index]['mname'],
                            date: snapshot.data!.docs[index]['date'],
                            time: snapshot.data!.docs[index]['time'],
                            issue: snapshot.data!.docs[index]['issue'],
                            status: snapshot.data!.docs[index]['status']);
                      },
                      itemCount: snapshot.data?.docs.length,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  userData() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    setState(() {
      uid = data.getString('id');
    });
  }
}

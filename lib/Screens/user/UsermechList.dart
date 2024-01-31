import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/mecanicStatusTile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ServiceScreen.dart';

class UserMecList extends StatefulWidget {
  const UserMecList({super.key});

  @override
  State<UserMecList> createState() => _UserMecListState();
}

class _UserMecListState extends State<UserMecList> {
  @override
  void initState() {
    userData();
    super.initState();
  }

  String? location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteone,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
                text: "Available Mecanics",
                weight: FontWeight.w500,
                size: 18,
                textcolor: customBalck),
            SizedBox(
              height: 10.h,
            ),
            // Expanded(
            //   child: StreamBuilder(
            // stream: FirebaseFirestore.instance
            //     .collection('mechanicSignUp')
            //     .where('location', isEqualTo: location)
            //     .where('status', isEqualTo: 1)
            //     .snapshots(),
            //       builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   const Center(
            //       child: CircularProgressIndicator(
            //     color: Colors.green,
            //   ));
            // }
            // if (snapshot.hasError) {
            //   Text("Error${snapshot.error}");
            // }
            // if (!snapshot.hasData) {
            //   return const Center(
            //       child: AppText(
            //           text: "Loading...",
            //           weight: FontWeight.w500,
            //           size: 24,
            //           textcolor: customBalck));
            // }
            // if (snapshot.data!.docs.isEmpty) {
            //   return Center(
            //       child: AppText(
            //           text: "No Mecanic Available",
            //           weight: FontWeight.w500,
            //           size: 24,
            //           textcolor: Colors.grey.shade400));
            // }
            //         return Padding(
            //           padding: const EdgeInsets.only(left: 22, right: 22).r,
            //           child: ListView.builder(
            //             itemBuilder: (context, index) {
            // final name = snapshot.data?.docs[index]['username'];
            // final experience =
            //     snapshot.data?.docs[index]['experience'];
            // final shopname = snapshot.data?.docs[index]['workshop'];
            // final image =
            //     snapshot.data?.docs[index]['profileimage'];
            // final id = snapshot.data?.docs[index].id;
            //               return MechanicStatusTile(
            //                 image: image,
            //                 name: name,
            //                 experience: experience,
            //                 work: shopname,
            //                 status: true,
            //                 // if status is true is mechanic available /false not available......
            //                 click: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => ServiceScreen(id: id),
            //     ));
            //                 },
            //               );
            //             },
            //             itemCount: snapshot.data?.docs.length,
            //           ),
            //         );
            //       }),
            // ),
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('mechanicSignUp')
                      .where('location', isEqualTo: location)
                      .where('status', isEqualTo: 1)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      const Center(
                          child: CircularProgressIndicator(
                        color: Colors.green,
                      ));
                    }
                    if (snapshot.hasError) {
                      Text("Error${snapshot.error}");
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
                              text: "No Mecanic Available",
                              weight: FontWeight.w500,
                              size: 24,
                              textcolor: Colors.grey.shade400));
                    }
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12),
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        final name = snapshot.data?.docs[index]['username'];
                        final experience =
                            snapshot.data?.docs[index]['experience'];
                        final shopname = snapshot.data?.docs[index]['workshop'];
                        final image =
                            snapshot.data?.docs[index]['profileimage'];
                        final id = snapshot.data?.docs[index].id;
                        return Container(
                          height: 400.h,
                          width: 153.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15).r,
                              color: white),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(image.toString()),
                                radius: 40,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AppText(
                                  text: name,
                                  textcolor: customBalck,
                                  size: 15.sp,
                                  weight: FontWeight.w500),
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ServiceScreen(id: id),
                                        ));
                                  },
                                  child: const AppText(
                                    text: "Request",
                                    weight: FontWeight.w400,
                                    size: 15,
                                    textcolor: Colors.greenAccent,
                                  ))
                            ]),
                          ),
                        );
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  userData() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    setState(() {
      location = data.getString('location');
    });
  }
}

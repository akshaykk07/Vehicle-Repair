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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 20).r,
            child: const AppText(
                text: "Available Mecanics",
                weight: FontWeight.w500,
                size: 18,
                textcolor: customBalck),
          ),
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
                  return Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22).r,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final name = snapshot.data?.docs[index]['username'];
                        final experience =
                            snapshot.data?.docs[index]['experience'];
                        final shopname = snapshot.data?.docs[index]['workshop'];
                        final image =
                            snapshot.data?.docs[index]['profileimage'];
                        final id = snapshot.data?.docs[index].id;
                        return MechanicStatusTile(
                          image: image,
                          name: name,
                          experience: experience,
                          work: shopname,
                          status: true,
                          // if status is true is mechanic available /false not available......
                          click: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ServiceScreen(id: id),
                                ));
                          },
                        );
                      },
                      itemCount: snapshot.data?.docs.length,
                    ),
                  );
                }),
          ),
        ],
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
    var list = FirebaseFirestore.instance
        .collection('mechanicSignUp')
        .where('location', isEqualTo: location);
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 34, right: 34).r,
          child: StreamBuilder(
              stream: list.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  Text("Error${snapshot.error}");
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return MechanicStatusTile(
                        image: "assets/men3.png",
                        name: snapshot.data?.docs[index]['username'],
                        experience: "2+ year experience",
                        work: snapshot.data?.docs[index]['experience'],
                        status: true,
                        // if status is true is mechanic available /false not available......
                        click: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ServiceScreen(),
                              ));
                        },
                      );
                    },
                    itemCount: snapshot.data?.docs.length,
                  );
                }
                return const CircularProgressIndicator();
              })),
    );
  }

  userData() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    setState(() {
      location = data.getString('location');
    });
  }
}

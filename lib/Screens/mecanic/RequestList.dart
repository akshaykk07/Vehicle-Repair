import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/requestTile.dart';
import 'RequestScreen.dart';

class RequestsList extends StatefulWidget {
  const RequestsList({super.key});

  @override
  State<RequestsList> createState() => _RequestsListState();
}

String? mid;

class _RequestsListState extends State<RequestsList> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteone,
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('userRequest')
                .where('mid', isEqualTo: mid)
                .where('status', isEqualTo: 0)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text('Error${snapshot.error}');
              }
              final user = snapshot.data?.docs ?? [];
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
                        text: "No Requests!",
                        weight: FontWeight.w500,
                        size: 24,
                        textcolor: Colors.grey.shade400));
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return RequestTile(
                    image: user[index]['userprofile'],
                    name: user[index]['username'],
                    issue: user[index]['issue'],
                    date: user[index]['date'],
                    time: user[index]['time'],
                    place: user[index]['location'],
                    click: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RequestScreen(id: user[index].id),
                          ));
                    },
                  );
                },
                itemCount: user.length,
              );
            }));
  }

  getData() async {
    SharedPreferences mecdata = await SharedPreferences.getInstance();
    setState(() {
      mid = mecdata.getString('id');
    });
  }
}

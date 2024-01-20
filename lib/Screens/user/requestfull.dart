import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:flutter_application_1/widgets/userRequestTile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestFull extends StatelessWidget {
  const RequestFull({super.key, this.uid});
  final uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteone,
      appBar: AppBar(
          backgroundColor: whiteone,
          centerTitle: true,
          title: const AppText(
              text: "Service Reuest",
              weight: FontWeight.w400,
              size: 20,
              textcolor: customBalck)),
      body: StreamBuilder(
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
                      text: "No  Requests",
                      weight: FontWeight.w500,
                      size: 24,
                      textcolor: Colors.grey.shade400));
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20).r,
                  child: UserRequestTile(
                      name: snapshot.data!.docs[index]['mname'],
                      date: snapshot.data!.docs[index]['date'],
                      time: snapshot.data!.docs[index]['time'],
                      issue: snapshot.data!.docs[index]['issue'],
                      status: snapshot.data!.docs[index]['status']),
                );
              },
              itemCount: snapshot.data?.docs.length,
            );
          }),
    );
  }
}

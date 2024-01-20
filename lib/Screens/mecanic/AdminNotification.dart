import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/notificationCard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';
import '../../widgets/apptext.dart';

class AdminNotification extends StatelessWidget {
  const AdminNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10).r,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: whiteone,
              ),
            ),
          ),
          backgroundColor: offblack,
          title: AppText(
              text: "Notification",
              weight: FontWeight.w400,
              size: 20.sp,
              textcolor: whiteone),
          centerTitle: true),
      body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 0).r,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Notification')
                .orderBy('date')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text('Error${snapshot.error}');
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
                        text: "No Notification",
                        weight: FontWeight.w500,
                        size: 24,
                        textcolor: Colors.grey.shade400));
              }
              final user = snapshot.data?.docs ?? [];
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NotifiactionCard(
                      heading: user[index]['heading'],
                      title: user[index]['content'],
                      time: user[index]['time'],
                      date: user[index]['date']);
                },
                itemCount: user.length,
              );
            },
          )),
    );
  }
}

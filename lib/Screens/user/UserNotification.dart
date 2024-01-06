import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/notificationCard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';
import '../../widgets/apptext.dart';

class UserNotification extends StatelessWidget {
  const UserNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: customBalck,
            ),
          ),
          backgroundColor: maincolor,
          title: AppText(
              text: "Notification",
              weight: FontWeight.w400,
              size: 20.sp,
              textcolor: customBalck),
          centerTitle: true),
      body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 0).r,
          child: FutureBuilder(
              future:
                  FirebaseFirestore.instance.collection('Notification').get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  Text("Error ${snapshot}");
                }
                final user = snapshot.data?.docs ?? [];
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return NotifiactionCard(
                        title: user[index]['content'],
                        time: user[index]['time'],
                        date: user[index]['date']);
                  },
                  itemCount: user.length,
                );
              })),
    );
  }
}

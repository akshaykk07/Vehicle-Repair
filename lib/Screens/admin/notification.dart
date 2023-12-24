import 'package:flutter/material.dart';

import 'package:flutter_application_1/widgets/notificationTile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';
import 'addNotification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CircleAvatar(
          radius: 30.r,
          backgroundImage: const AssetImage("assets/admin.png"),
        ),
      ),
      backgroundColor: lightBlue,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20).r,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return const NotificationTile(
                heading: "Heading",
                contents:
                    "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying Lorem ipsum ");
          },
          itemCount: 10,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNotification(),
                ));
          },
          backgroundColor: white,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: customBlue,
            size: 35,
          )),
    );
  }
}

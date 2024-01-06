import 'package:cloud_firestore/cloud_firestore.dart';
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
        automaticallyImplyLeading: false,
        title: CircleAvatar(
          radius: 30.r,
          backgroundImage: const AssetImage("assets/admin.png"),
        ),
      ),
      backgroundColor: lightBlue,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20).r,
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Notification')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text('Error${snapshot.error}');
              }
              final user = snapshot.data?.docs ?? [];
              return ListView.builder(
                itemBuilder: (context, index) {
                  final title = user[index]['heading'];
                  final content = user[index]['content'];
                  return NotificationTile(heading: title, contents: content);
                },
                itemCount: user.length,
              );
            }),
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

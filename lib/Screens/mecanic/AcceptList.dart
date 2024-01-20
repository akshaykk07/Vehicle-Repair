import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/apptext.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/acceptTile.dart';

class AcceptedList extends StatefulWidget {
  const AcceptedList({super.key});

  @override
  State<AcceptedList> createState() => _AcceptedListState();
}

class _AcceptedListState extends State<AcceptedList> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  String? mid;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('userRequest')
            .where('mid', isEqualTo: mid)
            .where('status', isEqualTo: 1)
            .get(),
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
                    text: "No Accepted Request",
                    weight: FontWeight.w500,
                    size: 24,
                    textcolor: Colors.grey.shade400));
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return AcceptTile(
                image: user[index]['userprofile'],
                name: user[index]['username'],
                issue: user[index]['issue'],
                date: user[index]['date'],
                time: user[index]['time'],
                place: user[index]['location'],
                status:
                    false, // if status is true payment success/else payment is pending.....
              );
            },
            itemCount: snapshot.data!.docs.length,
          );
        });
  }

  getData() async {
    SharedPreferences mecdata = await SharedPreferences.getInstance();
    setState(() {
      mid = mecdata.getString('id');
    });
  }
}

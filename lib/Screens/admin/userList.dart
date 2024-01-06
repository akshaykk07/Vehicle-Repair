import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';

import '../../widgets/userTile.dart';
import 'adminUser.dart';

class UserList extends StatefulWidget {
  UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final list = FirebaseFirestore.instance.collection('userSignUp');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightBlue,
        body: StreamBuilder(
          stream: list.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text('Error${snapshot.error}');
            }
            final user = snapshot.data?.docs ?? [];

            return ListView.builder(
              itemBuilder: (context, index) {
                final name = user[index]['username'];
                final mob = user[index]['phone'];
                final id = user[index].id;
                final email = user[index]['email'];
                final status = user[index]['status'];
                return UserTile(
                  image: "assets/pro.png",
                  name: name,
                  location: 'location',
                  mobile: mob,
                  email: email,
                  click: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminUser(
                                  id: id,
                                )));
                  },
                );
              },
              itemCount: user.length,
            );
          },
        ));
  }
}


// Scaffold(
//         backgroundColor: lightBlue,
//         body: FutureBuilder(
          // future: FirebaseFirestore.instance.collection('userSignUp').get(),
          // builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //   if (snapshot.connectionState == ConnectionState.waiting) {
          //     return const Center(child: CircularProgressIndicator());
          //   }
          //   if (snapshot.hasError) {
          //     return Text('Error${snapshot.error}');
          //   }
          //   final user = snapshot.data?.docs ?? [];

//             return ListView.builder(
//               itemBuilder: (context, index) {
//                 final name = user[index]['username'];
//                 final mob = user[index]['phone'];
//                 final id = user[index].id;
//                 final email = user[index]['email'];
//                 final status = user[index]['status'];
//                 return UserTile(
//                   image: "assets/pro.png",
//                   name: name,
//                   location: 'location',
//                   mobile: mob,
//                   email: email,
//                   click: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => AdminUser(
//                                   name: name,
//                                   mob: mob,
//                                   mail: email,
//                                   id: id,
//                                   status: status,
//                                 )));
//                   },
//                 );
//               },
//               itemCount: user.length,
//             );
//           },
//         ));
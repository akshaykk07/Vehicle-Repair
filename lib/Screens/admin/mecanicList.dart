import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/mecahnicTile.dart';

import 'adminMech.dart';

class MechanicList extends StatelessWidget {
  const MechanicList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightBlue,
        body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('mechanicSignUp').get(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text('Error ${snapshot}');
            }
            final user = snapshot.data!.docs;
            return ListView.builder(
              itemBuilder: (context, index) {
                final name = user[index]['username'];
                final mob = user[index]['phone'];
                final service = user[index]['experience'];
                final email = user[index]['email'];
                final workshop = user[index]['workshop'];
                final id = user[index].id;
                return MechanicTile(
                  image: "assets/pro.png",
                  name: name,
                  mobile: mob,
                  service: service,
                  click: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminMechanic(
                            id: id,
                          ),
                        ));
                  },
                );
              },
              itemCount: user.length,
            );
          },
        ));
  }
}

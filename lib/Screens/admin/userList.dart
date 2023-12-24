import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';

import '../../widgets/userTile.dart';
import 'adminUser.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightBlue,
        body: ListView.builder(
          itemBuilder: (context, index) {
            return UserTile(
              image: "assets/pro.png",
              name: "akshay kk",
              location: "kozhikode",
              mobile: "9946253965",
              email: "akshaykuruvangad@gmail.com",
              click: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminUser()));
              },
            );
          },
          itemCount: 10,
        ));
  }
}

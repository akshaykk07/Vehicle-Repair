import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/widgets/mecahnicTale.dart';

class MechanicList extends StatelessWidget {
  const MechanicList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightBlue,
        body: ListView.builder(
          itemBuilder: (context, index) {
            return  const MechanicTile(
                image: "assets/pro.png",
                name: "name",
                mobile: "mobile",
                service: "service"
            );
          },
          itemCount: 10,
        ));
  }
}



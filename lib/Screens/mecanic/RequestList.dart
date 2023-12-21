import 'package:flutter/material.dart';

import '../../widgets/requestTale.dart';

class RequestsList extends StatelessWidget {
  const RequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    return
      // Scaffold(
      //   body:
        ListView.builder(
      itemBuilder: (context, index) {
        return const RequestTale(
            image: "assets/men.png",
            name: "name",
            issue: "Fuel leaking ",
            date: 'date',
            time: "time",
            place: "kozhikode ");
      },
      itemCount: 10,
    );
    //);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/user/UserHome.dart';
import 'package:flutter_application_1/Screens/user/EditProfile.dart';
import 'package:flutter_application_1/Screens/user/prrofile.dart';
import 'package:flutter_application_1/constants/color.dart';

class UserMain extends StatefulWidget {
  const UserMain({super.key});

  @override
  State<UserMain> createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  int Index = 0;
  List pages = [
     UserHome(),
    const Center(child: Text("Payment Status")),
    const UsserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[Index],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: "Payment"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2), label: "Profile"),
        ],
        currentIndex: Index,
        onTap: (newIndex) {
          setState(() {
            Index = newIndex;
          });
        },
        backgroundColor: customBalck,
        selectedItemColor: white,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

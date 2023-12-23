import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/admin/adminLogin.dart';
import 'package:flutter_application_1/Screens/mecanic/RequestScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Screens/admin/addNotification.dart';
import 'Screens/admin/adminHome.dart';
import 'Screens/admin/adminMech.dart';
import 'Screens/admin/adminUser.dart';
import 'Screens/admin/mecanicList.dart';
import 'Screens/admin/notification.dart';
import 'Screens/admin/payment.dart';
import 'Screens/admin/userList.dart';
import 'Screens/mecanic/AcceptList.dart';
import 'Screens/mecanic/AcceptScreen.dart';
import 'Screens/mecanic/EditProfile.dart';
import 'Screens/mecanic/Home.dart';
import 'Screens/mecanic/Login.dart';
import 'Screens/mecanic/AdminNotification.dart';
import 'Screens/mecanic/Profile.dart';
import 'Screens/mecanic/Rating.dart';
import 'Screens/mecanic/RejectScreen.dart';
import 'Screens/mecanic/RequestList.dart';
import 'Screens/mecanic/Service.dart';
import 'Screens/mecanic/Signup.dart';
import 'Screens/mecanic/demo.dart';
import 'Screens/user/UserHome.dart';
import 'Screens/user/Paymentsuccess.dart';
import 'Screens/user/UserLogin.dart';
import 'Screens/user/UserNotification.dart';
import 'Screens/user/UserRequest.dart';
import 'Screens/user/UserSignup.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
          //screen util package for adaptive ui
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme:
                const AppBarTheme(color: Colors.transparent, elevation: 0),
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            // useMaterial3: true,
          ),
          home: UserHome()),
      designSize: Size(390, 844),
    );
  }
}

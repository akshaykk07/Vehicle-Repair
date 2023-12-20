import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/admin/adminLogin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Screens/admin/adminHome.dart';
import 'Screens/admin/user.dart';
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
          home: AdminHome()),
      designSize: Size(390, 844),
    );
  }
}

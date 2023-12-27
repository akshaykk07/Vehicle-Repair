import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Screens/admin/adminHome.dart';
import 'Screens/admin/adminLogin.dart';
import 'Screens/common/Splash.dart';
import 'Screens/mecanic/MechHome.dart';
import 'Screens/mecanic/MechMain.dart';
import 'Screens/mecanic/Login.dart';
import 'Screens/mecanic/Signup.dart';
import 'Screens/user/UserHome.dart';
import 'Screens/user/UserLogin.dart';
import 'Screens/user/UserProfile.dart';
import 'Screens/user/UserSignup.dart';

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
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme:
                const AppBarTheme(color: Colors.transparent, elevation: 0),
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            // useMaterial3: true,
          ),
          home: MechSignup()),
      designSize: Size(390, 844),
    );
  }
}

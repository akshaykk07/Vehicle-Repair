import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/admin/addNotification.dart';
import 'package:flutter_application_1/Screens/admin/adminUser.dart';
import 'package:flutter_application_1/Screens/admin/mecanicList.dart';
import 'package:flutter_application_1/Screens/admin/notification.dart';
import 'package:flutter_application_1/Screens/mecanic/AdminNotification.dart';
import 'package:flutter_application_1/Screens/user/UserNotification.dart';
import 'package:flutter_application_1/provider/getLat.dart';
import 'package:flutter_application_1/provider/statusProvider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'Screens/admin/adminHome.dart';
import 'Screens/admin/adminLogin.dart';
import 'Screens/common/Splash.dart';
import 'Screens/mecanic/EditProfile.dart';
import 'Screens/mecanic/MechHome.dart';
import 'Screens/mecanic/MechMain.dart';
import 'Screens/mecanic/Login.dart';
import 'Screens/mecanic/Profile.dart';
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
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => StatusProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => GetLatlong(),
          )
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              appBarTheme:
                  const AppBarTheme(color: Colors.transparent, elevation: 0),
              // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              // useMaterial3: true,
            ),
            home: UserLogin()),
      ),
      designSize: Size(390, 844),
    );
  }
}

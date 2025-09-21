import 'package:flutter/material.dart';
// import 'package:pup_sight/Capstone-Prototype/Admin/admin_dashboard.dart';
import 'package:pupsight_app/User/user_dashboard.dart';
// import 'package:pup_sight/Capstone-Prototype/Staff/staff_dashboard.dart';
import 'package:pupsight_app/User/user_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 211, 207, 126),
        ),
      ),
      home: UserDashboard(),
    );
  }
}

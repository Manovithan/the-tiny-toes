import 'package:flutter/material.dart';
import 'constants.dart';
import 'login.dart';

void main() {
  runApp(InitialScreen());
}

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login_page(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}

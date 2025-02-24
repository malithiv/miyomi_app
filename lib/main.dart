import 'package:miyomi/AuthorScreen.dart';
import 'package:miyomi/ContentScreen.dart';
import 'package:miyomi/ContentScreen2.dart';
import 'package:miyomi/HomeScreen.dart';
import 'package:miyomi/MindBooks1.dart';
import 'package:miyomi/MindBooks2.dart';
import 'package:miyomi/MindCast1.dart';
import 'package:miyomi/MindCast2.dart';
import 'package:miyomi/SignUpEmail.dart';
import 'package:miyomi/LoginScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MindCast2(),
        '/home': (context) => HomeScreen(), // Replace with your actual home screen
        '/signupEmail': (context) => SignUpEmail(), // Replace with your sign-up screen
      },
    ));
  }
}
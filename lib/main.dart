import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miyomi/Mindcourse1Screen.dart';
import 'package:miyomi/NotificationScreen.dart';
// Import all your screens

import 'HomeScreen.dart';
import 'LoginScreen.dart';
import 'SignUpEmail.dart';
import 'SizeConfig.dart';

void main() {
  // Lock orientation to portrait
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Miyomi App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Urbanist',
      ),
      // Use the ResponsiveScreen widget to wrap your initial route
      home: ResponsiveScreen(child: LoginScreen()),
      routes: {

        '/home': (context) => ResponsiveScreen(child: HomeScreen()),
        '/signupEmail': (context) => ResponsiveScreen(child: SignUpEmail()),
        // Add more routes as needed
      },
    );
  }
}

// Step 3: Create a ResponsiveScreen wrapper widget
class ResponsiveScreen extends StatelessWidget {
  final Widget child;

  const ResponsiveScreen({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig().init(context);

    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: child,
      ),
    );
  }
}
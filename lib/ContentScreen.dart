// content_screen.dart
import 'package:flutter/material.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.03, -1.00),
            end: Alignment(-0.03, 1),
            colors: [Colors.white, Color(0xFFBDE0FE)],
          ),
        ),
        child: const Center(
          child: Text('Library Content Screen'),
        ),
      ),
    );
  }
}
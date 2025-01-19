import 'package:flutter/material.dart';

class OtpVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFBDE0FE)],
          ),
        ),
        child: Stack(
          children: [
            // Wave Shape Image
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/wave.png', // Path to your wave image
                fit: BoxFit.cover,
                height: 200,
              ),
            ),

            // Title and Subtitle
            Positioned(
              top: 200,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'OTP Verification',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Enter the OTP sent to your email ID',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF5B5B5B),
                    ),
                  ),
                ],
              ),
            ),

            // OTP Input Fields
            Positioned(
              top: 300,
              left: 50,
              right: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return Container(
                    width: 56,
                    height: 69,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 2, color: Colors.grey),
                    ),
                  );
                }),
              ),
            ),

            // Resend OTP
            Positioned(
              bottom: 120,
              left: 30,
              right: 30,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Didn’t receive OTP? Click on ',
                      style: TextStyle(
                        color: Color(0xFF5B5B5B),
                        fontSize: 11,
                      ),
                    ),
                    TextSpan(
                      text: 'Resend',
                      style: TextStyle(
                        color: Color(0xFF023047),
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Verify Button
            Positioned(
              bottom: 60,
              left: 40,
              right: 40,
              child: GestureDetector(
                onTap: () {
                  // Handle OTP verification logic here
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF023047), Color(0xFF337190)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

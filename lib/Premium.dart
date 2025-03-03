import 'package:flutter/material.dart';
import 'package:miyomi/ContentScreen.dart';
import 'package:miyomi/Create.dart';
import 'package:miyomi/HomeScreen.dart';
import 'package:miyomi/NotificationScreen.dart';
import 'package:miyomi/Premium.dart';
import 'package:miyomi/CustomBottomNavBar.dart';

class Premium extends StatelessWidget {
  const Premium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.10, -1.00),
            end: Alignment(-0.1, 1),
            colors: [Colors.white, Color(0xFF8ECAF6)],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Back button
              Positioned(
                left: 16,
                top: 16,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Color(0xFF023047)),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              // Main card
              Positioned(
                left: 16,
                top: 145,
                child: Container(
                  width: 327,
                  height: 540,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Crown logo
                      Positioned(
                        left: 96, // Adjusted to center in the card
                        top: 5,
                        child: Image.asset(
                          'assets/images/crown.png',
                          width: 142,
                          height: 94,
                          fit: BoxFit.contain,
                        ),
                      ),

                      // UPGRADE text
                      Positioned(
                        left: 56, // Adjusted for actual centered text
                        top: 116,
                        child: Row(
                          children: [
                            Text(
                              'UPGRADE',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 67,
                              height: 25,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFB8500),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'PRO',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Price text
                      Positioned(
                        left: 83,
                        top: 216,
                        child: Row(
                          children: [
                            Text(
                              '\$4.00',
                              style: TextStyle(
                                color: Color(0xFF023047),
                                fontSize: 32,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'for 1 month',
                                style: TextStyle(
                                  color: Color(0xFF023047),
                                  fontSize: 14,
                                  fontFamily: 'Urbanist',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Features list
                      Positioned(
                        left: 54, // Centered
                        top: 270,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildFeatureItem('Stay on top of the news'),
                            SizedBox(height: 20),
                            _buildFeatureItem('Personalized recommendations'),
                            SizedBox(height: 20),
                            _buildFeatureItem('Ad free experience'),
                            SizedBox(height: 20),
                            _buildFeatureItem('Topics of interest selected by you'),
                          ],
                        ),
                      ),

                      // Upgrade button
                      Positioned(
                        left: 20,
                        top: 405,
                        child: GestureDetector(
                          onTap: () {
                            // Handle upgrade action
                          },
                          child: Container(
                            width: 289,
                            height: 56,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(1.00, 0.00),
                                end: Alignment(-1, 0),
                                colors: [Color(0xFFFB8500), Color(0xFFFFB703)],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1000),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Upgrade Premium \$4.00',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 3,
        onTap: (index) {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Color(0xFF5B5B5B),
        fontSize: 14,
        fontFamily: 'Urbanist',
      ),
    );
  }
}

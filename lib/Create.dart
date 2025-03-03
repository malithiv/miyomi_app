import 'package:flutter/material.dart';
import 'package:miyomi/CustomBottomNavBar.dart';  // Import the CustomBottomNavBar

class Create extends StatelessWidget {
  const Create({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.10, -1.00),
            end: Alignment(-0.1, 1),
            colors: [Colors.white, Color(0xFFBDE0FE)],
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

              // Profile image in top right
              Positioned(
                right: 16,
                top: 16,
                child: Container(
                  width: 49,
                  height: 49,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.png'),
                      fit: BoxFit.cover,
                    ),
                    shape: OvalBorder(
                      side: BorderSide(width: 1, color: Color(0xFFDFDFDF)),
                    ),
                  ),
                ),
              ),

              // Welcome text with celebration icon
              Positioned(
                left: 0,
                top: 110,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      'Welcome to Our',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF023047),
                        fontSize: 32,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Community',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF023047),
                            fontSize: 32,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Image.asset(
                          'assets/images/celebration.png',
                          width: 44,
                          height: 43,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Main illustration
              Positioned(
                left: 0,
                right: 0,
                top: 223,
                child: Center(
                  child: Image.asset(
                    'assets/images/welcome_illustration.png',
                    width: 295,
                    height: 213,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Description text
              Positioned(
                left: 16,
                right: 16,
                top: 462,
                child: Text(
                  "Our community is a place of warmth and acceptance, where everyone's voice is valued and respected.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF736A66),
                    fontSize: 16,
                    fontFamily: 'Urbanist',
                  ),
                ),
              ),

              // Page indicator dots
              Positioned(
                left: 0,
                right: 0,
                top: 579,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: ShapeDecoration(
                        color: Color(0xFF023047),
                        shape: OvalBorder(),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 7,
                      height: 7,
                      decoration: ShapeDecoration(
                        color: Color(0xFFC3C3C3),
                        shape: OvalBorder(),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 7,
                      height: 7,
                      decoration: ShapeDecoration(
                        color: Color(0xFFC3C3C3),
                        shape: OvalBorder(),
                      ),
                    ),
                  ],
                ),
              ),

              // Register button
              Positioned(
                left: 22,
                right: 22,
                top: 611,
                child: GestureDetector(
                  onTap: () {
                    // Handle registration action
                  },
                  child: Container(
                    height: 56,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFB8500),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Understood. Let's register",
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
      bottomNavigationBar: CustomBottomNavBar(  // Add the CustomBottomNavBar
        currentIndex: 4,  // The 'Create' screen is index 4
        onTap: (index) {
          // Handle navigation when a bottom nav item is tapped
          // You can use Navigator.push to go to different screens.
        },
      ),
    );
  }
}

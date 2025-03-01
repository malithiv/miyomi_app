import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate proportional sizes
    final waveHeight = screenHeight * 0.15;
    final meditationHeight = screenHeight * 0.22;
    final fieldHeight = screenHeight * 0.05;
    final buttonHeight = screenHeight * 0.055;
    final socialButtonHeight = screenHeight * 0.04;
    final spacingLarge = screenHeight * 0.02;
    final spacingMedium = screenHeight * 0.012;
    final spacingSmall = screenHeight * 0.008;

    // Font sizes
    final headingFontSize = screenHeight * 0.025;
    final buttonFontSize = screenHeight * 0.022;
    final fieldFontSize = screenHeight * 0.016;
    final smallFontSize = screenHeight * 0.012;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.11, -0.99),
            end: Alignment(-0.11, 0.99),
            colors: [Colors.white, Color(0xFFBDE0FE)],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Wave Image
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/wave.png',
                fit: BoxFit.cover,
                height: waveHeight,
              ),
            ),

            // Main Content - No ScrollView, using a Column with mainAxisSize.min
            Padding(
              padding: EdgeInsets.only(
                top: waveHeight * 0.5,
                bottom: screenHeight * 0.02,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Meditation Image
                  Container(
                    width: screenWidth,
                    height: meditationHeight,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/meditation.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  // Welcome Text
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.07,
                      top: spacingMedium,
                    ),
                    child: Text(
                      'Hello,\nWelcome Back!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: headingFontSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(height: spacingMedium),

                  // Email TextField
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                    child: Container(
                      height: fieldHeight,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Email or Phone',
                          hintStyle: TextStyle(
                            color: Color(0xFF5B5B5B),
                            fontSize: fieldFontSize,
                          ),
                          prefixIcon: Icon(Icons.person_outline, size: fieldHeight * 0.5),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: spacingMedium),

                  // Password TextField
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                    child: Container(
                      height: fieldHeight,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: TextField(
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Color(0xFF5B5B5B),
                            fontSize: fieldFontSize,
                          ),
                          prefixIcon: Icon(Icons.lock_outline, size: fieldHeight * 0.5),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              size: fieldHeight * 0.5,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        ),
                      ),
                    ),
                  ),

                  // Remember me and Forgot password
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        screenWidth * 0.07,
                        spacingSmall,
                        screenWidth * 0.07,
                        0
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: fieldHeight * 0.25,
                              height: fieldHeight * 0.25,
                              decoration: ShapeDecoration(
                                color: _rememberMe ? Color(0xFF023047) : Color(0xFFD9D9D9),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1, color: Color(0xFFB3B3B3)),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              child: Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value ?? false;
                                  });
                                },
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                color: Color(0xFF5B5B5B),
                                fontSize: smallFontSize,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'forgot password?',
                            style: TextStyle(
                              color: Color(0xFF023047),
                              fontSize: smallFontSize,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Sign In Button
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        screenWidth * 0.07,
                        spacingMedium,
                        screenWidth * 0.07,
                        0
                    ),
                    child: Container(
                      width: double.infinity,
                      height: buttonHeight,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(1.00, 0.00),
                          end: Alignment(-1, 0),
                          colors: [Color(0xFF023047), Color(0xFF337291)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: buttonFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Or continue with
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: spacingMedium),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: screenWidth * 0.15,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color(0xFF5B5B5B),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                          child: Text(
                            'or continue with',
                            style: TextStyle(
                              color: Color(0xFF5B5B5B),
                              fontSize: smallFontSize,
                            ),
                          ),
                        ),
                        Container(
                          width: screenWidth * 0.15,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color(0xFF5B5B5B),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Social Sign Up Buttons
                  ..._buildSocialButtons(
                      screenWidth: screenWidth,
                      buttonHeight: socialButtonHeight,
                      fontSize: fieldFontSize,
                      spacingSmall: spacingSmall
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSocialButtons({
    required double screenWidth,
    required double buttonHeight,
    required double fontSize,
    required double spacingSmall,
  }) {
    final buttons = [
      {'text': 'Sign up with Email or phone', 'icon': 'assets/icons/Email.png', 'route': '/signupEmail'},
      {'text': 'Sign up with Google', 'icon': 'assets/icons/google.png', 'route': ''},
      {'text': 'Sign up with Facebook', 'icon': 'assets/icons/facebook.png', 'route': ''},
      {'text': 'Sign up with Apple', 'icon': 'assets/icons/apple.png', 'route': ''},
    ];

    return buttons.map((button) => Padding(
      padding: EdgeInsets.fromLTRB(
          screenWidth * 0.07,
          0,
          screenWidth * 0.07,
          spacingSmall
      ),
      child: Container(
        width: double.infinity,
        height: buttonHeight,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: TextButton(
          onPressed: () {
            if (button['route']!.isNotEmpty) {
              Navigator.pushNamed(context, button['route']!);
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            children: [
              SizedBox(width: screenWidth * 0.03),
              Image.asset(
                button['icon']!,
                width: buttonHeight * 0.6,
                height: buttonHeight * 0.6,
              ),
              SizedBox(width: screenWidth * 0.03),
              Text(
                button['text']!,
                style: TextStyle(
                  color: Color(0xFF323232),
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    )).toList();
  }
}
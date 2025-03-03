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
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.11, -0.99),
            end: Alignment(-0.11, 0.99),
            colors: [Colors.white, Color(0xFFBDE0FE)],
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // Wave Image
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/wave.png', // Path to your wave image
                  fit: BoxFit.cover,
                  height: 200, // Adjust height as needed
                ),
              ),

              // Status Bar Items (Battery, WiFi, etc.)
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 42,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // You can add status bar icons here if needed
                    ],
                  ),
                ),
              ),

              // Main Content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Meditation Image at the very top
                  Align(
                    alignment: Alignment.topRight, // Moves the image to the top-right
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5, // Adjust width as needed
                      height: 226,
                      child: Image.asset(
                        'assets/images/meditation.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  // Welcome Text
                  Padding(
                    padding: const EdgeInsets.only(left: 28, top: 10), // Adjust spacing
                    child: Text(
                      'Hello,\nWelcome Back!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16), // Reduce space

                  // Email TextField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Container(
                      height: 43,
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
                            fontSize: 15,
                          ),
                          prefixIcon: Icon(Icons.person_outline),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12), // Reduce space

                  // Password TextField
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Container(
                      height: 43,
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
                            fontSize: 15,
                          ),
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
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
                    padding: const EdgeInsets.fromLTRB(28, 12, 28, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
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
                            const SizedBox(width: 8),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                color: Color(0xFF5B5B5B),
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'forgot password?',
                            style: TextStyle(
                              color: Color(0xFF023047),
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Sign In Button
                  Padding(
                    padding: const EdgeInsets.fromLTRB(28, 20, 28, 0),
                    child: Container(
                      width: double.infinity,
                      height: 49,
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
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 62,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color(0xFF5B5B5B),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'or continue with',
                            style: TextStyle(
                              color: Color(0xFF5B5B5B),
                              fontSize: 11,
                            ),
                          ),
                        ),
                        Container(
                          width: 62,
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
                  ..._buildSocialButtons(),
                ],
              )
              ,
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSocialButtons() {
    final buttons = [
      {'text': 'Sign up with Email or phone', 'icon': 'assets/icons/Email.png', 'route': '/signupEmail'},
      {'text': 'Sign up with Google', 'icon': 'assets/icons/google.png', 'route': ''},
      {'text': 'Sign up with Facebook', 'icon': 'assets/icons/facebook.png', 'route': ''},
      {'text': 'Sign up with Apple', 'icon': 'assets/icons/apple.png', 'route': ''},
    ];

    return buttons.map((button) => Padding(
      padding: const EdgeInsets.fromLTRB(27, 0, 27, 10),
      child: Container(
        width: double.infinity,
        height: 40,
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              Image.asset(
                button['icon']!,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 12),
              Text(
                button['text']!,
                style: TextStyle(
                  color: Color(0xFF323232),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),

      ),
    )

    ).toList();


  }
}
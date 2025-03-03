import 'package:flutter/material.dart';

class SignUpEmail extends StatefulWidget {
  @override
  _SignUpEmailState createState() => _SignUpEmailState();
}

class _SignUpEmailState extends State<SignUpEmail> {
  bool isEmailSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.10, -1.0),
            end: Alignment(-0.1, 1.0),
            colors: [Colors.white, Color(0xFFBDE0FE)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top section with images
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              'assets/images/wave.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: Image.asset(
                              'assets/images/signup.png',
                              width: MediaQuery.of(context).size.width * 0.45,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),

                    // Create your account header
                    Text(
                      'Create your account',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 20),

                    // Email/Phone toggle
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isEmailSelected = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(
                                  color: isEmailSelected ? Color(0xFF219EBC) : Color(0xFF999999),
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                width: 150,
                                height: 2,
                                color: isEmailSelected ? Color(0xFF219EBC) : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isEmailSelected = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'Phone',
                                style: TextStyle(
                                  color: isEmailSelected ? Color(0xFF999999) : Color(0xFF219EBC),
                                  fontSize: 15,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                width: 150,
                                height: 2,
                                color: isEmailSelected ? Colors.transparent : Color(0xFF219EBC),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    // Form fields
                    if (isEmailSelected) ...[
                      _buildInputField('Username', 'assets/icons/username_icon.png'),
                      SizedBox(height: 15),
                      _buildInputField('Email', 'assets/icons/email_icon.png'),
                    ] else ...[
                      _buildPhoneField(),
                    ],

                    SizedBox(height: 15),
                    _buildInputField('Password', 'assets/icons/password_icon.png'),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          'Password should contain 8+ characters',
                          style: TextStyle(
                            color: Color(0xFF5B5B5B),
                            fontSize: 9,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 15),
                    _buildInputField('Confirm Password', 'assets/icons/password_icon.png'),

                    SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Color(0xFFB3B3B3)),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'I agree with Privacy and Policy',
                          style: TextStyle(
                            color: Color(0xFF5B5B5B),
                            fontSize: 11,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 25),
                    _buildSignUpButton(),

                    SizedBox(height: 25),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Color(0xFF5B5B5B),
                              fontSize: 11,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              // Handle Sign In navigation
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Color(0xFF219EBC),
                                fontSize: 11,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildInputField(String hintText, String iconAsset) {
    return Container(
      width: double.infinity,
      height: 43,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(iconAsset),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 6),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color(0xFF5B5B5B),
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneField() {
    return Container(
      width: double.infinity,
      height: 43,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              width: 50,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Color(0xFFE8E8E8)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/United States.png',
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(width: 2),
                  Text(
                    '+1',
                    style: TextStyle(
                      color: Color(0xFF219EBC),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xFF219EBC),
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Phone Number',
                hintStyle: TextStyle(
                  color: Color(0xFF5B5B5B),
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Container(
      width: double.infinity,
      height: 49,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.0, 0.0),
          end: Alignment(-1.0, 0.0),
          colors: [Color(0xFF023047), Color(0xFF337190)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Center(
        child: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }


}
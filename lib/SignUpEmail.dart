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
            begin: Alignment(0.0, -1.0),
            end: Alignment(0.0, 1.0),
            colors: [Colors.white, Color(0xFF999999)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.10, -1.0),
                    end: Alignment(-0.1, 1.0),
                    colors: [Colors.white, Color(0xFFBDE0FE)],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 28,
              top: 232,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ],
              ),
            ),
            if (isEmailSelected) ...[
              Positioned(
                left: 29,
                top: 325,
                child: Container(
                  width: 321,
                  height: 43,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Username',
                        style: TextStyle(
                          color: Color(0xFF5B5B5B),
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 29,
                top: 380,
                child: Container(
                  width: 321,
                  height: 43,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: Color(0xFF5B5B5B),
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ] else ...[
              Positioned(
                left: 29,
                top: 325,
                child: Container(
                  width: 325,
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
                              SizedBox(width: 5),
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
                ),
              ),
            ],
            Positioned(
              left: 29,
              top: 435,
              child: Container(
                width: 325,
                height: 43,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(
                        color: Color(0xFF5B5B5B),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 29,
              top: 501,
              child: Container(
                width: 325,
                height: 43,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(
                        color: Color(0xFF5B5B5B),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 34,
              top: 560,
              child: Row(
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
            ),
            Positioned(
              left: 29,
              top: 620,
              child: Container(
                width: 321,
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
              ),
            ),
            Positioned(
              left: 175,
              top: 480,
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
            Positioned(
              left: 100,
              top: 742,
              child: Row(
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
            Positioned(
              left: 0,
              top: 24,
              child: Container(
                width: 383,
                height: 201,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/wave.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 205,
              top: 45,
              child: Container(
                width: 180,
                height: 201,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/signup.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 42,
              top: 337,
              child: Container(
                width: 18.67,
                height: 17.33,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/username_icon.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 39,
              top: 443,
              child: Container(
                width: 26,
                height: 23,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/password_icon.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 39,
              top: 509,
              child: Container(
                width: 26,
                height: 23,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/password_icon.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 38,
              top: 390,
              child: Container(
                width: 26,
                height: 23,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/email_icon.png'),
                    fit: BoxFit.contain,
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

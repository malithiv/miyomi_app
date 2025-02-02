import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MindBooks2 extends StatelessWidget {
  const MindBooks2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Make status bar transparent
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.49, -0.87),
                  end: Alignment(-0.49, 0.87),
                  colors: [Colors.white, Color(0xFFBFC300)],
                ),
              ),
              child: Stack(
                children: [
                  // Status Bar Area
                  _buildStatusBar(),

                  // Back Button
                  Positioned(
                    left: 6,
                    top: 46,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        'assets/icons/back_arrow.png',
                        width: 48,
                        height: 45,
                      ),
                    ),
                  ),

                  // Book Cover Image
                  Positioned(
                    left: 84,
                    top: 69,
                    child: Container(
                      width: 208,
                      height: 301,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/deep_kindness_large.png'),
                          fit: BoxFit.fill,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // White Content Container
                  Positioned(
                    left: 0,
                    top: 258,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 11),
                          Container(
                            width: 49,
                            height: 6,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(height: 18),
                          const Text(
                            'Deep Kindness',
                            style: TextStyle(
                              color: Color(0xFF023047),
                              fontSize: 20,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.20,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 38),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'In a world where people are often rushing, overwhelmed by personal responsibilities and challenges, kindness is frequently overshadowed by the pressures of daily life. Yet, deep within each of us lies the ability to bring about transformative change not through grand gestures, but through small, consistent acts of kindness that ripple outwards and create a lasting impact on society.\n\n',
                                    style: TextStyle(
                                      color: Color(0xFF736B66),
                                      fontSize: 13,
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w600,
                                      height: 1.15,
                                      letterSpacing: -0.13,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'The essence of deep kindness goes beyond superficial politeness. It is about intentional, meaningful actions that foster genuine connection, uplift those in need, and remind people of their shared humanity. Imagine if, each day, we took a moment to be more mindful of those around us—our neighbors, colleagues, even strangers in passing.\n\n',
                                    style: TextStyle(
                                      color: Color(0xFF736B66),
                                      fontSize: 13,
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w600,
                                      height: 1.15,
                                      letterSpacing: -0.13,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'The Power of Listening:',
                                    style: TextStyle(
                                      color: Color(0xFF736B66),
                                      fontSize: 13,
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w800,
                                      height: 1.15,
                                      letterSpacing: -0.13,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: '                           Deep kindness begins with understanding. In a world filled with noise, truly listening to someone can be one of the kindest acts you can offer. By giving someone your full attention, you show them that they matter. Listening without judgment or distraction allows people to feel seen and heard, often for th',
                                    style: TextStyle(
                                      color: Color(0xFF736B66),
                                      fontSize: 13,
                                      fontFamily: 'Urbanist',
                                      fontWeight: FontWeight.w600,
                                      height: 1.15,
                                      letterSpacing: -0.13,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bottom Navigation
                  Positioned(
                    left: 11,
                    right: 11,
                    bottom: 20,
                    child: _buildBottomNavBar(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Positioned(
      left: 0,
      top: 0,
      right: 0,
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Signal Strength Indicators
            ...List.generate(4, (index) => Container(
              width: 3,
              height: 10 - (index * 2),
              margin: EdgeInsets.only(right: 5),
              decoration: ShapeDecoration(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1234),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFF023047),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: const Color(0xFFFFB703), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem('Home', 'assets/icons/home.png', false),
          _buildNavItem('Library', 'assets/icons/library.png', true),
          _buildNavItem('Notification', 'assets/icons/notification.png', false),
          _buildNavItem('Premium', 'assets/icons/premium.png', false),
          _buildNavItem('Create', 'assets/icons/create.png', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, String iconPath, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          iconPath,
          width: 29,
          height: 29,
          color: isSelected ? const Color(0xFFFFB703) : Colors.white,
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xFFFFB703) : Colors.white,
            fontSize: 9,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
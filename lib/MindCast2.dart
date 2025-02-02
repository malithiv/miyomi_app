import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MindCast2 extends StatelessWidget {
  const MindCast2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final padding = MediaQuery.of(context).padding;

    // Calculate responsive dimensions
    final coverArtSize = screenWidth * 0.75;
    final horizontalPadding = screenWidth * 0.04;
    final verticalPadding = screenHeight * 0.02;

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0.48, -0.88),
            end: const Alignment(-0.48, 0.88),
            colors: [
              const Color(0xFFFB8500),
              Colors.white.withOpacity(0.7),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Background Image with Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/podcast_bg.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      const Color(0xFFFB8500).withOpacity(0.7),
                      BlendMode.overlay,
                    ),
                  ),
                ),
              ),
            ),

            // Main Content
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: screenHeight,
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    padding.top + verticalPadding,
                    horizontalPadding,
                    verticalPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Top Section
                      Column(
                        children: [
                          _buildHeader(),
                          SizedBox(height: screenHeight * 0.04),
                          _buildCoverArt(coverArtSize),
                        ],
                      ),

                      // Bottom Section
                      Column(
                        children: [
                          _buildTitleSection(screenWidth),
                          SizedBox(height: screenHeight * 0.04),
                          _buildPlayerControls(screenWidth, screenHeight),
                          SizedBox(height: screenHeight * 0.02),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {},
        child: Image.asset(
          'assets/icons/back_arrow.png',
          width: 48,
          height: 45,
        ),
      ),
    );
  }

  Widget _buildCoverArt(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
          image: AssetImage('assets/images/mindcast.jpg'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(5, 5),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleSection(double screenWidth) {
    return Column(
      children: [
        SizedBox(
          width: screenWidth * 0.8,
          child: const Text(
            'The Art of Mindfulness in Everyday Moments',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF023047),
              fontSize: 14,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Happy cast',
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildPlayerControls(double screenWidth, double screenHeight) {
    final progressBarHeight = screenHeight * 0.01;
    final controlSize = screenWidth * 0.15;

    return Column(
      children: [
        // Progress Bar
        Column(
          children: [
            Stack(
              children: [
                // Background bar
                Container(
                  width: double.infinity,
                  height: progressBarHeight,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8DCD8),
                    borderRadius: BorderRadius.circular(1234),
                  ),
                ),
                // Progress indicator
                Container(
                  width: screenWidth * 0.5,
                  height: progressBarHeight,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFB8500),
                    borderRadius: BorderRadius.circular(1234),
                  ),
                ),
                // Drag handle
                Positioned(
                  left: screenWidth * 0.48,
                  top: -progressBarHeight,
                  child: Container(
                    width: progressBarHeight * 3,
                    height: progressBarHeight * 3,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFB8500),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    '12:32',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '25:30',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.04),

        // Player Controls
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildControlButton('assets/icons/repeat.png', controlSize * 0.7, controlSize * 0.5),
            _buildControlButton('assets/icons/previous.png', controlSize * 0.5, controlSize * 0.6),
            _buildControlButton('assets/icons/play_large.png', controlSize, controlSize),
            _buildControlButton('assets/icons/next.png', controlSize * 0.5, controlSize * 0.6),
            _buildControlButton('assets/icons/shuffle.png', controlSize * 0.7, controlSize * 0.5),
          ],
        ),
      ],
    );
  }

  Widget _buildControlButton(String iconPath, double width, double height) {
    return GestureDetector(
      onTap: () {},
      child: Image.asset(
        iconPath,
        width: width,
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }
}
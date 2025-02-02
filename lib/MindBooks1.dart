import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MindBooks1 extends StatelessWidget {
  const MindBooks1({Key? key}) : super(key: key);

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
      body: Stack(
        children: [
          // Main scrollable content
          _buildMainContent(context),

          // Fixed bottom navigation bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildBottomNavBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.16, -0.99),
          end: Alignment(-0.16, 0.99),
          colors: [Colors.white, Color(0xFFBDE0FE)],
        ),
      ),
      child: CustomScrollView(
        slivers: [
          // Top gradient section with book cover
          SliverToBoxAdapter(
            child: Stack(
              children: [
                _buildTopGradient(screenWidth),
                Positioned(
                  left: 16,
                  top: 46,
                  child: IconButton(
                    icon: Image.asset('assets/icons/back_arrow.png'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  left: screenWidth * 0.23,  // Responsive positioning
                  top: screenHeight * 0.09,
                  child: Container(
                    width: screenWidth * 0.58,  // Responsive width
                    height: screenHeight * 0.38,  // Responsive height
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
              ],
            ),
          ),

          // Details section
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              margin: EdgeInsets.only(top: screenHeight * 0.32),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: 49,
                      height: 6,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 25, 25, 100),
                      child: _buildBookDetails(screenWidth),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopGradient(double width) {
    return Container(
      width: width,
      height: 281,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.49, -0.87),
          end: Alignment(-0.49, 0.87),
          colors: [Colors.white, Color(0xFFBFC300)],
        ),
      ),
    );
  }

  Widget _buildBookDetails(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '23 Feb, 2023',
          style: TextStyle(
            color: Color(0xFF736B66),
            fontSize: 9,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Deep Kindness',
          style: TextStyle(
            color: Color(0xFF023047),
            fontSize: 20,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        _buildRatingRow(),
        const SizedBox(height: 16),
        _buildOverviewSection(),
        const Spacer(),
        _buildActionButtons(width),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildRatingRow() {
    return Row(
      children: [
        Image.asset('assets/icons/star.png', width: 20, height: 20),
        const SizedBox(width: 4),
        const Text(
          '4.5',
          style: TextStyle(
            color: Color(0xFF023047),
            fontSize: 14,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 12),
        Image.asset('assets/icons/reader.png', width: 20, height: 20),
        const SizedBox(width: 4),
        const Text(
          '200K',
          style: TextStyle(
            color: Color(0xFF023047),
            fontSize: 14,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildOverviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Overview',
          style: TextStyle(
            color: Color(0xFF023047),
            fontSize: 15,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12),
        Text(
          'In a world where people are often rushing, overwhelmed by personal responsibilities and challenges, kindness is frequently overshadowed by the pressures of daily life. Yet, deep within each of us lies the ability to bring about transformative change not through grand gestures, but through small, consistent acts of kindness that ripple outwards and create a lasting impact on society.\n\nThe essence of deep kindness goes beyond superficial...',
          style: TextStyle(
            color: Color(0xFF736B66),
            fontSize: 11,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w600,
            height: 1.27,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(double width) {
    return Row(
      children: [
        Container(
          width: 57,
          height: 57,
          decoration: BoxDecoration(
            color: const Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset('assets/icons/bookmark.png'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 57,
            decoration: BoxDecoration(
              color: const Color(0xFFFB8500),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'View',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(11, 0, 11, 20),
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFF023047),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: const Color(0xFFFFB703), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
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
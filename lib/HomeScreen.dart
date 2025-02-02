import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      extendBodyBehindAppBar: true, // Extend content behind app bar
      extendBody: true, // Extend content behind bottom navigation
      body: Stack(
        children: [
          // Background container with gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.03, -1.00),
                end: Alignment(-0.03, 1),
                colors: [Colors.white, Color(0xFFBDE0FE)],
              ),
            ),
          ),

          // Scrollable content
          SafeArea(
            bottom: false, // Don't add padding at bottom for nav bar
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 100), // Add padding for nav bar
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAppBar(),
                    _buildFeaturedBanner(),
                    _buildQuickActions(),
                    _buildAccessButton(),
                    _buildCategories(),
                    _buildCategories(),
                    _buildCategories(),
                  ],
                ),
              ),
            ),
          ),

          // Fixed bottom navigation bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 20, // Adjust this value to control bottom spacing
            child: _buildNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Good morning!',
            style: TextStyle(
              color: Color(0xFF023047),
              fontSize: 24,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              Image.asset('assets/icons/search.png', width: 28, height: 24),
              SizedBox(width: 4),
              Image.asset('assets/icons/profile.png', width: 29, height: 28),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedBanner() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 132,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/featured_banner.png'),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 3, color: Color(0xFFF8F8FF)),
          borderRadius: BorderRadius.circular(30),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildActionButton('Discover weekly'),
              _buildActionButton('James hosting now'),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildActionButton('Discover weekly'),
              _buildActionButton('Discover weekly'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text) {
    return Container(
      width: 154.5,
      height: 47,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.00, 0.00),
          end: Alignment(-1, 0),
          colors: [Color(0xFF023047), Color(0xFF43D7F7)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xFFFFF9F9),
            fontSize: 12,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildAccessButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 47,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.00, 0.00),
          end: Alignment(-1, 0),
          colors: [Color(0xFF023047), Color(0xFF43D7F7)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF023047), Color(0xFF219EBC)],
              ),
            ),
            child: Image.asset('assets/icons/access.png', width: 22, height: 20),
          ),
          SizedBox(width: 10),
          Text(
            'Access Your Self Now',
            style: TextStyle(
              color: Color(0xFFFFF9F9),
              fontSize: 12,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Categories',
            style: TextStyle(
              color: Color(0xFF023047),
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              _buildCategoryCard('Mindsperts Booking', 'assets/images/booking.jpg'),
              SizedBox(width: 16),
              _buildCategoryCard('Mind Checker', 'assets/images/checker.png'),
              SizedBox(width: 16),
              _buildCategoryCard('Mindcast', 'assets/images/mindcast.jpg'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String title, String imagePath) {
    return Column(
      children: [
        Container(
          width: 122,
          height: 119,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }


  // Widget _buildRecommendations() {
  //   // Similar implementation to categories section
  //   // Add your recommendations widgets here
  // }

  Widget _buildNavigationBar() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: ShapeDecoration(
        color: Color(0xFF023047),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFFFB703)),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem('Home', 'assets/icons/home.png', true),
          _buildNavItem('Library', 'assets/icons/library.png', false),
          _buildNavItem('Notification', 'assets/icons/notification.png', false),
          _buildNavItem('Premium', 'assets/icons/premium.png', false),
          _buildNavItem('Create', 'assets/icons/create.png', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, String iconPath, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          iconPath,
          width: 29,
          height: 29,
          color: isActive ? Color(0xFFFFB703) : Colors.white,
        ),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Color(0xFFFFB703) : Colors.white,
            fontSize: isActive ? 11 : 9,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
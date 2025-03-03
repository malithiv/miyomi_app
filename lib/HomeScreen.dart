import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miyomi/CustomBottomNavBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
                padding: const EdgeInsets.only(bottom: 100), // Add padding for nav bar
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
        ],
      ),

      // Use CustomBottomNavBar
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavBarTap,
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
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
              const SizedBox(width: 4),
              Image.asset('assets/icons/profile.png', width: 29, height: 28),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 132,
      decoration: ShapeDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/featured_banner.png'),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 3, color: Color(0xFFF8F8FF)),
          borderRadius: BorderRadius.circular(30),
        ),
        shadows: const [
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
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildActionButton('Discover weekly'),
              _buildActionButton('James hosting now'),
            ],
          ),
          const SizedBox(height: 12),
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
        gradient: const LinearGradient(
          begin: Alignment(1.00, 0.00),
          end: Alignment(-1, 0),
          colors: [Color(0xFF023047), Color(0xFF43D7F7)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
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
          style: const TextStyle(
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
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 47,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(1.00, 0.00),
          end: Alignment(-1, 0),
          colors: [Color(0xFF023047), Color(0xFF43D7F7)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: const [
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
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF023047), Color(0xFF219EBC)],
              ),
            ),
            child: Image.asset('assets/icons/access.png', width: 22, height: 20),
          ),
          const SizedBox(width: 10),
          const Text(
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
        const Padding(
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
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              _buildCategoryCard('Mindsperts Booking', 'assets/images/booking.jpg'),
              const SizedBox(width: 16),
              _buildCategoryCard('Mind Checker', 'assets/images/checker.png'),
              const SizedBox(width: 16),
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
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

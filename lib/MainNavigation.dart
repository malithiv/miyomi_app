// main_navigation.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'HomeScreen.dart'; // Your existing HomeScreen
// Import other screens as you create them
import 'ContentScreen.dart';
import 'NotificationScreen.dart';
import 'Premium.dart';
import 'Create.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ContentScreen(),
    // const NotificationScreen(),
    // const PremiumScreen(),
    // const CreateScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Set status bar style for all screens
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
          _screens[_currentIndex],
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: _buildNavigationBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationBar() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: ShapeDecoration(
        color: const Color(0xFF023047),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFFFB703)),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem('Home', 'assets/icons/home.png', _currentIndex == 0, () => _updateIndex(0)),
          _buildNavItem('Library', 'assets/icons/library.png', _currentIndex == 1, () => _updateIndex(1)),
          _buildNavItem('Notification', 'assets/icons/notification.png', _currentIndex == 2, () => _updateIndex(2)),
          _buildNavItem('Premium', 'assets/icons/premium.png', _currentIndex == 3, () => _updateIndex(3)),
          _buildNavItem('Create', 'assets/icons/create.png', _currentIndex == 4, () => _updateIndex(4)),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, String iconPath, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: 29,
            height: 29,
            color: isActive ? const Color(0xFFFFB703) : Colors.white,
          ),
          Text(
            label,
            style: TextStyle(
              color: isActive ? const Color(0xFFFFB703) : Colors.white,
              fontSize: isActive ? 11 : 9,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  void _updateIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
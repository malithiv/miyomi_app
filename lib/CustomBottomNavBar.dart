import 'package:flutter/material.dart';
import 'package:miyomi/ContentScreen.dart';
import 'package:miyomi/Create.dart';
import 'package:miyomi/HomeScreen.dart';
import 'package:miyomi/NotificationScreen.dart';
import 'package:miyomi/Premium.dart';


class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  void _navigate(BuildContext context, int index) {
    Widget screen;
    switch (index) {
      case 0:
        screen = const HomeScreen();
        break;
      case 1:
        screen = const ContentScreen();
        break;
      case 2:
        screen = const NotificationScreen();
        break;
      case 3:
        screen = const Premium();
        break;
      case 4:
        screen = const Create();
        break;
      default:
        return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          _buildNavItem('Home', 'assets/icons/home.png', currentIndex == 0, () => _navigate(context, 0)),
          _buildNavItem('Library', 'assets/icons/library.png', currentIndex == 1, () => _navigate(context, 1)),
          _buildNavItem('Notification', 'assets/icons/notification.png', currentIndex == 2, () => _navigate(context, 2)),
          _buildNavItem('Premium', 'assets/icons/premium.png', currentIndex == 3, () => _navigate(context, 3)),
          _buildNavItem('Create', 'assets/icons/create.png', currentIndex == 4, () => _navigate(context, 4)),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, String iconPath, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
      ),
    );
  }
}

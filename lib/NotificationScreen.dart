import 'package:flutter/material.dart';
import 'CustomBottomNavBar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _isToday = true; // Toggle between Today and Last Week

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.10, -1.00),
            end: Alignment(-0.1, 1),
            colors: [Colors.white, Color(0xFF8ECAF6)],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Color(0xFF023047)),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              // Title
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 16.0),
                child: Text(
                  'Community Notification',
                  style: TextStyle(
                    color: Color(0xFF023047),
                    fontSize: 30,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Toggle buttons (Today / Last Week)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: ShapeDecoration(
                    color: Color(0xFFE8DCD8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: Row(
                    children: [
                      _buildToggleButton('Today', true),
                      _buildToggleButton('Last Week', false),
                    ],
                  ),
                ),
              ),

              // Notifications list
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                  child: Column(
                    children: _isToday ? _buildTodayNotifications() : _buildLastWeekNotifications(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 2, // Index for NotificationScreen
        onTap: (index) {
          // Handle navigation logic here
        },
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isToday) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _isToday = isToday),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: _isToday == isToday ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(28),
            boxShadow: _isToday == isToday
                ? [
              BoxShadow(
                color: Color(0x0C3F3C36),
                blurRadius: 16,
                offset: Offset(0, 8),
              )
            ]
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: _isToday == isToday ? Color(0xFF023047) : Color(0xFF926247),
              fontSize: 14,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTodayNotifications() {
    return [
      _buildNotificationCard('You have new followers!', 'Akari M just followed you.', Color(0xFFF0F2E7), 'assets/icons/followers_icon.png'),
      _buildNotificationCard('You have unread messages!', '52 Total Unread Messages.', Color(0xFFFFEDD5), 'assets/icons/messages_icon.png'),
      _buildNotificationCard('Someone commented!', 'Dr. Hikari commented on your post.', Color(0xFFF8F4C8), 'assets/icons/comment_icon.png'),
    ];
  }

  List<Widget> _buildLastWeekNotifications() {
    return [
      _buildNotificationCard('Someone posted new video!', 'John Cena just posted a video.', Color(0xFFF7F4F2), 'assets/icons/video_icon.png'),
      _buildNotificationCard('Someone mentioned you!', 'Akari M just mentioned you.', Color(0xFFF7F4F2), 'assets/icons/mention_icon.png'),
    ];
  }

  Widget _buildNotificationCard(String title, String description, Color backgroundColor, String iconAsset) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      height: 88,
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x0C4B3425),
            blurRadius: 16,
            offset: Offset(0, 8),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: ShapeDecoration(
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            child: Center(
              child: Image.asset(iconAsset, width: 24, height: 24),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF4E3321))),
                const SizedBox(height: 8),
                Text(description, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF736A66))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
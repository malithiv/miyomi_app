import 'package:flutter/material.dart';

class ContentScreen1 extends StatelessWidget {
  const ContentScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.10, -1.00),
            end: Alignment(-0.1, 1),
            colors: [Colors.white, Color(0xFFBDE0FE)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              _buildFilterTabs(),
              _buildSearchBar(),
              _buildPodcastList(),
              _buildNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 119,
      decoration: ShapeDecoration(
        color: Color(0xFF023047),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                width: 49,
                height: 49,
                decoration: ShapeDecoration(
                  color: Color(0xFF115E88), // Placeholder for profile image
                  shape: CircleBorder(),
                ),
              ),
              SizedBox(width: 10),
              Text(
                'Tharindu Nipun',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterTabs() {
    final tabs = ['All', 'Happy Cast', 'Love Cast', 'Relax Cast', 'Bla bla'];
    return SizedBox(
      height: 53,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        itemCount: tabs.length,
        itemBuilder: (context, index) => _buildFilterTab(tabs[index], index == 0),
      ),
    );
  }

  Widget _buildFilterTab(String text, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      constraints: BoxConstraints(minWidth: 48),
      decoration: ShapeDecoration(
        color: isSelected ? Color(0xFF023047) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000),
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isSelected ? Colors.white : Color(0xFF5F6368),
          fontSize: 10,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Search by name, author, keyword',
              style: TextStyle(
                color: Color(0xFF5F6368),
                fontSize: 12,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            width: 26,
            height: 22,
            color: Colors.transparent, // Placeholder for search icon
          ),
          SizedBox(width: 12),
          Container(
            width: 33,
            height: 25,
            color: Colors.transparent, // Placeholder for filter icon
          ),
        ],
      ),
    );
  }

  Widget _buildPodcastList() {
    final podcasts = [
      {
        'title': 'The Power of Positivity: Transform Your Mindset for a Happier Life',
        'subtitle': 'Happy cast | 7 episodes',
        'image': 'assets/images/podcasts/podcast1.png'
      },
      {
        'title': "Finding Joy in the Everyday: How to Embrace Life's Simple Pleasures",
      'subtitle': 'Relax cast | 4 episodes',
      },
      {
        'title': 'The Power of Positivity: Transform Your Mindset for a Happier Life',
        'subtitle': 'Relax cast | 30:20',
      },
      {
        'title': 'Simple Steps to Boost Happiness: Practical Tips for a Brighter Mood',
        'subtitle': 'Love cast | 25:30',
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: podcasts.map((podcast) => _buildPodcastItem(
          title: podcast['title']!,
          subtitle: podcast['subtitle']!,
        )).toList(),
      ),
    );
  }

  Widget _buildPodcastItem({required String title, required String subtitle,}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: ShapeDecoration(
              color: Color(0xFFE8F4FF), // Placeholder for podcast image
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF023047),
                    fontSize: 11,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Color(0xFF999999),
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
    );
  }

  Widget _buildNavigationBar() {
    final navItems = [
      {'label': 'Home', 'isActive': false},
      {'label': 'Library', 'isActive': true},
      {'label': 'Notification', 'isActive': false},
      {'label': 'Premium', 'isActive': false},
      {'label': 'Create', 'isActive': false},
    ];

    return Container(
      margin: EdgeInsets.all(20),
      height: 60,
      decoration: ShapeDecoration(
        color: Color(0xFF023047),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFFFB703)),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: navItems.map((item) => _buildNavItem(
          label: item['label'] as String,
          isActive: item['isActive'] as bool,
        )).toList(),
      ),
    );
  }

  Widget _buildNavItem({required String label, required bool isActive}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 29,
          height: 29,
          color: Colors.transparent, // Placeholder for nav icon
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
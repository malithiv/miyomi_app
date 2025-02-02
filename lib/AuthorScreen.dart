import 'package:flutter/material.dart';

class AuthorScreen extends StatelessWidget {
  const AuthorScreen({Key? key}) : super(key: key);

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
              _buildBackButton(),
              _buildAuthorProfile(),
              _buildStats(),
              _buildFollowButton(),
              _buildBio(),
              _buildEpisodesList(),
              _buildNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 61),
      child: Container(
        width: 48,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        // Add back button icon here
      ),
    );
  }

  Widget _buildAuthorProfile() {
    return Column(
      children: [
        Container(
          width: 93,
          height: 93,
          decoration: ShapeDecoration(
            color: Color(0xFFE8F4FF), // Placeholder for profile image
            shape: OvalBorder(
              side: BorderSide(width: 1, color: Color(0xFFC3C3C3)),
            ),
          ),
        ),
        SizedBox(height: 18),
        Text(
          'Tom Smith',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildStats() {
    final stats = [
      {'count': '12', 'label': 'Podcasts'},
      {'count': '1K', 'label': 'Followers'},
      {'count': '12K', 'label': 'Likes'},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: stats.map((stat) => _buildStatItem(
          count: stat['count']!,
          label: stat['label']!,
        )).toList(),
      ),
    );
  }

  Widget _buildStatItem({required String count, required String label}) {
    return Column(
      children: [
        Text(
          count,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF999999),
            fontSize: 15,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildFollowButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 31, vertical: 10),
      height: 41,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Color(0xFFFFB703), Color(0xFFFB8500)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          'Follow',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  Widget _buildBio() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      child: Text(
        'It is a long established fact that a reader will be distract by the readable content of a page when looking at its layout.',
        style: TextStyle(
          color: Color(0xFF999999),
          fontSize: 13,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildEpisodesList() {
    final episodes = [
      {
        'title': 'EP : 12 | The Power of Positivity',
        'subtitle': 'Happy cast | 17 episodes',
      },
      {
        'title': 'EP : 12 | The Power of Positivity',
        'subtitle': 'Happy cast | 17 episodes',
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(20),
      itemCount: episodes.length,
      itemBuilder: (context, index) => _buildEpisodeCard(
        episode: episodes[index],
      ),
    );
  }

  Widget _buildEpisodeCard({required Map<String, String> episode}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            width: 106,
            height: 106,
            decoration: ShapeDecoration(
              color: Color(0xFFE8F4FF), // Placeholder for episode image
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  episode['title']!,
                  style: TextStyle(
                    color: Color(0xFF023047),
                    fontSize: 15,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  episode['subtitle']!,
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 11,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: 80,
                  height: 32,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFB8500),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Play',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
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
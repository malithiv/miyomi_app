import 'package:flutter/material.dart';

class ContentScreen2 extends StatefulWidget {
  const ContentScreen2({Key? key}) : super(key: key);

  @override
  State<ContentScreen2> createState() => _ContentScreen2State();
}

class _ContentScreen2State extends State<ContentScreen2> {
  bool isAuthorsTab = false;

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
              _buildSearchSection(),
              _buildTabSection(),
              if (isAuthorsTab) _buildAuthorsList() else _buildEpisodesList(),
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
                  color: Color(0xFF115E88),
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

  Widget _buildSearchSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(
            'Happy',
            style: TextStyle(
              color: Color(0xFF5F6368),
              fontSize: 12,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Container(
            width: 28,
            height: 28,
            color: Colors.transparent,
          ),
          SizedBox(width: 8),
          Container(
            width: 33,
            height: 25,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }
  Widget _buildTabSection() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => setState(() => isAuthorsTab = false),
                child: Text(
                  'Mindcast',
                  style: TextStyle(
                    color: !isAuthorsTab ? Color(0xFF023047) : Color(0xFF999999),
                    fontSize: 12,
                    fontFamily: 'Urbanist',
                    fontWeight: !isAuthorsTab ? FontWeight.w700 : FontWeight.w600,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => isAuthorsTab = true),
                child: Text(
                  'Authors',
                  style: TextStyle(
                    color: isAuthorsTab ? Color(0xFF023047) : Color(0xFF999999),
                    fontSize: 12,
                    fontFamily: 'Urbanist',
                    fontWeight: isAuthorsTab ? FontWeight.w700 : FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Stack(
            children: [
              Container(
                height: 1,
                color: Color(0xFF999999).withOpacity(0.6),
              ),
              Container(
                height: 2,
                width: 160,
                color: Color(0xFF023047),
                margin: EdgeInsets.only(
                  left: isAuthorsTab ? 160 : 0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEpisodesList() {
    final episodes = List.generate(4, (index) => {
      'title': 'EP : 12 | The Power of Positivity',
      'subtitle': 'Happy cast | 17 episodes',
    });

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: episodes.length,
      itemBuilder: (context, index) => _buildEpisodeCard(
        episode: episodes[index],
      ),
    );
  }

  Widget _buildEpisodeCard({required Map<String, String> episode}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 106,
            height: 106,
            decoration: ShapeDecoration(
              color: Color(0xFFE8F4FF),
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

  Widget _buildAuthorsList() {
    final authors = List.generate(6, (index) => {
      'name': 'Tom Smith',
      'contentCount': '25 Contents',
    });

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: authors.length,
      itemBuilder: (context, index) => _buildAuthorCard(
        author: authors[index],
      ),
    );
  }

  Widget _buildAuthorCard({required Map<String, String> author}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: ShapeDecoration(
              color: Color(0xFFE8F4FF),
              shape: CircleBorder(
                side: BorderSide(width: 1, color: Color(0xFFC3C3C3)),
              ),
            ),
          ),
          SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                author['name']!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 4),
              Text(
                author['contentCount']!,
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 11,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Spacer(),
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
                'Follow',
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
          color: Colors.transparent,
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
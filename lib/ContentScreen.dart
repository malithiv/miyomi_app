import 'package:flutter/material.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({Key? key}) : super(key: key);

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
              _buildCategorySection(),
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
      child: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    width: 49,
                    height: 49,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile.png'),
                        fit: BoxFit.fill,
                      ),
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
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    final tabs = ['All', 'MindCast', 'Mindflix', 'MindCourse', 'Mindbook'];
    return SizedBox(
      height: 53, // Fixed height for the tabs section
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
      constraints: BoxConstraints(minWidth: 48), // Minimum width constraint
      decoration: ShapeDecoration(
        color: isSelected ? Color(0xFF023047) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Color(0xFF5F6368),
          fontSize: 10,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
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
          Image.asset('assets/icons/search.png', width: 26, height: 22),
          SizedBox(width: 12),
          Image.asset('assets/icons/filter.png', width: 33, height: 25),
        ],
      ),
    );
  }

  Widget _buildCategorySection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Content Category',
            style: TextStyle(
              color: Color(0xFF736A66),
              fontSize: 18,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20),
          ..._buildCategoryCards(),
        ],
      ),
    );
  }

  List<Widget> _buildCategoryCards() {
    final categories = [
      {
        'title': 'Mindcast',
        'description': 'Share your voice and inspire minds with powerful content',
        'image': 'assets/images/mindcast_category.png'
      },
      {
        'title': 'Mindbooks',
        'description': 'Share your knowledge and create impactful content',
        'image': 'assets/images/mindbooks_category.png'
      },
      {
        'title': 'Mindflix',
        'description': 'Create and share trans-formative video content on mental wellness',
        'image': 'assets/images/mindflix_category.png'
      },
      // Add other categories as needed
    ];

    return categories.map((category) => _buildCategoryCard(
      title: category['title']!,
      description: category['description']!,
      imagePath: category['image']!,
    )).toList();
  }

  Widget _buildCategoryCard({
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 130,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.99, -0.16),
          end: Alignment(-0.99, 0.16),
          colors: [Colors.white, Color(0xFFB5E0FF)],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFBCB8B8)),
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: [
          BoxShadow(
            color: Color(0xFFB5E0FF),
            blurRadius: 4,
            offset: Offset(4, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: 175,
                height: 112,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF023047),
                      fontSize: 15,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      color: Color(0xFF736B66),
                      fontSize: 10,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Image.asset(
              'assets/icons/arrow_right.png',
              width: 27,
              height: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationBar() {
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

  Widget _buildNavItem(String label, String iconPath, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
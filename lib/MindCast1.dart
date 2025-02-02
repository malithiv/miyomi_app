import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MindCast1 extends StatelessWidget {
  const MindCast1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(0.48, -0.88),
              end: const Alignment(-0.48, 0.88),
              colors: [
                const Color(0xFFFB8500),
                Colors.white.withOpacity(0.7),
              ],
            ),
          ),
          child: Stack(
            children: [
              // Background gradient overlay
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/podcast_bg.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      const Color(0xFFFB8500).withOpacity(0.7),
                      BlendMode.overlay,
                    ),
                  ),
                ),
              ),

              // Main content
              Column(
                children: [
                  _buildHeader(),
                  _buildFeaturedSection(),
                  _buildEpisodesList(),
                ],
              ),

              // Bottom Navigation
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: _buildBottomNavBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/icons/back_arrow.png',
              width: 48,
              height: 45,
            ),
          ),
          const Expanded(
            child: Text(
              'Sort By',
              style: TextStyle(
                color: Color(0xFF023047),
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Image.asset(
            'assets/icons/sort.png',
            width: 24,
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 103,
            height: 106,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/images/mindcast.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Podcast by Dr.John',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Finding Joy in the Everyday',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/heart.png',
                      width: 19,
                      height: 14,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '2.9K',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Image.asset(
                      'assets/icons/comment.png',
                      width: 21,
                      height: 13,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '5.9K',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      const Text(
        'Summary of podcast',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(height: 8),
      const Text(
        "Finding Joy in the Everyday explores how embracing life's simple pleasures, practicing gratitude, and savoring small moments can lead to lasting happiness and fulfillment in daily life.",
      style: TextStyle(
      color: Colors.white,
        fontSize: 10,
        fontFamily: 'Urbanist',
        fontWeight: FontWeight.w500,
        height: 1.3,
      ),
    ),
    const SizedBox(height: 20),
    _buildPlayAllButton(),
    ],
    ),
    );
  }

  Widget _buildPlayAllButton() {
    return Container(
      width: 256,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Play All',
            style: TextStyle(
              color: Color(0xFFFB8500),
              fontSize: 16,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9).withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                'assets/icons/play.png',
                width: 27,
                height: 27,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEpisodesList() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          _buildEpisodeItem(
            'The Art of Mindfulness in Everyday Moments',
            'Episode 1 | 25:30',
            'assets/images/mindcast.jpg',
          ),
          const SizedBox(height: 20),
          _buildEpisodeItem(
            'The Art of Mindfulness in Everyday Moments',
            'Episode 2 | 25:30',
            'assets/images/mindcast.jpg',
          ),
          const SizedBox(height: 20),
          _buildEpisodeItem(
            'Nurturing Connections and Relationships',
            'Episode 3 | 53:30',
            'assets/images/mindcast.jpg',
          ),
          const SizedBox(height: 20),
          _buildEpisodeItem(
            'Finding Beauty in Daily Routines',
            'Episode 4 | 53:30',
            'assets/images/mindcast.jpg',
          ),
          const SizedBox(height: 60), // Space for bottom navigation
        ],
      ),
    );
  }

  Widget _buildEpisodeItem(String title, String subtitle, String imagePath) {
    return Row(
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF023047),
                  fontSize: 11,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 11,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 45,
          height: 45,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              'assets/icons/play_small.png',
              width: 37,
              height: 31,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 11),
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFF023047),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: const Color(0xFFFFB703), width: 1),
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
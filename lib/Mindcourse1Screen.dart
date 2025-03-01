import 'package:flutter/material.dart';
import 'package:miyomi/CustomBottomNavBar.dart';
import 'CustomBottomNavBar.dart'; // Import your existing CustomBottomNavBar

class Mindcourse1Screen extends StatelessWidget {
  const Mindcourse1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Stack(
                      children: [
                        // Background gradient
                        Container(
                          height: constraints.maxHeight,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.10, -1.00),
                              end: Alignment(-0.1, 1),
                              colors: [Colors.white, Color(0xFFBDE0FE)],
                            ),
                          ),
                        ),

                        // Content Column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Top app bar with blue background
                            _buildAppBar(context),

                            // Main content
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Header with back button
                                    _buildHeader(),

                                    // Course Image
                                    _buildCourseImage(context),

                                    // Course Title
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Breathing Exercises for Calmness',
                                      style: TextStyle(
                                        color: Color(0xFF023047),
                                        fontSize: 20,
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    // Course Description
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Discover simple breathing techniques to calm your mind and body.',
                                      style: TextStyle(
                                        color: Color(0xFF736B66),
                                        fontSize: 13,
                                        fontFamily: 'Urbanist',
                                      ),
                                    ),

                                    // Course stats (ratings and views)
                                    const SizedBox(height: 10),
                                    _buildCourseStats(),

                                    // More Lessons Section
                                    const SizedBox(height: 15),
                                    const Text(
                                      'More Lessons',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontFamily: 'Urbanist',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    // Lessons list
                                    const SizedBox(height: 15),
                                    _buildLessonItem(
                                      context,
                                      title: 'Introduction to Deep Breathing',
                                      duration: '(23:09)',
                                    ),

                                    const SizedBox(height: 15),
                                    _buildLessonItem(
                                      context,
                                      title: 'Box Breathing Technique',
                                      duration: '(10:20)',
                                    ),

                                    // Add some space at the bottom to avoid the nav bar overlapping content
                                    const SizedBox(height: 80),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Bottom Navigation Bar - positioned at the bottom
                        Positioned(
                          bottom: 20,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomBottomNavBar(
                              currentIndex: 1, onTap: (int ) {  }, // Assuming Library is selected based on the screenshot
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }

  // App bar with the user profile
  Widget _buildAppBar(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: const ShapeDecoration(
        color: Color(0xFF023047),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Row(
          children: [
            // User profile picture
            Container(
              width: 49,
              height: 49,
              decoration: const ShapeDecoration(
                shape: OvalBorder(),
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/49/49"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            // User name
            const Text(
              'Tharindu Nipun',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            // Notification button with badge
            Stack(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2B5266),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFB8500),
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2,
                        color: const Color(0xFF6F4A33),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '7',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Header with back button and title
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Image.network(
            "https://picsum.photos/48/45",
            width: 48,
            height: 45,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 20),
          const Text(
            'Owned Courses',
            style: TextStyle(
              color: Color(0xFF023047),
              fontSize: 20,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // Course main image
  Widget _buildCourseImage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40, // Full width minus padding
      height: MediaQuery.of(context).size.width * 0.6, // Aspect ratio approximately 3:2
      decoration: ShapeDecoration(
        image: const DecorationImage(
          image: NetworkImage("https://picsum.photos/322/218"),
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }

  // Course statistics (rating and views)
  Widget _buildCourseStats() {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        ),
        const SizedBox(width: 4),
        const Text(
          '4.5',
          style: TextStyle(
            color: Color(0xFF999999),
            fontSize: 14,
            fontFamily: 'Urbanist',
          ),
        ),
        const SizedBox(width: 15),
        const Icon(
          Icons.visibility_outlined,
          color: Color(0xFF999999),
          size: 20,
        ),
        const SizedBox(width: 4),
        const Text(
          '200K',
          style: TextStyle(
            color: Color(0xFF999999),
            fontSize: 14,
            fontFamily: 'Urbanist',
          ),
        ),
      ],
    );
  }

  // Individual lesson item
  Widget _buildLessonItem(BuildContext context, {required String title, required String duration}) {
    return Container(
      width: double.infinity,
      height: 62,
      decoration: ShapeDecoration(
        color: const Color(0x54FFB703),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            // Lesson thumbnail
            Container(
              width: 41,
              height: 22,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/41/22"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Lesson title and duration
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF023047),
                      fontSize: 14,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    duration,
                    style: const TextStyle(
                      color: Color(0xFF023047),
                      fontSize: 14,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // Start button
            Container(
              width: 68,
              height: 29,
              decoration: ShapeDecoration(
                color: const Color(0xFFFB8500),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Center(
                child: Text(
                  'START',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
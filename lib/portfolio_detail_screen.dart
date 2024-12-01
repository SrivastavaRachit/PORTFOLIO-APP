import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio_app/widgets/about_me_section.dart';
import 'package:portfolio_app/widgets/app_bar_widget.dart';
import 'package:portfolio_app/widgets/profile_info_section.dart';
import 'package:portfolio_app/widgets/recent_work_section.dart';
import 'package:portfolio_app/widgets/skills_section.dart';
import 'package:portfolio_app/widgets/tab_navigation_widget.dart';

class PortfolioDetailsScreen extends StatefulWidget {
  const PortfolioDetailsScreen({super.key});

  @override
  PortfolioDetailsScreenState createState() => PortfolioDetailsScreenState();
}

class PortfolioDetailsScreenState extends State<PortfolioDetailsScreen>
    with SingleTickerProviderStateMixin {
  int selectedTab = 0; // 0: Introduction, 1: Skills, 2: Recent Work
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      drawer: SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero)
                .animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
        ),
        child: _buildAcademicQualificationDrawer(),
      ),
      endDrawer: SlideTransition(
        position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
            .animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
        ),
        child: _buildAchievementDrawer(),
      ),
      body: Stack(
        children: [
          // Particle Background
          _buildParticleBackground(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top App Bar with integrated drawers
                Builder(
                  builder: (context) => AppBarWidget(
                    onOpenNotificationDrawer: () {
                      _controller.forward();
                      Scaffold.of(context).openDrawer();
                    },
                    onOpenAccountDrawer: () {
                      _controller.forward();
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                ),
                //Profile Info Section
                const ProfileInfoSection(),
                const SizedBox(height: 30),
                TabNavigationWidget(selectedTab: selectedTab,
                onTabChanged: (index){
                  setState(() {
                    selectedTab = index;
                  });
                },),

                const SizedBox(height: 20),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeOut,
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                                  begin: const Offset(0.0, 0.2), end: Offset.zero)
                              .animate(animation),
                          child: child,
                        ),
                      );
                    },
                    child: Padding(
                      key: ValueKey<int>(selectedTab),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: _buildContent(),
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

  Widget _buildContent() {
    if (selectedTab == 0) {
      return const AboutMeSection();
    } else if (selectedTab == 1) {
      return const SkillsSection();
    } else {
      return const RecentWorkSection();
    }
  }

  // Qualification Drawer
  Widget _buildAcademicQualificationDrawer() {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF141E30), Color(0xff2443b55)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Drawer Header
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 16.0,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0F2027),
                    Color(0xFF203A43),
                    Color(0xFF2C5364)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.school,
                    size: 40,
                    color: Colors.limeAccent,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Academic\nQualifiactions",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.limeAccent,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            //Academic Details
            Expanded(
                child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                _buildQualificationItem(
                  "10th Grade",
                  "ABC High School",
                  "2014",
                  "92.5%",
                ),
                _buildQualificationItem(
                  "12th Grade",
                  "XYZ Inter School",
                  "2016",
                  "95.5%",
                ),
                _buildQualificationItem(
                  "Engineering(CSE)",
                  "FED Institute of Technology",
                  "2020",
                  "82.5%",
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildQualificationItem(
    String title,
    String institution,
    String year,
    String percentage,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.limeAccent, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Instituion: $institution",
            style: const TextStyle(color: Colors.black),
          ),
          Text(
            year,
            style: const TextStyle(color: Colors.black),
          ),
          Text(
            percentage,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  //Build Achievement Drawer
  Widget _buildAchievementDrawer() {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1F1C2C), Color(0xFF928DAB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0F2027),
                    Color(0xFF203A43),
                    Color(0xFF2C5364)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.school, size: 40, color: Colors.limeAccent),
                  SizedBox(width: 16),
                  Text(
                    "Achievements &\nCertifications",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.limeAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildAchievementItem("Flutter Developer Certification",
                      "Issued by Google - June 2023"),
                  _buildAchievementItem("AWS Certified Solutions Architect",
                      "Issued by Amazon - December 2022"),
                  _buildAchievementItem(
                    "Hackathon Winner - TechFest 2023",
                    "Won 1st Place for AI-Powered project",
                  ),
                  _buildAchievementItem(
                    "Best Performer Award",
                    " Recognized for outstanding contributions in 2021",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementItem(String title, String description) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.limeAccent, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildParticleBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.deepPurple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: CustomPaint(
        painter: _ParticlePainter(),
        size: MediaQuery.of(context).size,
      ),
    );
  }
}

class _ParticlePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.2);
    final random = Random();
    for (int i = 0; i < 100; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 3;
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

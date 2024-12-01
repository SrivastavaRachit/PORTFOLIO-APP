import 'package:flutter/material.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0f2027),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Animated Header
            _buildHeader(),
            const SizedBox(height: 30),

            //Introduction Section
            _buildSectionTitle("Introduction"),
            const SizedBox(height: 10),

            _buildAnimatedCard(
              "Hello! I am Aman Sahu, a passionate App Developer and UI Designer with over 5 years of experience. I love crafting modern, user-friendly, and responsive applications that bring functionality and design together.",
            ),

            const SizedBox(height: 30),

            //Specialization
            _buildSectionTitle("What I Do"),
            const SizedBox(height: 10),
            _buildSpecializationRow(
              Icons.code,
              "Flutter Developer",
              "Building cross-platform apps with rich Functionality.",
            ),

            const SizedBox(height: 15),
            _buildSpecializationRow(
              Icons.design_services,
              "UI-UX Design",
              "Designing visually appealing anf intutive interfaces.",
            ),
            const SizedBox(height: 30),

            //Key Highlights Section
            _buildSectionTitle("Key Highlights"),
            const SizedBox(height: 10),
            _buildHighlightCard([
              "Expert in Flutter & Dart.",
              "Proficient in Firebase & backend integration.",
              "Experienced in deploying apps to App Store & Play Store.",
              "Strong debugging and problem-solving skills.",
            ]),
            const SizedBox(height: 30),

            //Skill Section
            _buildSectionTitle("Skill & Tools"),
            const SizedBox(height: 10),
            _buildSkillChips([
              "Flutter",
              "Dart",
              "Firebase",
              "UI-UX Design",
              "REST APIs",
              "GIT",
              "Figma",
              "Python",
            ]),
            const SizedBox(height: 30),
            _buildSectionTitle("What People Say"),
            const SizedBox(height: 10),
            _buildTestimonialCard(
              "Aman is an incredibly talented developer. His attention to detail and commitment to excellence make him a pleasure to work with!",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 1),
      curve: Curves.easeOut,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, -50 * (1 - value)),
            child: const Text(
              "About Me",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.limeAccent,
                shadows: [
                  Shadow(
                    blurRadius: 8.0,
                    color: Colors.black26,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  //Section Title
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.greenAccent,
      ),
    );
  }

  //Introduction Card
  Widget _buildAnimatedCard(String text) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8.0,
            color: Colors.black26,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white70,
          height: 1.5,
        ),
      ),
    );
  }

  //Specialization Row
  Widget _buildSpecializationRow(
      IconData icon, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.greenAccent.withOpacity(0.1),
          child: Icon(icon, size: 28, color: Colors.greenAccent),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  //Highlight Card
  Widget _buildHighlightCard(List<String> highlights) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8.0,
            color: Colors.black26,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: highlights
            .map(
              (highlight) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        highlight,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  // Skill Section
  Widget _buildSkillChips(List<String> skills) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: skills.map((skill) {
        return Chip(
          label: Text(skill),
          backgroundColor: Colors.greenAccent.withOpacity(0.2),
          labelStyle: const TextStyle(color: Colors.black),
          elevation: 2,
          shadowColor: Colors.black26,
        );
      }).toList(),
    );
  }

  //Testimonial Card
  Widget _buildTestimonialCard(String testimonial) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8.0,
            color: Colors.black26,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Text(
        testimonial,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white70,
          fontStyle: FontStyle.italic,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0f2027),
            Color(0xFF203a43),
            Color(0xFF2c5364),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Skills",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            //Add individual skill items
            _buildSkillItem('Flutter Development', 0.95, 0),
            _buildSkillItem('Dart Programming', 0.9, 1),
            _buildSkillItem('State Management(Provider, Riverpod, Bloc)', 0.85, 2),
            _buildSkillItem('Rest API Integration', 0.9, 3),
            _buildSkillItem('GraphQl APIs', 0.7, 4),
            _buildSkillItem('Firebase (Auth, Firestore, Storage)', 0.85, 5),
            _buildSkillItem('UI/UX Design', 0.8, 6),
            _buildSkillItem('Responsive Design', 0.9, 7),
            _buildSkillItem('Backend Development (Node.js)', 0.75, 8),
            _buildSkillItem('Database Management (MongoDB, MySQL)', 0.5, 9),
            _buildSkillItem('Authentication (OAuth, JWT)', 0.85, 10),
            _buildSkillItem('Version Control (Git, GitHub)', 0.6, 11),
            _buildSkillItem('Third-party Library Integration', 0.8, 12),
            _buildSkillItem('Unit and Integration Testing', 0.3, 13),
            _buildSkillItem('DevOps and Deployment (CI/CD, Docker)', 0.6, 14),
            _buildSkillItem('Agile Development Methodologies', 0.8, 15),
            _buildSkillItem('Cloud Services (AWS, Google Cloud)', 0.65, 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillItem(String skill, double proficiency, int index) {
    return AnimatedSlide(
      offset: const Offset(0, -0.2),
      duration: Duration(milliseconds: 300 + (index * 100)),
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(milliseconds: 300 + (index * 100)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: proficiency),
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: CircularProgressIndicator(
                          value: value,
                          strokeWidth: 8,
                          backgroundColor: Colors.grey[800],
                          valueColor: AlwaysStoppedAnimation(
                            _getProgressColor(value),
                          ),
                        ),
                      ),
                      Text(
                        '${(value * 100).toInt()}%',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(width: 20),
              //skill name and progress bar
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skill,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: proficiency,
                      child: Container(
                        decoration: BoxDecoration(
                          color: _getProgressColor(proficiency),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  // Function to determine progress color based on proficiency
  Color _getProgressColor(double proficiency) {
    if (proficiency >= 0.8) {
      return Colors.greenAccent;
    } else if (proficiency >= 0.6)
      return Colors.amber;
    else
      return Colors.redAccent;
  }
}

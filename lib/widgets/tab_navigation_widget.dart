import 'package:flutter/material.dart';

class TabNavigationWidget extends StatelessWidget {
  final int selectedTab;
  final Function(int) onTabChanged;

  const TabNavigationWidget({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTab('Introduction', 0),
          _buildTab('Skills', 1),
          _buildTab('Recent Work', 2),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    bool isActive = selectedTab == index;
    return GestureDetector(
      onTap: () {
        onTabChanged(index);
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: isActive ? Colors.white : Colors.tealAccent,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isActive) const SizedBox(height: 5),
          if (isActive)
            Container(
              width: 50,
              height: 2,
              color: Colors.yellow,
            ),
        ],
      ),
    );
  }
}

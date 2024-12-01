import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final VoidCallback onOpenNotificationDrawer;
  final VoidCallback onOpenAccountDrawer;

  const AppBarWidget({
    super.key,
    required this.onOpenAccountDrawer,
    required this.onOpenNotificationDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Notification Drawer Icon
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: onOpenNotificationDrawer,
          ),
          // Account Drawer Icon
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: onOpenAccountDrawer,
          ),
        ],
      ),
    );
  }
}

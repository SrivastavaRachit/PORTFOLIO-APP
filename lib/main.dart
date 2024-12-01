import 'package:flutter/material.dart';
import 'package:portfolio_app/portfolio_screen.dart';


void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PortfolioScreen(),
    );
  }
}

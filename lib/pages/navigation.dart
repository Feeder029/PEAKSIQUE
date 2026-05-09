import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:peaksique/pages/test.dart';
import 'package:peaksique/pages/home2.dart';

import 'home.dart'; // replace with your actual page imports

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _bottomNavIndex = 0;

  final List<IconData> _iconList = [
    Icons.home_rounded,
    Icons.bar_chart_rounded,
    Icons.calendar_today_rounded,
    Icons.person_rounded,
  ];

  // Add your page widgets here in the same order as _iconList
  final List<Widget> _pages = [
    const Home(),
    const HomePage(), // replace: Stats page
    const MyApp(), // replace: Calendar page
    const Placeholder(), // replace: Profile page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_bottomNavIndex],

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to start workout / new session
        },
        backgroundColor: Colors.pinkAccent,
        shape: const CircleBorder(),
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: _iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        
        backgroundColor: const Color(0xFF1a1a1a),
        activeColor: Colors.pinkAccent,
        inactiveColor: Colors.white38,
        iconSize: 24,
        gapWidth: 60,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}
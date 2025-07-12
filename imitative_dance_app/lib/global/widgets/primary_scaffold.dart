import 'package:flutter/material.dart';
import 'package:imitative_dance_app/screens/home/home_screen.dart';
import 'package:imitative_dance_app/screens/performances/performances.dart';
import 'package:imitative_dance_app/screens/settings/settings.dart';

class PrimaryScaffold extends StatefulWidget {
  /// Primary scaffold with bottom nav bar
  const PrimaryScaffold({super.key});

  @override
  State<PrimaryScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<PrimaryScaffold> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [HomeScreen(), Performances(), Settings()][_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          height: 60,
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedIndex: _currentIndex,
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.donut_large),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.camera_enhance_rounded),
              icon: Icon(Icons.camera_enhance_outlined),
              label: 'Analyse',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.settings_rounded),
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

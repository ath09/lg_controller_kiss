import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lg_kiss_controller/pages/about_screen.dart';
import 'package:lg_kiss_controller/pages/home_screen.dart';
import 'package:lg_kiss_controller/pages/settings_page.dart';

class CurveBar extends StatefulWidget {
  const CurveBar({super.key});

  @override
  State<CurveBar> createState() => _CurveBarState();
}

class _CurveBarState extends State<CurveBar> {
  int index = 1;
  final screen =  [
    SettingsPage(),
    HomeScreen(),
    AboutPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final items = const [
      Icon(
        Icons.settings,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.home,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.info,
        size: 30,
        color: Colors.white,
      )
    ];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 185, 255),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.blue,
        height: 50,
        color: Colors.purple,
        index: index,
        onTap: (index) => setState(
          () => this.index = index,
        ),
      ),
      body:screen[index],
    );
  }
}

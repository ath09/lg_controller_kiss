import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lg_kiss_controller/pages/curve_navbar.dart';
import 'package:lg_kiss_controller/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const CurveBar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 243, 185, 255),
      child: Center(
        child: Column(
          children: [
                Image.asset(
                  'assets/Frame 1 (2).gif',
                  height: 550,
                  width: 600,
                ),
            Row(
              children: const [
                SizedBox(
                  width: 175,
                ),
                Text(
                  'Basic controller using Flutter',
                  style: TextStyle(
                      fontFamily: 'Rubik', color: Colors.purple, fontSize: 60,decoration: TextDecoration.none),
                ),
              ],
            ),
            Row(
              children: const [
                SizedBox(
                  width: 370,
                ),
                Text(
                  '-By Atharva Kumtakar',
                  style: TextStyle(
                      color: Colors.purple, fontFamily: 'Rubik', fontSize: 45,decoration: TextDecoration.none),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

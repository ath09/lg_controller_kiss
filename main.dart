import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lg_kiss_controller/pages/settings_page.dart';
import 'package:lg_kiss_controller/pages/splash_screen.dart';
import 'package:lg_kiss_controller/pages/about_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    // Lock orientation to landscape
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(), // Root route
        '/settings': (context) => const SettingsPage(), // Settings route
      },
    );
  }
}

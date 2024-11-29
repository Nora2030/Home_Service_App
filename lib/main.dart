import 'package:final_project/my_home.dart';
import 'package:flutter/material.dart';
import 'package:final_project/features/auth/screens/splash_screen.dart'; // Import the splash screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const SplashScreen(), // Set SplashScreen as the initial route
    );
  }
}

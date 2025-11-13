import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/firebase_options.dart';
import 'package:tasky_app/screens/auth/view/login_screen.dart';
import 'package:tasky_app/screens/auth/view/register_screen.dart';
import 'package:tasky_app/screens/home/home_screen.dart';
import 'package:tasky_app/screens/onboarding_screen.dart';
import 'package:tasky_app/screens/splash_screen.dart';

void main() async {
  runApp(TaskyApp());
}

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}

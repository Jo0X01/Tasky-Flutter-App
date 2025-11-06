import 'package:flutter/material.dart';
import 'package:tasky_app/auth/view/login_screen.dart';
import 'package:tasky_app/auth/view/register_screen.dart';

void main() {
  runApp(TaskyApp());
}

class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen()
      },
    );
  }
}

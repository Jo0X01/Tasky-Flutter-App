import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/core/constant/assets_constant.dart';
import 'package:tasky_app/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5F33E1),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInLeft(
              duration: Duration(milliseconds: 900),
              child: Image.asset(AssetsConstant.taskIcon)
            ),
            BounceInDown(
              from: 50,
              delay: Duration(milliseconds: 900),
              duration: Duration(milliseconds: 600),
              child: Image.asset(AssetsConstant.yIcon)),
          ],
        ),
      ),
    );
  }
}

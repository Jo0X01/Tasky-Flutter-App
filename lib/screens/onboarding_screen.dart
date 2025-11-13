import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tasky_app/screens/auth/view/login_screen.dart';
import 'package:tasky_app/screens/auth/widgets/custom_animatation_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const String routeName = "OnboardingScreen";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var onboardData = generateOnboardData();
  int targetIndex = 0;
  int delay = 200;
  PageController builderController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 143),
            SizedBox(
              height: 240,
              child: PageView.builder(
                itemCount: onboardData.length,
                controller: builderController,
                onPageChanged: (value) => setState(() => targetIndex = value),
                itemBuilder: (context, index) {
                  return CustomAnimationWidget(
                    index: targetIndex,
                    delay: (targetIndex +1) * delay,
                    child: Image.asset(
                      onboardData[index].imagePath
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 29),
            CustomAnimationWidget(
              index: targetIndex,
              delay: (targetIndex +1) * delay,
              child: SmoothPageIndicator(
                controller: builderController,
                count: onboardData.length,
                effect: SlideEffect(
                  spacing: 8,
                  dotHeight: 4,
                  dotWidth: 26,
                  dotColor: Color(0xFFAFAFAF),
                  activeDotColor: Color(0xDE5F33E1),
                ),
              ),
            ),
            SizedBox(height: 50),
            CustomAnimationWidget(
              index: targetIndex,
              delay: (targetIndex +1) * delay,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                child: Column(
                  spacing: 42,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      onboardData[targetIndex].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xDE24252C),
                      ),
                    ),
                    Text(
                      onboardData[targetIndex].desc,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xDE6E6A7C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomAnimationWidget(
        delay: (targetIndex +1) * delay,
        index: targetIndex,
        child: MaterialButton(
          disabledColor: Colors.transparent,
          onPressed: () {
            if (targetIndex < onboardData.length - 1) {
              builderController.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
              targetIndex += 1;
            } else {
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            }
            setState(() {});
          },
          height: 48,
          color: Color(0xff5F33E1),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          child: Text(
            targetIndex == onboardData.length - 1 ? "GET STARTED" : "NEXT",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xffffffff),
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingDataclass {
  OnboardingDataclass({
    required this.title,
    required this.imagePath,
    required this.desc,
  });

  final String title;
  final String imagePath;
  final String desc;
}

List<OnboardingDataclass> generateOnboardData() {
  return [
    OnboardingDataclass(
      title: "Manage your tasks",
      desc: "You can easily manage all of your daily tasks in DoMe for free",
      imagePath: "assets/images/splash_1.png",
    ),
    OnboardingDataclass(
      title: "Create daily routine",
      desc:
          "In Tasky  you can create your personalized routine to stay productive",
      imagePath: "assets/images/splash_2.png",
    ),
    OnboardingDataclass(
      title: "Orgonaize your tasks",
      desc:
          "You can organize your daily tasks by adding your tasks into separate categories",
      imagePath: "assets/images/splash_3.png",
    ),
  ];
}

import 'package:TSWEarn/app/Bottom_navigation/home.dart';
import 'package:flutter/material.dart';
import 'package:TSWEarn/app/screens/auth_screen/get_started_screen.dart';
import 'package:TSWEarn/app/screens/splash_screen/splash1.dart';
import 'package:TSWEarn/app/screens/splash_screen/splash2.dart';
import 'package:TSWEarn/app/screens/splash_screen/splash3.dart';
import 'package:TSWEarn/app/screens/splash_screen/splash4.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController controller = PageController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: <Widget>[
          Splash1Screen(
            gotToSplash2: () {
              controller.animateToPage(
                1,
                duration: Duration(milliseconds: 200),
                curve: Curves.easeIn,
              );
            },
            gotGetSartedScreen: () {
              controller.animateToPage(
                4,
                duration: Duration(milliseconds: 70),
                curve: Curves.easeInOut,
              );
            },
          ),
          Splash2Screen(
            gotToSplash3: () {
              controller.animateToPage(
                2,
                duration: Duration(milliseconds: 200),
                curve: Curves.easeIn,
              );
            },
            gotGetSartedScreen: () {
              controller.animateToPage(
                4,
                duration: Duration(milliseconds: 70),
                curve: Curves.easeInOut,
              );
            },
          ),
          Splash3Screen(
            gotToSplash4: () {
              controller.animateToPage(
                3,
                duration: Duration(milliseconds: 200),
                curve: Curves.easeIn,
              );
            },
            gotGetSartedScreen: () {
              controller.animateToPage(
                4,
                duration: Duration(milliseconds: 70),
                curve: Curves.easeInOut,
              );
            },
          ),
          Splash4Screen(
            gotToGetStartedScreen: () {
              controller.animateToPage(
                4,
                duration: Duration(milliseconds: 200),
                curve: Curves.easeIn,
              );
            },
          ),
          GetStartedScreen()
        ],
      ),
    );
  }
}

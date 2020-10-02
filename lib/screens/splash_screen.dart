import 'dart:async';

import 'package:flutter/material.dart';
import 'package:payso/screens/intro_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    if (isUserOldSF()) {}
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => IntroSlider()),
        );
      },
    );
  }

  isUserOldSF() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool isUserOld = _prefs.getBool('isUserOld');
    if (isUserOld) {
      //TODO: Implement Shared Preferences
    }
    return isUserOld;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/app_logo.png',
          width: width.roundToDouble() - width.roundToDouble() / 4,
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:payso/model/shared_preference_operations.dart';

import 'package:payso/screens/dashboard_screen.dart';
import 'package:payso/screens/intro_slider.dart';
import 'package:payso/screens/login_passcode_screen.dart';
import 'package:payso/screens/select_language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferenceOperations _prefs = SharedPreferenceOperations();

  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 3),
      () async {
        if (await _prefs.isUserOldSF() == true) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPasscodeScreen()),
          );
        } else if (await _prefs.isUserOldSF() == false) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SelectLanguage()),
          );
        }
      },
    );
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

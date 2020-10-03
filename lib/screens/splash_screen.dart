import 'dart:async';

import 'package:flutter/material.dart';
import 'package:payso/model/shared_preference_operations.dart';
import 'package:payso/screens/confirm_mobile_passcode.dart';
import 'package:payso/screens/intro_slider.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferenceOperations _pref = SharedPreferenceOperations();

  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 3),
      () {
        if (_pref.isUserOldSF()) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ConfirmMobilePasscode()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => IntroSlider()),
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

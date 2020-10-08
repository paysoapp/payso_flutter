import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:payso/model/secure.dart';
import 'package:payso/model/shared_preference_operations.dart';
import 'package:payso/screens/permission_screen.dart';
import 'package:payso/screens/secure_screen.dart';
import 'package:payso/screens/select_language.dart';

import 'intro_slider.dart';
import 'register_screen.dart';

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
          Secure _localAuth = Secure();
          List<BiometricType> availableBiometrics =
              await _localAuth.getAvailableBiometrics();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SecureScreen(
                availableBiometrics: availableBiometrics,
              ),
            ),
          );
        } else if (await _prefs.getSeen('Language') == false) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SelectLanguage()),
          );
        } else if (await _prefs.getSeen('Permissions') == false) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => PermissionScreen()),
          );
        } else if (await _prefs.getSeen('Intro') == false) {
          print("Language ${await _prefs.getSeen('Intro')}");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => IntroSlider()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => RegisterScreen()),
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

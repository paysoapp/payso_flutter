import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:payso/screens/complete_profile.dart';
import 'package:payso/screens/confirm_mobile_passcode.dart';
import 'package:payso/screens/intro_slider.dart';
import 'package:payso/screens/mobile_verified_screen.dart';
import 'package:payso/screens/passcode_verified_screen.dart';
import 'package:payso/screens/register_screen.dart';
import 'package:payso/screens/set_mobile_passcode.dart';
import 'package:payso/screens/splash_screen.dart';
import 'package:payso/screens/verify_number.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      _error = true;
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PaySo App',
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        IntroSlider.id: (context) => IntroSlider(),
        RegisterScreen.id: (context) => RegisterScreen(),
        VerifyNumber.id: (context) => VerifyNumber(),
        CompleteProfile.id: (context) => CompleteProfile(),
        MobileVerifiedScreen.id: (context) => MobileVerifiedScreen(),
        SetMobilePasscode.id: (context) => SetMobilePasscode(),
        ConfirmMobilePasscode.id: (context) => ConfirmMobilePasscode(),
        PasscodeVerifiedScreen.id: (context) => PasscodeVerifiedScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:payso/screens/complete_profile.dart';
import 'package:payso/screens/intro_slider.dart';
import 'package:payso/screens/register_screen.dart';
import 'package:payso/screens/splash_screen.dart';
import 'package:payso/screens/verify_number.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      },
    );
  }
}

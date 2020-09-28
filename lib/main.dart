import 'package:flutter/material.dart';
import 'package:payso/screens/intro_slider.dart';
import 'package:payso/screens/splash_screen.dart';

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
      },
    );
  }
}

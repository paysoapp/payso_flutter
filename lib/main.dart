import 'package:flutter/material.dart';

import 'screens/intro_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PaySo App',
      home: IntroSlider(),
    );
  }
}

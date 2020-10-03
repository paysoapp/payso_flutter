import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/shared_preference_operations.dart';
import 'intro_slider.dart';

class DashboardScreen extends StatelessWidget {
  SharedPreferenceOperations _prefs = SharedPreferenceOperations();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('This is dashboard'),
            FlatButton(
              child: Text('Logout'),
              color: cPrimaryColor,
              onPressed: () async {
                await _prefs.logout();
                Navigator.pushNamed(context, IntroSlider.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:payso/screens/register_screen.dart';

import '../constants.dart';
import '../model/shared_preference_operations.dart';

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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

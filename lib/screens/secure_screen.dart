import 'dart:io';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:payso/model/secure.dart';
import 'package:payso/screens/dashboard_screen.dart';
import 'package:payso/widgets/secure_screen_tile.dart';

import '../constants.dart';

class SecureScreen extends StatefulWidget {
  static String id = 'secure_screen';
  final List<BiometricType> availableBiometrics;

  SecureScreen({this.availableBiometrics});

  @override
  _SecureScreenState createState() => _SecureScreenState();
}

class _SecureScreenState extends State<SecureScreen> {
  bool isAuthenticated = false;
  Secure _localAuth = Secure();
  List<BiometricType> availableBiometrics;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    availableBiometrics = widget.availableBiometrics;
    navigateToNext() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(),
        ),
      );
    }

    List<SecureScreenTile> iOSList = [
      SecureScreenTile(
        imagePath: availableBiometrics.contains(BiometricType.fingerprint)
            ? './assets/images/fingerprint.png'
            : './assets/images/face-unlock.png',
        onTap: () async {
          isAuthenticated = await _localAuth.authenticate();
          if (isAuthenticated) {
            navigateToNext();
          }
        },
      ),
    ];

    List<SecureScreenTile> androidList = [
      SecureScreenTile(
        imagePath: './assets/images/fingerprint.png',
        onTap: () async {
          isAuthenticated = await _localAuth.authenticate();
          if (isAuthenticated) {
            navigateToNext();
          }
        },
      ),
    ];

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15.0),
        color: cIntroSliderBg,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Image.asset(
                './assets/images/app_logo.png',
                width: MediaQuery.of(context).size.width / 1.6,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 5.5,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Secure your Payso',
                    style: cHeadStyle,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra sollicitudin commodo. ",
                    style: cTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: Platform.isAndroid ? androidList : iOSList,
              ),
            ),
            InkWell(
              onTap: () async {
                Secure _localAuth = Secure();
                isAuthenticated = await _localAuth.authenticate();
                if (isAuthenticated) {
                  navigateToNext();
                }
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: cPrimaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(14),
                  ),
                ),
                width: MediaQuery.of(context).size.width - 80,
                alignment: Alignment.center,
                child: Text(
                  "Enable Safety",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

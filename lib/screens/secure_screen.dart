import 'dart:io';

import 'package:flutter/material.dart';
import 'package:payso/model/secure.dart';
import 'package:payso/widgets/secure_screen_tile.dart';

import '../constants.dart';

class SecureScreen extends StatelessWidget {
  static String id = 'secure_screen';

  List<SecureScreenTile> iOSList = [
    SecureScreenTile(
      imagePath: './assets/images/fingerprint.png',
      onTap: null,
    ),
    SecureScreenTile(
      imagePath: './assets/images/fingerprint.png',
      onTap: null,
    ),
  ];

  List<SecureScreenTile> androidList = [
    SecureScreenTile(
      imagePath: './assets/images/fingerprint.png',
      onTap: () async {
        Secure _localAuth = Secure();
        _localAuth.authenticate();
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
              onTap: null,
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

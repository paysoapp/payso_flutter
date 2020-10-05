import 'dart:async';

import 'package:flutter/material.dart';
import 'package:payso/model/shared_preference_operations.dart';
import 'package:payso/screens/dashboard_screen.dart';
import 'package:payso/widgets/verified_screen_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class PasscodeVerifiedScreen extends StatefulWidget {
  static const String id = 'passcode_verified_screen';
  @override
  _PasscodeVerifiedScreenState createState() => _PasscodeVerifiedScreenState();
}

class _PasscodeVerifiedScreenState extends State<PasscodeVerifiedScreen> {
  SharedPreferenceOperations _pref = SharedPreferenceOperations();

  @override
  void initState() {
    super.initState();
    _pref.setOldUser();
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: VerifiedScreenWidget(
        desc: 'passcodeVerifedDesc'.tr(),
      ),
    );
  }
}

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:payso/model/secure.dart';
import 'package:payso/model/shared_preference_operations.dart';
import 'package:payso/screens/secure_screen.dart';
import 'package:payso/widgets/verified_screen_widget.dart';

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
      () async {
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

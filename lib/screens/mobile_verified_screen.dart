import 'dart:async';

import 'package:flutter/material.dart';
import 'package:payso/screens/complete_profile.dart';
import 'package:payso/widgets/verified_screen_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class MobileVerifiedScreen extends StatefulWidget {
  static const String id = 'verified_screen';
  @override
  _MobileVerifiedScreenState createState() => _MobileVerifiedScreenState();
}

class _MobileVerifiedScreenState extends State<MobileVerifiedScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CompleteProfile()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: VerifiedScreenWidget(
        desc: 'mobileVerifiedDesc'.tr(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:payso/widgets/verified_screen_widget.dart';

class PasscodeVerifiedScreen extends StatefulWidget {
  static const String id = 'passcode_verified_screen';
  @override
  _PasscodeVerifiedScreenState createState() => _PasscodeVerifiedScreenState();
}

class _PasscodeVerifiedScreenState extends State<PasscodeVerifiedScreen> {
  @override
  void initState() {
    super.initState();
    //TODO: set the route to next screen
    // Timer(
    // Duration(seconds: 2),
    // () {
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => ),
    // );
    // },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: VerifiedScreenWidget(
        desc: 'Your passcode has been set successfully',
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PasscodeWidget extends StatelessWidget {
  const PasscodeWidget({
    this.title,
    this.desc,
  });
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            'assets/images/passcode.png',
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              desc,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.grey,
                letterSpacing: 1.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Digits Only',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.grey,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

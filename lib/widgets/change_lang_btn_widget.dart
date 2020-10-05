import 'package:flutter/material.dart';
import 'package:payso/screens/select_language.dart';

import '../constants.dart';

class ChangeLangButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SelectLanguage()));
          },
          child: Row(
            children: [
              Icon(
                Icons.arrow_back,
                color: cPrimaryColor,
              ),
              Text(
                'Change Language',
                style: TextStyle(
                  color: cPrimaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

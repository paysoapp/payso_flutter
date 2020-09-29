import 'package:flutter/material.dart';
import 'package:payso/constants.dart';

class SlideTile extends StatelessWidget {
  final String imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath),
          SizedBox(
            height: 40,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: cHeadStyle,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: cTextStyle,
          )
        ],
      ),
    );
  }
}

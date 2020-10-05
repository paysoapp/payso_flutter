import 'package:flutter/material.dart';

class SecureScreenTile extends StatelessWidget {
  final String imagePath;
  final Function onTap;

  SecureScreenTile({this.imagePath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
          boxShadow: [
            new BoxShadow(
              color: Color(0x1f010101),
              blurRadius: 20.0,
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width / 2.6,
        child: Image.asset(imagePath),
      ),
    );
  }
}

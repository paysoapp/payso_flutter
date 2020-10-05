import 'package:flutter/material.dart';
import 'package:payso/constants.dart';
import 'package:payso/model/ask_permission.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionItem extends StatefulWidget {
  final String permissionText;
  final Permission permission;
  PermissionItem({this.permissionText, this.permission});

  @override
  _PermissionItemState createState() => _PermissionItemState();
}

class _PermissionItemState extends State<PermissionItem> {
  AskPermission _askPermission = AskPermission();
  bool permitted = false;
  updateUI() async {
    permitted = await _askPermission.askPermission(widget.permission);
    if (permitted) {
      setState(() {
        permitted = true;
      });
    } else {
      setState(() {
        permitted = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    updateUI();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              widget.permissionText,
              textAlign: TextAlign.left,
              style: cTextStyle,
            ),
          ),
          Container(
            padding: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: permitted ? Colors.green : Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: permitted
                ? Icon(
                    Icons.done,
                    size: 20.0,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.clear,
                    size: 20.0,
                    color: Colors.white,
                  ),
          ),
        ],
      ),
    );
  }
}

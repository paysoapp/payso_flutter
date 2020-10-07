import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payso/constants.dart';
import 'package:payso/model/ask_permission.dart';
import 'package:payso/widgets/permission_item.dart';
import 'package:permission_handler/permission_handler.dart';

import '../model/shared_preference_operations.dart';

class PermissionScreen extends StatelessWidget {
  static String id = 'permission_screen';
  AskPermission _askPermission = AskPermission();

  List<PermissionItem> permissionItems = [
    PermissionItem(
      permissionText: 'Provide Contact Access to check who uses Payso ',
      permission: Permission.contacts,
    ),
    PermissionItem(
      permissionText: 'Allow Camera Access to scan QR codes by Camera',
      permission: Permission.camera,
    ),
    PermissionItem(
      permissionText: 'Provide Location Access get permissions',
      permission: Permission.location,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 10),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('./assets/images/register.png'),
              ),
              Text(
                'Give Permissions',
                style: cHeadStyle,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: permissionItems,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      SharedPreferenceOperations _prefs =
                          SharedPreferenceOperations();
                      _prefs.hasSeen('Permissions');
                      await _askPermission.askForPermissions();
                      await _askPermission.isAllPermissionAllowed(context);
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                        color: cPrimaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Allow",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

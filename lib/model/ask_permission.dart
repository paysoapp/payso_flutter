import 'package:flutter/material.dart';
import 'package:payso/screens/intro_slider.dart';
import 'package:permission_handler/permission_handler.dart';

class AskPermission {
  askForPermissions() async {
    Map<Permission, PermissionStatus> permissions = await [
      Permission.location,
      Permission.notification,
      Permission.camera,
      Permission.contacts,
    ].request();
  }

  askPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    }
    return false;
  }

  isAllPermissionAllowed(BuildContext context) async {
    List<Permission> _allPermissions = [
      Permission.location,
      Permission.camera,
      Permission.contacts,
    ];
    await askForPermissions();
    _allPermissions.forEach((permission) async {
      if (await permission.isDenied || await permission.isRestricted) {
        await isAllPermissionAllowed(context);
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => IntroSlider(),
          ),
        );
      }
    });
  }

  checkPermission(Permission permission) async {
    if (await permission.request().isGranted) {
      return true;
    }
    return false;
  }
}

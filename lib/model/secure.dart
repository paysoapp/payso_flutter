import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Secure {
  Future<bool> canCheckBiometrics() async {
    LocalAuthentication localAuth = LocalAuthentication();
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await localAuth.canCheckBiometrics;
      print(canCheckBiometrics);
      return canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    print(canCheckBiometrics);
    return false;
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    LocalAuthentication localAuth = LocalAuthentication();

    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await localAuth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    return availableBiometrics;
  }

  Future<bool> authenticate() async {
    LocalAuthentication _localAuth = LocalAuthentication();

    bool _authenticated = false;

    try {
      _authenticated = await _localAuth.authenticateWithBiometrics(
        localizedReason: 'Scan your finger to authenticate',
        useErrorDialogs: true,
        stickyAuth: true,
      );
      print(_authenticated);
      return _authenticated;
    } on PlatformException catch (e) {
      print(e);
    }
    print(_authenticated);
    return _authenticated;
  }
}

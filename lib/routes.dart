import 'package:flutter/material.dart';
import 'package:payso/screens/complete_profile.dart';
import 'package:payso/screens/confirm_mobile_passcode.dart';
import 'package:payso/screens/intro_slider.dart';
import 'package:payso/screens/login_passcode_screen.dart';
import 'package:payso/screens/mobile_verified_screen.dart';
import 'package:payso/screens/passcode_verified_screen.dart';
import 'package:payso/screens/permission_screen.dart';
import 'package:payso/screens/register_screen.dart';
import 'package:payso/screens/secure_screen.dart';
import 'package:payso/screens/select_language.dart';
import 'package:payso/screens/set_mobile_passcode.dart';
import 'package:payso/screens/splash_screen.dart';
import 'package:payso/screens/verify_number.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.id: (context) => SplashScreen(),
  SelectLanguage.id: (context) => SelectLanguage(),
  IntroSlider.id: (context) => IntroSlider(),
  RegisterScreen.id: (context) => RegisterScreen(),
  VerifyNumber.id: (context) => VerifyNumber(),
  CompleteProfile.id: (context) => CompleteProfile(),
  MobileVerifiedScreen.id: (context) => MobileVerifiedScreen(),
  SetMobilePasscode.id: (context) => SetMobilePasscode(),
  ConfirmMobilePasscode.id: (context) => ConfirmMobilePasscode(),
  LoginPasscodeScreen.id: (context) => LoginPasscodeScreen(),
  PasscodeVerifiedScreen.id: (context) => PasscodeVerifiedScreen(),
  PermissionScreen.id: (context) => PermissionScreen(),
  SecureScreen.id: (context) => SecureScreen(),
};

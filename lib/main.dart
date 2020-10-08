import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
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
import 'package:payso/services/firebase_operations.dart';

void main() {
  runApp(
    EasyLocalization(
      saveLocale: true,
      supportedLocales: [Locale('en', 'US'), Locale('fil', 'PH')],
      path: 'assets/languages',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'PaySo App',
      initialRoute: SplashScreen.id,
      routes: {
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
        FirebaseOperations.id: (context) => FirebaseOperations(),
      },
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:payso/screens/verify_number.dart';

class RegisterUser {
  UserCredential user;

  Future registerUser(
      String mobile, BuildContext context, FirebaseAuth _auth) async {
    String phoneNumber = '+91' + mobile;
    _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(seconds: 0),
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (FirebaseAuthException authException) {
        print(authException.message);
      },
      codeSent: (String verificationId, [int forceResendingToken]) async {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => VerifyNumber(
            mobileNumber: phoneNumber,
            verificationId: verificationId,
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationId = verificationId;
        print(verificationId);
        print("Timeout");
      },
    );
  }
}

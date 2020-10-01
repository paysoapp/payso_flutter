import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:payso/screens/complete_profile.dart';

class RegisterUser {
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential user;
  String otp;

  Future registerUser(String mobile, BuildContext context, FirebaseAuth _auth,
      String otp) async {
    _auth.verifyPhoneNumber(
      phoneNumber: "+91" + mobile,
      timeout: Duration(seconds: 120),
      verificationCompleted: (AuthCredential authCredential) async {
        this.user = await _auth.signInWithCredential(authCredential);
        Navigator.pushNamed(context, CompleteProfile.id);
      },
      verificationFailed: (FirebaseAuthException authException) {
        print(authException.message);
      },
      codeSent: (String verificationId, [int forceResendingToken]) async {
        AuthCredential _credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: otp);
        UserCredential result = await _auth.signInWithCredential(_credential);
        FirebaseUser user = result.user;
        return user;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationId = verificationId;
        print(verificationId);
        print("Timeout");
      },
    );
  }
}

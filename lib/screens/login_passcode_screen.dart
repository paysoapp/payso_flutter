import 'package:flutter/material.dart';
import 'package:payso/constants.dart';
import 'package:payso/model/shared_preference_operations.dart';
import 'package:payso/screens/dashboard_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginPasscodeScreen extends StatelessWidget {
  static const String id = 'login_passcode_screen';
  int passcode = 0, savedPasscode = 0;
  final _formKey = GlobalKey<FormState>();
  SharedPreferenceOperations _prefs = SharedPreferenceOperations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 80.0,
                ),
                Image.asset(
                  'assets/images/passcode.png',
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Enter your Passcode',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Enter your 4 digit passcode to login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.grey,
                          letterSpacing: 1.0,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  onPressed: null,
                  child: Text(
                    'Enter Digits Only',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: PinCodeTextField(
                    onChanged: (value) {
                      passcode = int.parse(value);
                    },
                    validator: (value) {
                      if (value.isEmpty || value.length != 4) {
                        return 'Please Enter Valid passcode';
                      } else if (!(passcode == savedPasscode)) {
                        return "You've entered Wrong Passcode";
                      }
                      return null;
                    },
                    onSubmitted: (value) async {
                      savedPasscode = await _prefs.getPasscode();
                      print(savedPasscode);
                      if (_formKey.currentState.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashboardScreen(),
                          ),
                        );
                      }
                    },
                    backgroundColor: cIntroSliderBg,
                    appContext: context,
                    length: 4,
                    enablePinAutofill: false,
                    obscureText: true,
                    pinTheme: PinTheme(
                      selectedFillColor: Colors.grey[300],
                      inactiveColor: Colors.grey[300],
                      activeColor: Colors.grey[300],
                      activeFillColor: Colors.grey[300],
                      inactiveFillColor: Colors.grey[300],
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 60,
                      fieldWidth: 60,
                    ),
                    autoDismissKeyboard: true,
                    keyboardType: TextInputType.number,
                    enableActiveFill: true,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: InkWell(
                onTap: () async {
                  savedPasscode = await _prefs.getPasscode();

                  if (_formKey.currentState.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: cPrimaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width - 80,
                  alignment: Alignment.center,
                  child: Text(
                    "Confirm Passcode",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:payso/constants.dart';
import 'package:payso/model/shared_preference_operations.dart';
import 'package:payso/screens/passcode_verified_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmMobilePasscode extends StatelessWidget {
  static const String id = 'confirm_mobile_passcode';

  final int prevScreenPasscode;

  ConfirmMobilePasscode({this.prevScreenPasscode});

  final _formKey = GlobalKey<FormState>();
  int currScreenPasscode = 0;

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
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: cPrimaryColor,
                          ),
                          Text(
                            'Back',
                            style: TextStyle(
                              color: cPrimaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                        'Confirm Mobile Passcode',
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
                        'Please Re Enter your 4 digit passcode',
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
                    validator: (value) {
                      currScreenPasscode = int.parse(value);
                      if (value.isEmpty || value.length != 4) {
                        return 'Please Enter Valid passcode';
                      } else if (currScreenPasscode != prevScreenPasscode) {
                        return "Passcode doesn't match, Please Check!!";
                      }
                      return null;
                    },
                    onSubmitted: (value) {
                      if (_formKey.currentState.validate()) {
                        SharedPreferenceOperations _pref =
                            SharedPreferenceOperations();
                        _pref.setPasscode(currScreenPasscode);
                      }
                    },
                    backgroundColor: cIntroSliderBg,
                    appContext: context,
                    length: 4,
                    obscureText: false,
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
                    onChanged: (value) {
                      print("value" + value);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: InkWell(
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    SharedPreferenceOperations _pref =
                        SharedPreferenceOperations();
                    _pref.setPasscode(currScreenPasscode);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasscodeVerifiedScreen(),
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
                    "Set Passcode",
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

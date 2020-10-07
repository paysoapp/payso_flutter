import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:payso/constants.dart';
import 'package:payso/model/secure.dart';
import 'package:payso/model/shared_preference_operations.dart';
import 'package:payso/screens/secure_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:easy_localization/easy_localization.dart';

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
                            'backButton',
                            style: TextStyle(
                              color: cPrimaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ).tr(),
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
                        'confirmPasscodeTitle',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ).tr(),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'confirmPasscodeBody',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.grey,
                          letterSpacing: 1.0,
                        ),
                      ).tr()
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  onPressed: null,
                  child: Text(
                    'PasscodeDigitsOnly',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ).tr(),
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
                        return 'incorrectSetPasscode'.tr();
                      } else if (currScreenPasscode != prevScreenPasscode) {
                        print(
                            'Curr: $currScreenPasscode Prev: $prevScreenPasscode');
                        return "incorrectConfirmPasscode".tr();
                      }
                      return null;
                    },
                    onSubmitted: (value) async {
                      if (_formKey.currentState.validate()) {
                        SharedPreferenceOperations _pref =
                            SharedPreferenceOperations();
                        Secure _localAuth = Secure();
                        List<BiometricType> availableBiometrics =
                            await _localAuth.getAvailableBiometrics();
                        await _pref.setPasscode(currScreenPasscode);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecureScreen(
                              availableBiometrics: availableBiometrics,
                            ),
                          ),
                        );
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
                onTap: () async {
                  if (_formKey.currentState.validate()) {
                    SharedPreferenceOperations _pref =
                        SharedPreferenceOperations();
                    Secure _localAuth = Secure();
                    List<BiometricType> availableBiometrics =
                        await _localAuth.getAvailableBiometrics();
                    await _pref.setPasscode(currScreenPasscode);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecureScreen(
                          availableBiometrics: availableBiometrics,
                        ),
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
                    "confirmPasscodeButton".tr(),
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

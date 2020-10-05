import 'package:flutter/material.dart';
import 'package:payso/constants.dart';
import 'package:payso/model/shared_preference_operations.dart';
import 'package:payso/screens/passcode_verified_screen.dart';
import 'package:payso/widgets/back_button_widget.dart';
import 'package:payso/widgets/passcode_widget.dart';
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
                BackButtonWidget(),
                PasscodeWidget(
                  title: 'Confirm Passcode',
                  desc: 'Please Re Enter your 4 digit passcode',
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
                        print(
                            'Curr: $currScreenPasscode Prev: $prevScreenPasscode');
                        return "Passcode doesn't match, Please Check!!";
                      }
                      return null;
                    },
                    onSubmitted: (value) async {
                      if (_formKey.currentState.validate()) {
                        SharedPreferenceOperations _pref =
                            SharedPreferenceOperations();
                        await _pref.setPasscode(currScreenPasscode);
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
                    await _pref.setPasscode(currScreenPasscode);
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

import 'package:flutter/material.dart';
import 'package:payso/constants.dart';
import 'package:payso/screens/confirm_mobile_passcode.dart';
import 'package:payso/widgets/passcode_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SetMobilePasscode extends StatelessWidget {
  static const String id = 'set_mobile_passcode';
  int passcode = 0;
  final _formKey = GlobalKey<FormState>();
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
                PasscodeWidget(
                  title: 'Set Passcode',
                  desc: 'Enter a 4 digit passcode to secure your account',
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: PinCodeTextField(
                      validator: (value) {
                        if (value.isEmpty || value.length != 4) {
                          return 'Please Enter Valid passcode';
                        }
                        return null;
                      },
                      onSubmitted: (value) {
                        passcode = int.parse(value);
                        print(passcode);

                        if (_formKey.currentState.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConfirmMobilePasscode(
                                prevScreenPasscode: passcode,
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
                        passcode = int.parse(value);
                      }),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: InkWell(
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmMobilePasscode(
                          prevScreenPasscode: passcode,
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

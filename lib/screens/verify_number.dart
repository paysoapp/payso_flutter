import 'package:flutter/material.dart';
import 'package:payso/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyNumber extends StatelessWidget {
  final String mobileNumber;
  var otp;
  static const String id = 'verify_number';

  VerifyNumber({this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cIntroSliderBg,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  onPressed: null,
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
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/verify_number.png',
              width: MediaQuery.of(context).size.width -
                  MediaQuery.of(context).size.width / 4,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'Verify your number',
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
                    'Enter a 6 digit number sent to \n +91 ${mobileNumber}',
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
              height: 20,
            ),
            FlatButton(
              onPressed: null,
              child: Text(
                'Re Send Code',
                style: TextStyle(
                  color: cPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: PinCodeTextField(
                  backgroundColor: cIntroSliderBg,
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  pinTheme: PinTheme(
                    selectedFillColor: Colors.grey[300],
                    inactiveColor: Colors.grey[300],
                    activeColor: Colors.grey[300],
                    activeFillColor: Colors.grey[300],
                    inactiveFillColor: Colors.grey[300],
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                  ),
                  autoDismissKeyboard: true,
                  keyboardType: TextInputType.number,
                  enableActiveFill: true,
                  onCompleted: (value) {
                    otp = value;
                    print('otp is ' + otp);
                  },
                  onChanged: (value) {
                    print("value" + value);
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: null,
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
                  "Verify",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

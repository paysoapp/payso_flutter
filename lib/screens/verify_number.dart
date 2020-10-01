import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:payso/constants.dart';
import 'package:payso/model/register_user.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyNumber extends StatefulWidget {
  final String mobileNumber;
  static const String id = 'verify_number';

  VerifyNumber({this.mobileNumber});

  @override
  _VerifyNumberState createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  String otp = '';
  UserCredential user;
  final _formKey = GlobalKey<FormState>();
  RegisterUser registerUser = RegisterUser();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    registerUser.registerUser(widget.mobileNumber, context, _auth, otp);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cIntroSliderBg,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                      'Enter a 6 digit number sent to \n +91 ${widget.mobileNumber}',
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
                onPressed: () {
                  print("Resend OTP");
                },
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
                    validator: (value) {
                      if (value.isEmpty || value.length != 6) {
                        return 'Please Enter Valid OTP';
                      }
                      return null;
                    },
                    onSubmitted: (value) {
                      if (_formKey.currentState.validate()) {
                        registerUser.registerUser(
                            widget.mobileNumber, context, _auth, otp);
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                            builder: (context) => CompleteProfile(),
//                          ),
//                        );

                      }
                    },
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
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    registerUser.registerUser(
                        widget.mobileNumber, context, _auth, otp);
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => CompleteProfile(),
//                      ),
//                    );
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
                    "Verify",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

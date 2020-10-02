import 'package:flutter/material.dart';
import 'package:payso/constants.dart';
import 'package:payso/screens/set_mobile_passcode.dart';
import 'package:payso/widgets/profile_text_field.dart';

class CompleteProfile extends StatefulWidget {
  static const String id = 'complete_profile';
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String referralCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                ),
                Text(
                  'Complete Profile',
                  style: cHeadStyle,
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra sollicitudin commodo.',
                  style: cTextStyle,
                ),
                // SizedBox(
                //   height: 30.0,
                // ),
                ProfileTextField(
                  textFieldImage: Image.asset(
                    'assets/icons/name.png',
                    height: 25,
                    width: 25,
                  ),
                  textFieldTitle: 'Enter Your Name',
                  textFieldType: TextInputType.name,
                  onChanged: (value) {
                    name = value;
                  },
                  validator: (value) {
                    if (value.isEmpty || value.length < 3) {
                      return 'Name length must be valid';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    if (_formKey.currentState.validate()) {
                      print('Submit Done');
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => VerifyNumber(
//                            mobileNumber: phoneNumber,
//                          ),
//                        ),
//                      );
                    }
                  },
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
                ProfileTextField(
                  textFieldImage: Image.asset(
                    'assets/icons/email.png',
                    height: 25,
                    width: 25,
                  ),
                  textFieldTitle: 'Enter Your Email',
                  textFieldType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value.isEmpty ||
                        value.length < 8 ||
                        !(value.toString().contains('@'))) {
                      return 'Enter Valid Email';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    if (_formKey.currentState.validate()) {
                      print('Submit Done');
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => VerifyNumber(
//                            mobileNumber: phoneNumber,
//                          ),
//                        ),
//                      );
                    }
                  },
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
                ProfileTextField(
                  textFieldImage: Image.asset(
                    'assets/icons/flag.png',
                    height: 25,
                    width: 25,
                  ),
                  textFieldTitle: 'Referral Code',
                  onChanged: (value) {
                    referralCode = value;
                  },
                  onFieldSubmitted: (value) {
                    if (_formKey.currentState.validate()) {
                      print('Submit Done');
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => VerifyNumber(
//                            mobileNumber: phoneNumber,
//                          ),
//                        ),
//                      );
                    }
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                ),
                InkWell(
                  onTap: () {
                    //TODO: Navigate to Success Page
                    if (_formKey.currentState.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SetMobilePasscode(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      color: cPrimaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(14),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

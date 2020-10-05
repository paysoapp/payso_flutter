import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:payso/constants.dart';
import 'package:payso/model/register_user.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:payso/widgets/change_lang_btn_widget.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String phoneNumber = '';
  final _formKey = GlobalKey<FormState>();
  RegisterUser registerUser = RegisterUser();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String phoneEmpty = tr('phoneEmpty');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: ChangeLangButton()),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('./assets/images/register.png'),
              ),
              // SizedBox(
              //   height: 40.0,
              // ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text(
                      "registrationTitle",
                      style: cHeadStyle,
                    ).tr(),
                    // SizedBox(
                    //   height: 10.0,
                    // ),
                    Text(
                      'registrationBody',
                      style: cTextStyle,
                      textAlign: TextAlign.center,
                    ).tr()
                  ],
                ),
              ),
              // SizedBox(
              //   height: 30.0,
              // ),
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextFormField(
                  onChanged: (value) {
                    phoneNumber = value;
                  },
                  validator: (value) {
                    if (value.isEmpty || value.length != 10) {
                      return phoneEmpty;
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    if (_formKey.currentState.validate()) {
                      registerUser.registerUser(phoneNumber, context, _auth);
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
                  maxLength: 10,
                  style: cFormFieldStyle,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'phoneHint'.tr(),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.3,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                    ),
                    prefix: Container(
                      width: MediaQuery.of(context).size.width / 3.8,
                      child: Row(
                        children: [
                          Image.asset(
                            "./assets/icons/india.png",
                            width: 30.0,
                            height: 30.0,
                          ),
                          // SizedBox(
                          //   width: 10.0,
                          // ),
                          Text('+(91)'),
                          // SizedBox(
                          //   width: 14.0,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 20.0,
              // ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      registerUser.registerUser(phoneNumber, context, _auth);
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
                      "otpButton",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ).tr(),
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

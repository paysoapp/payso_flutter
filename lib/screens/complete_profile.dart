import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:payso/constants.dart';
import 'package:payso/model/user_model.dart';
import 'package:payso/screens/set_mobile_passcode.dart';
import 'package:payso/services/firebase_operations.dart';
import 'package:payso/widgets/profile_text_field.dart';

class CompleteProfile extends StatefulWidget {
  static const String id = 'complete_profile';
  final String phoneNumber;
  CompleteProfile({this.phoneNumber});

  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final _formKey = GlobalKey<FormState>();
  FirebaseOperations _firebaseOperations = FirebaseOperations();
  UserModel newUser = UserModel();
  String name = '';
  String email = '';
  String referralCode = '';
  String mobileNumber = '';
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
                  'completeProfileTitle',
                  style: cHeadStyle,
                ).tr(),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra sollicitudin commodo.',
                  style: cTextStyle,
                ),
                SizedBox(
                  height: 30.0,
                ),
                ProfileTextField(
                  textFieldImage: Image.asset(
                    'assets/icons/name.png',
                    height: 25,
                    width: 25,
                  ),
                  textFieldTitle: 'completeProfileName'.tr(),
                  textFieldType: TextInputType.name,
                  onChanged: (value) {
                    name = value;
                  },
                  validator: (value) {
                    if (value.isEmpty || value.length < 3) {
                      return 'incorretProfileName'.tr();
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    if (_formKey.currentState.validate()) {
                      name = value;
                    }
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                ProfileTextField(
                  textFieldImage: Image.asset(
                    'assets/icons/email.png',
                    height: 25,
                    width: 25,
                  ),
                  textFieldTitle: 'completeProfileEmail'.tr(),
                  textFieldType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value.isEmpty ||
                        value.length < 8 ||
                        !(value.toString().contains('@'))) {
                      return 'incorrectProfileEmail'.tr();
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    if (_formKey.currentState.validate()) {
                      email = value;
                    }
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                ProfileTextField(
                  textFieldImage: Image.asset(
                    'assets/icons/flag.png',
                    height: 25,
                    width: 25,
                  ),
                  textFieldTitle: 'completeProfileReferral'.tr(),
                  textFieldSize: 8,
                  onChanged: (value) {
                    referralCode = value;
                  },
                  onFieldSubmitted: (value) {
                    if (_formKey.currentState.validate()) {
                      referralCode = value;
                    }
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                ),
                InkWell(
                  onTap: () async {
                    //TODO: Navigate to Success Page
                    if (_formKey.currentState.validate()) {
                      var userId = await FirebaseAuth.instance.currentUser.uid;
                      mobileNumber =
                          await FirebaseAuth.instance.currentUser.phoneNumber;
                      newUser.setUserId(userId);
                      newUser.setUserMobile(mobileNumber);
                      newUser.setUserEmail(email);
                      newUser.setUserName(name);
                      newUser.setUserReferral(referralCode);
                      await _firebaseOperations.addUser(newUser);
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
                      "completeProfileNext".tr(),
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:payso/model/user.dart';

class FirebaseOperations extends StatelessWidget {
  static String id = 'firebase_operations';
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
    } catch (e) {
      print(e);
    }
  }

  User user = User(
    userId: '1',
    userName: 'Shubham',
    userEmail: 'bundela@email.com',
    userReferral: '',
  );

  @override
  Widget build(BuildContext context) {
    initializeFlutterFire();
    Future<void> addUser() {
      return users
          .add({
            'userId': user.userId,
            'userName': user.userName,
            'userEmail': user.userEmail,
            'userReferral': user.userReferral,
          })
          .then((value) => print('Data Entered Successfully'))
          .catchError(
            (e) {
              print(e);
            },
          );
    }

    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: addUser,
          child: Text('Add User'),
        ),
      ),
    );
  }
}

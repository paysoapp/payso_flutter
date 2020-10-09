import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:payso/model/user_model.dart';

class FirebaseOperations {
  Future<void> addUser(UserModel user) {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    return users
        .add({
          'userId': user.userId,
          'userName': user.userName,
          'userEmail': user.userEmail,
          'userReferral': user.userReferral,
          'userMobile': user.userMobile,
        })
        .then((value) => print('Data Entered Successfully'))
        .catchError(
          (e) {
            print(e);
          },
        );
  }
}

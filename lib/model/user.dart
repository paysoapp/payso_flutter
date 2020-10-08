class User {
  String userId;
  String userName;
  String userEmail;
  String userReferral;

  User({this.userId, this.userName, this.userEmail, this.userReferral});

  getUserId() {
    return this.userId;
  }

  getUserEmail() {
    return this.userEmail;
  }

  getUserName() {
    return this.userName;
  }

  getUserReferral() {
    return this.userReferral;
  }

  setUserId(userId) {
    this.userId = userId;
  }

  setUserEmail(userEmail) {
    this.userEmail = userEmail;
  }

  setUserName(userName) {
    this.userName = userName;
  }

  setUserReferral(userReferral) {
    this.userReferral = userReferral;
  }
}

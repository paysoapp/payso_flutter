import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceOperations {
  SharedPreferences _prefs;
  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  isUserOldSF() async {
    init();
    bool isUserOld = _prefs.getBool('isUserOld') ?? false;
    if (isUserOld) {
      return true;
    } else {
      return false;
    }
  }

  setOldUser() async {
    init();
    _prefs.setBool('isUserOld', true);
  }

  setPasscode(int passcode) async {
    init();
    _prefs.setInt('passcode', passcode);
  }
}

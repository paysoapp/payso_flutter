import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceOperations {
  Future<bool> isUserOldSF() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool('isUserOld') ?? false;
  }

  setOldUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool('isUserOld', true);
  }

  setPasscode(int passcode) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setInt('passcode', passcode);
  }

  Future<int> getPasscode() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return await _prefs.getInt('passcode');
  }

  setLanguage(language) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('language', language);
  }

  Future<bool> getSeen(screen) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return await _prefs.getBool(screen) ?? false;
  }

  hasSeen(screen) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool(screen, true);
  }

  logout() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.clear();
  }
}

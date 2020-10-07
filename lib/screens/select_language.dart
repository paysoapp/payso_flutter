import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payso/constants.dart';
import 'package:payso/model/language.dart';
import 'package:payso/screens/permission_screen.dart';

import '../model/shared_preference_operations.dart';

class SelectLanguage extends StatefulWidget {
  @override
  _SelectLanguageState createState() => _SelectLanguageState();
  static const String id = 'select_language';
}

class _SelectLanguageState extends State<SelectLanguage> {
  String selectedLang = Language.languageList().first.name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/images/language.png',
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Choose your preferred language',
                  textAlign: TextAlign.center,
                  style: cTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                    color: cPrimaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: DropdownButton(
                    isExpanded: true,
                    iconSize: 30,
                    iconEnabledColor: Colors.white,
                    underline: SizedBox(),
                    hint: Text(
                      selectedLang,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onChanged: (Language language) {
                      setState(() {
                        selectedLang = language.name;
                      });

                      if (EasyLocalization.of(context).locale.languageCode !=
                          language.languageCode) {
                        context.locale =
                            Locale(language.languageCode, language.countryCode);
                      }
                    },
                    items: Language.languageList()
                        .map<DropdownMenuItem<Language>>(
                          (lang) => DropdownMenuItem(
                            value: lang,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(lang.flag),
                                Text(lang.name)
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: InkWell(
                  onTap: () async {
                    SharedPreferenceOperations _prefs =
                        SharedPreferenceOperations();
                    await _prefs.setLanguage(selectedLang);
                    await _prefs.hasSeen('Language');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PermissionScreen()),
                    );
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
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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

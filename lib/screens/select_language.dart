

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payso/model/language.dart';
import 'package:payso/main.dart';
import 'package:payso/constants.dart';
import 'intro_slider.dart';


class SelectLanguage extends StatefulWidget {
  @override
  _SelectLanguageState createState() => _SelectLanguageState();
  static const String id = 'select_language';


}

class _SelectLanguageState extends State<SelectLanguage> {


  // void _changeLanguage(Language language){
  //   Locale _temp;
  //   switch (language.languageCode){
  //     case 'en':
  //       _temp=Locale(language.languageCode,'en');
  //       break;
  //     case 'fil':
  //       _temp=Locale(language.languageCode,'fil');
  //       break;
  //
  //     default:
  //       _temp=Locale(language.languageCode,'fil');
  //   }
  //   MyApp.setLocale(context,_temp);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payso"),
        centerTitle: true,
        backgroundColor: cPrimaryColor,
      ),


      body: Container(

        padding: EdgeInsets.all(20.0),
        child: DropdownButton(onChanged:(Language language){

          if(EasyLocalization.of(context).locale.languageCode!=language.languageCode){

            context.locale=Locale(language.languageCode,language.countryCode);

          }

      // _changeLanguage(language);
      // print("Language Name "+language.languageCode);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroSlider()),
      );

      },
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
          value: lang,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:<Widget> [Text(lang.flag),Text(lang.name)],
          ),
        )).toList()),
      ),
    );
  }
}

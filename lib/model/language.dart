class Language {
  final int id;
  final String name;
  final String flag;
  final String languageCode;
  final String countryCode;

  Language(this.id, this.name, this.flag, this.languageCode,this.countryCode);
  static List<Language> languageList(){
    return <Language>[
      Language(1,'English','🇺🇸','en','US'),
      Language(2,'Filpino','🇵🇭','fil','PH'),
    ];

  }
}
import 'package:flutter/cupertino.dart';

class AppConfigProvider extends ChangeNotifier{
  String language='en';

  changeLanguage(String newLanguage)async{
    if(language == newLanguage)
      return;
    language=newLanguage;
    notifyListeners();
  }
}
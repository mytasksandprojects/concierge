import 'package:concierge/Services/web_services.dart';

class ChangeLangService{
  WebService _webService=WebService();
  void changeLang(String lang,){
    _webService.lang = lang;
    _webService.changeLanguage(lang);
  }

}
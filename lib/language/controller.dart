import 'package:get/get.dart';

class LanguageController extends GetxController {
  var selectedLanguage = 'en'.obs;

  void changeLanguage(String language) {
    selectedLanguage.value = language;
  }

  String getTranslatedValue(String key) {
    // Load translations based on selected language
    // Replace this with your logic to load translations from language files
    // For simplicity, I'll directly return translations from a map
    Map<String, Map<String, String>> translations = {
      'en': {
        "Login": "Login",
        "Mobile Number": "Mobile Number",
        "Password": "Password",
        'Changelang': 'Change Language',
        'In': 'In',
        'Out': 'Out',
        '(IN) Gate Pass No': '(IN) Gate Pass No',
        '(OUT) Gate Pass No': '(OUT) Gate Pass No',
        'Reject': 'Reject',
        'Accepet': 'Accepet',
        'Ok': 'Ok',
        'Save': 'Save',
        'Reset': 'Reset',
      },
      'hi': {
        "Login": "लॉगिन",
        "Mobile Number": "मोबाइल नंबर",
        "Password": "पासवर्ड",
        'changelang': 'भाषा बदलो',
        'In': 'अंदर',
        'Out': 'बाहर',
        '(IN) Gate Pass No': '(अंदर) गेट पास नंबर',
        '(OUT) Gate Pass No': '(आउट) गेट पास नंबर',
        'Reject': 'ना',
        'Accepet': 'हा',
        'Ok': 'हा',
        'Save': 'सचवो',
        'Reset': 'रीसेट',
      },
      'gu': {
        "Login": "લોગિન",
        "Mobile Number": "મોબાઇલ નંબર",
        "Password": "પાસવર્ડ",
        'changelang': 'ભાષા બદલો',
        'In': 'અંદર',
        'Out': 'બહાર',
        '(IN) Gate Pass No': '(અંદર) ગેટ પાસ નંબર',
        '(OUT) Gate Pass No': '(બહાર) ગેટ પાસ નંબર',
        'Reject': 'ના',
        'Accepet': 'હા',
        'Ok': 'હા',
        'Save': 'સાચવો',
        'Reset': 'રીસેટ',
      },
    };

    return translations[selectedLanguage.value]![key] ?? '';
  }
}

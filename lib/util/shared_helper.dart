import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedHelper sharedHelper = SharedHelper._();

  SharedHelper._();

  Future<void> addBookMark(List<String> cityList) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setStringList("bookmark", cityList);
  }

  Future<List<String>?> getBookMark() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    return shr.getStringList("bookmark");
  }

  Future<void> setTheme(bool value) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool("islight", value);
  }
  Future<bool?> getTheme() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    return shr.getBool("islight");
  }
}

import 'package:flutter/material.dart';
import 'package:sky_scrapper_app/screen/sky/model/sky_model.dart';
import 'package:sky_scrapper_app/util/api_helper.dart';
import 'package:sky_scrapper_app/util/shared_helper.dart';

class SkyProvider with ChangeNotifier {
  SkyModel? skyModel;
  String skySearch = 'surat';

  void skySearchData(String search) {
    skySearch = search;
    notifyListeners();
  }

  Future<void> getWeatherData() async {
    APIHelper apiHelper = APIHelper();
    SkyModel? s1 = await apiHelper.skyAPICall(skySearch);
    skyModel = s1;
    notifyListeners();
  }

  // Network
  bool isOnline = false;
  void changeStatus(bool status) {
    isOnline = status;
    notifyListeners();
  }

  // Theme
  bool isLight = false;

  void changeTheme() async {
    SharedHelper sharedHelper = SharedHelper.sharedHelper;
    bool? isTheme = await sharedHelper.getTheme();
    isLight = isTheme ?? false;
    notifyListeners();
  }
}

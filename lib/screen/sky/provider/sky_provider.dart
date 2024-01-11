import 'package:flutter/material.dart';
import 'package:sky_scrapper_app/screen/sky/model/sky_model.dart';
import 'package:sky_scrapper_app/util/api_helper.dart';


class SkyProvider with ChangeNotifier{
  SkyModel? skyModel;

  Future<void> getWeatherData() async {
    APIHelper apiHelper = APIHelper();
    SkyModel? s1= await apiHelper.skyAPICall();
    skyModel = s1;
    notifyListeners();
  }
}
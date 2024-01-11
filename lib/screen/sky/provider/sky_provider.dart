import 'package:flutter/material.dart';
import 'package:sky_scrapper_app/screen/sky/model/sky_model.dart';
import 'package:sky_scrapper_app/util/api_helper.dart';

import '../../../util/shared_helper.dart';


class SkyProvider with ChangeNotifier{
  SkyModel? skyModel;
  String skySearch = 'surat';


  void skySearchData(String search){
    skySearch=search;
    notifyListeners();
  }

  Future<void> getWeatherData() async {
    APIHelper apiHelper = APIHelper();
    SkyModel? s1= await apiHelper.skyAPICall(skySearch);
    skyModel = s1;
    notifyListeners();
  }


}
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sky_scrapper_app/screen/sky/model/sky_model.dart';


class APIHelper{
  Future<SkyModel?> skyAPICall(String city) async {
    String apiLink =
        "https://api.openweathermap.org/data/2.5/weather?q=$city,indai&appid=0b1dda74ce1aef731b37328f6c4b0586";
    var response = await http.get(Uri.parse(apiLink));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      SkyModel skyModel = SkyModel.mapToModel(json);
      return skyModel;
    }
    return null;
  }
}
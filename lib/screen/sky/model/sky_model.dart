class SkyModel{
  dynamic timezone,id,cod,visibility,dt;
  String? name,base;
  CoordModel? coordModel;
  List<WeatherModel>? weatherList=[];
  MainModel? mainModel;
  WindModel? windModel;
  CloudsModel? cloudsModel;
  SysModel? sysModel;


  SkyModel(
      {this.timezone,
      this.id,
      this.cod,
      this.visibility,
      this.dt,
      this.name,
      this.base,
      this.coordModel,
      this.weatherList,
      this.mainModel,
      this.windModel,
      this.cloudsModel,
      this.sysModel});

  factory SkyModel.mapToModel(Map m1){
    List l1=m1['weather'];
    return SkyModel(
      base: m1['base'],
      visibility: m1['visibility'],
      dt: m1['dt'],
      timezone: m1['timezone'],
      id: m1['id'],
      name: m1['name'],
      cod: m1['cod'],
      coordModel: CoordModel.mapToModel(m1['coord']),
      weatherList: l1.map((e) => WeatherModel.mapToModel(e)).toList(),
      mainModel: MainModel.mapToModel(m1['main']),
      windModel: WindModel.mapToModel(m1['wind']),
      cloudsModel: CloudsModel.mapToModel(m1['clouds']),
      sysModel: SysModel.mapToModel(m1['sys']),
    );
  }
}
class CoordModel{
  dynamic lon,lat;

  CoordModel({this.lon, this.lat});

  factory CoordModel.mapToModel(Map m1){
    return CoordModel(
      lon: m1['lon'],
      lat: m1['lat'],
    );
  }
}

class WeatherModel{
  int? id;
  String? main,description,icon;

  WeatherModel({this.id, this.main, this.description, this.icon});

  factory WeatherModel.mapToModel(Map m1){
    return WeatherModel(
      id: m1['id'],
      main: m1['main'],
      description: m1['description'],
      icon: m1['icon'],
    );
  }
}
class MainModel{
  dynamic temp,feels_like,temp_min,temp_max,pressure,humidity;

  MainModel(
      {this.temp,
      this.feels_like,
      this.temp_min,
      this.temp_max,
      this.pressure,
      this.humidity});

  factory MainModel.mapToModel(Map m1){
    return MainModel(
      temp: m1['temp'],
      feels_like: m1['feels_like'],
      temp_min: m1['temp_min'],
      temp_max: m1['temp_max'],
      pressure: m1['pressure'],
      humidity: m1['humidity'],
    );
  }
}
class WindModel{
  dynamic speed,deg;

  WindModel({this.speed, this.deg});

  factory WindModel.mapToModel(Map m1){
    return WindModel(
      speed: m1['speed'],
      deg: m1['deg'],
    );
  }
}
class CloudsModel{
  dynamic all;

  CloudsModel({this.all});

  factory CloudsModel.mapToModel(Map m1){
    return CloudsModel(
      all: m1['all'],
    );
  }
}
class SysModel{
  dynamic type,id,sunrise,sunset;
  String? country;

  SysModel({this.type, this.id, this.sunrise, this.sunset, this.country});

  factory SysModel.mapToModel(Map m1){
    return SysModel(
      type: m1['type'],
      id: m1['id'],
      country: m1['country'],
      sunrise: m1['sunrise'],
      sunset: m1['sunset'],
    );
  }
}

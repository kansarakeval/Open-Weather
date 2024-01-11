import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_app/screen/sky/provider/sky_provider.dart';


class SkyScreen extends StatefulWidget {
  const SkyScreen({super.key});

  @override
  State<SkyScreen> createState() => _SkyScreenState();
}

class _SkyScreenState extends State<SkyScreen> {
  SkyProvider? providerr;
  SkyProvider? providerw;
  @override
  void initState() {
    super.initState();
    context.read<SkyProvider>().getWeatherData();

  }
  @override
  Widget build(BuildContext context) {
    providerr = context.read<SkyProvider>();
    providerw = context.watch<SkyProvider>();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: providerw!.skyModel == null
              ? Center(child: CircularProgressIndicator())
              : Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  "assets/img/bk.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${providerw!.skyModel!.name}",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${providerw!.skyModel!.cloudsModel!.all}",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${providerw!.skyModel!.coordModel!.lon}°C",
                            style: TextStyle(
                                fontSize: 24, color: Colors.white),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            "${providerw!.skyModel!.coordModel!.lat}°C",
                            style: TextStyle(
                                fontSize: 24, color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                height:
                                MediaQuery.sizeOf(context).height *
                                    0.25,
                                width: MediaQuery.sizeOf(context).width *
                                    0.42,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey.shade50)),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "weather",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Id: ${providerw!.skyModel!.weatherList![0].id}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Main: ${providerw!.skyModel!.weatherList![0].main}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Desc: ${providerw!.skyModel!.weatherList![0].description}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Icon: ${providerw!.skyModel!.weatherList![0].icon}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                height:
                                MediaQuery.sizeOf(context).height *
                                    0.25,
                                width: MediaQuery.sizeOf(context).width *
                                    0.42,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey.shade50)),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Wind",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Speed: ${providerw!.skyModel!.windModel!.speed}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Deg: ${providerw!.skyModel!.windModel!.deg}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                height:
                                MediaQuery.sizeOf(context).height *
                                    0.35,
                                width: MediaQuery.sizeOf(context).width *
                                    0.42,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey.shade50)),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Main",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Temp: ${providerw!.skyModel!.mainModel!.temp}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Feels_like: ${providerw!.skyModel!.mainModel!.feels_like}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Temp_min: ${providerw!.skyModel!.mainModel!.temp_min}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Temp_max: ${providerw!.skyModel!.mainModel!.temp_max}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Pressure: ${providerw!.skyModel!.mainModel!.pressure}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Humidity: ${providerw!.skyModel!.mainModel!.humidity}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                height:
                                MediaQuery.sizeOf(context).height *
                                    0.35,
                                width: MediaQuery.sizeOf(context).width *
                                    0.42,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey.shade50)),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sys",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Country: ${providerw!.skyModel!.sysModel!.country}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Sunrise: ${providerw!.skyModel!.sysModel!.sunrise}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Sunset: ${providerw!.skyModel!.sysModel!.sunset}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Any Details",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Timezone: ${providerw!.skyModel!.timezone}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

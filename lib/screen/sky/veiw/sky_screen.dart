import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_app/screen/sky/provider/sky_provider.dart';
import 'package:sky_scrapper_app/util/network.dart';
import 'package:sky_scrapper_app/util/shared_helper.dart';

class SkyScreen extends StatefulWidget {
  const SkyScreen({super.key});

  @override
  State<SkyScreen> createState() => _SkyScreenState();
}

class _SkyScreenState extends State<SkyScreen> {
  SkyProvider? providerr;
  SkyProvider? providerw;
  NetworkConnection networkConnection = NetworkConnection();

  @override
  void initState() {
    super.initState();
    context.read<SkyProvider>().getBookMark();
    context.read<SkyProvider>().getWeatherData();
    networkConnection.checkConnection(context);
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<SkyProvider>();
    providerw = context.watch<SkyProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sky Scrapper"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                providerr!.getBookMark();
                if (!providerr!.cityList!.contains(providerr!.skySearch)) {
                 providerr!.addBookMarks();
                } else {
                  providerr!.removeBookMarks();
                }
              },
              icon: Icon(
                  providerw!.cityList!.contains(providerr!.skySearch)
                      ? Icons.star
                      : Icons.star_border),
            ),
            Consumer<SkyProvider>(
              builder: (context, value1, child) => Switch(
                value: value1.isLight,
                onChanged: (value) {
                  SharedHelper sharedHelper = SharedHelper.sharedHelper;
                  sharedHelper.setTheme(value);
                  value1.changeTheme();
                },
              ),
            ),
          ],
        ),
        body: Center(
            child: providerw!.skyModel == null
                ? const Center(child: CircularProgressIndicator())
                : providerw!.isOnline
                    ? Stack(
                        children: [
                          Image.asset(
                            "assets/img/bk.jpg",
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                          ),
                          Center(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SearchBar(
                                      hintText: "search bar",
                                      elevation:
                                          const MaterialStatePropertyAll(0.5),
                                      trailing: const [
                                        Icon(Icons.search),
                                      ],
                                      onSubmitted: (value) {
                                        providerr!
                                            .skySearchData(value.toLowerCase());
                                        providerr!.getWeatherData();
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, 'details',
                                          arguments: providerw!.skyModel);
                                    },
                                    child: Text("${providerw!.skyModel!.name}",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      "${providerw!.skyModel!.cloudsModel!.all}°C",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "${providerw!.skyModel!.coordModel!.lon}°C",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      Text(
                                          "${providerw!.skyModel!.coordModel!.lat}°C",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(10),
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.25,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.42,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(colors: [
                                              Colors.white24,
                                              Colors.black12
                                            ])),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "weather",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Id: ${providerw!.skyModel!.weatherList![0].id}",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Main: ${providerw!.skyModel!.weatherList![0].main}",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Desc: ${providerw!.skyModel!.weatherList![0].description}",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Icon: ${providerw!.skyModel!.weatherList![0].icon}",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(10),
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.25,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.42,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(colors: [
                                              Colors.white24,
                                              Colors.black12
                                            ])),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Wind",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Speed: ${providerw!.skyModel!.windModel!.speed}",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Deg: ${providerw!.skyModel!.windModel!.deg}",
                                              style:
                                                  const TextStyle(fontSize: 15),
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
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(10),
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.35,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.42,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(colors: [
                                              Colors.white24,
                                              Colors.black12
                                            ])),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Main",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Temp: ${providerw!.skyModel!.mainModel!.temp}",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Feels_like: ${providerw!.skyModel!.mainModel!.feels_like}",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Temp_min: ${providerw!.skyModel!.mainModel!.temp_min}",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Temp_max: ${providerw!.skyModel!.mainModel!.temp_max}",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Pressure: ${providerw!.skyModel!.mainModel!.pressure}",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Humidity: ${providerw!.skyModel!.mainModel!.humidity}",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(10),
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.35,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.42,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(colors: [
                                              Colors.white24,
                                              Colors.black12
                                            ])),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Sys",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Country: ${providerw!.skyModel!.sysModel!.country}",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Sunrise: ${providerw!.skyModel!.sysModel!.sunrise}",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Sunset: ${providerw!.skyModel!.sysModel!.sunset}",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "Any Details",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Timezone: ${providerw!.skyModel!.timezone}",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    : Center(
                        child: Image.asset(
                          "assets/img/net.png",
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      )),
        drawer: Drawer(
          child: ListView.builder(
            itemCount: providerw!.cityList!.length,
            itemBuilder: (context, index) => ListTile(
              title: Text("${providerr!.cityList![index]}"),
            ),
          ),
        ),
      ),
    );
  }
}

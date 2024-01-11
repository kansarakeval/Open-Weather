import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_app/screen/sky/provider/sky_provider.dart';
import 'package:sky_scrapper_app/util/shared_helper.dart';

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
        appBar: AppBar(
          title: Text("Sky Scrapper"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
      },
              icon: Icon(providerw!.cityList!.contains(providerr!.skySearch)==true?Icons.star:Icons.star_border),
            )
          ],
        ),
        body: Center(
          child: providerw!.skyModel == null
              ? const Center(child: CircularProgressIndicator())
              : Stack(
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
                                elevation: const MaterialStatePropertyAll(0.5),
                                trailing: const [
                                  Icon(Icons.search),
                                ],
                                onSubmitted: (value) {
                                  providerr!.skySearchData(value.toLowerCase());
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
                              child: Text(
                                "${providerw!.skyModel!.name}",
                                style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${providerw!.skyModel!.cloudsModel!.all}°C",
                              style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${providerw!.skyModel!.coordModel!.lon}°C",
                                  style: const TextStyle(
                                      fontSize: 24, color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  "${providerw!.skyModel!.coordModel!.lat}°C",
                                  style: const TextStyle(
                                      fontSize: 24, color: Colors.white),
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
                                      MediaQuery.sizeOf(context).height * 0.25,
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.42,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey.shade50)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "weather",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Id: ${providerw!.skyModel!.weatherList![0].id}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Main: ${providerw!.skyModel!.weatherList![0].main}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Desc: ${providerw!.skyModel!.weatherList![0].description}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Icon: ${providerw!.skyModel!.weatherList![0].icon}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.25,
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.42,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey.shade50)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Wind",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Speed: ${providerw!.skyModel!.windModel!.speed}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Deg: ${providerw!.skyModel!.windModel!.deg}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
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
                                      MediaQuery.sizeOf(context).height * 0.35,
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.42,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey.shade50)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Main",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Temp: ${providerw!.skyModel!.mainModel!.temp}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Feels_like: ${providerw!.skyModel!.mainModel!.feels_like}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Temp_min: ${providerw!.skyModel!.mainModel!.temp_min}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Temp_max: ${providerw!.skyModel!.mainModel!.temp_max}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Pressure: ${providerw!.skyModel!.mainModel!.pressure}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Humidity: ${providerw!.skyModel!.mainModel!.humidity}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.35,
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.42,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey.shade50)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Sys",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Country: ${providerw!.skyModel!.sysModel!.country}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Sunrise: ${providerw!.skyModel!.sysModel!.sunrise}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Sunset: ${providerw!.skyModel!.sysModel!.sunset}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Any Details",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Timezone: ${providerw!.skyModel!.timezone}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
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
                ),
        ),
        drawer: Drawer(),
      ),
    );
  }
}

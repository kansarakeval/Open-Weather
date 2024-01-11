import 'package:flutter/material.dart';
import 'package:sky_scrapper_app/screen/sky/model/sky_model.dart';

class DeatilsScreen extends StatefulWidget {
  const DeatilsScreen({super.key});

  @override
  State<DeatilsScreen> createState() => _DeatilsScreenState();
}

class _DeatilsScreenState extends State<DeatilsScreen> {
  @override
  Widget build(BuildContext context) {
    SkyModel model = ModalRoute.of(context)!.settings.arguments as SkyModel;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "assets/img/bk.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                details(
                    name: "City/Contry",
                    title: "City: ${model.name}",
                    title1: "Contry: ${model.sysModel!.country}",
                    icon: Icons.location_city,
                    icon1: Icons.cabin),
                details(
                    name: "Location",
                    title: "lat: ${model.coordModel!.lat}",
                    title1: "lon: ${model.coordModel!.lon}",
                    icon: Icons.map,
                    icon1: Icons.map),
                details(
                    name: "Weather",
                    title: "main: ${model.weatherList![0].main}",
                    title1: "icon: ${model.weatherList![0].icon}",
                    icon: Icons.info_outline,
                    icon1: Icons.info_outline),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container details(
      {required String name,
      title,
      title1,
      required IconData icon,
      required IconData icon1}) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 120,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [Colors.white24, Colors.black12])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 15),
              ),
              Spacer(),
              Icon(icon),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                title1,
                style: TextStyle(fontSize: 15),
              ),
              Spacer(),
              Icon(icon1)
            ],
          ),
        ],
      ),
    );
  }
}

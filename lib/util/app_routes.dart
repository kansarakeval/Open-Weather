import 'package:flutter/material.dart';
import 'package:sky_scrapper_app/screen/sky/veiw/deatils_screen.dart';
import 'package:sky_scrapper_app/screen/sky/veiw/sky_screen.dart';
import 'package:sky_scrapper_app/screen/splash/view/splash_screen.dart';


Map<String,WidgetBuilder> app_Routes={
  '/': (context) => const SplashScreen(),
  'sky': (context) => const SkyScreen(),
  'details': (context) => const DeatilsScreen(),
};
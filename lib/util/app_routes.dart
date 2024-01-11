import 'package:flutter/material.dart';
import 'package:sky_scrapper_app/screen/sky/veiw/sky_screen.dart';
import 'package:sky_scrapper_app/screen/splash/view/splash_screen.dart';


Map<String,WidgetBuilder> app_Routes={
  '/': (context) => SplashScreen(),
  'sky': (context) => SkyScreen(),
};
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_app/screen/sky/provider/sky_provider.dart';
import 'package:sky_scrapper_app/util/app_routes.dart';

void main(){
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: SkyProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          routes: app_Routes,
        ),
      )
  );
}
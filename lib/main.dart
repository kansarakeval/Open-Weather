import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_app/screen/sky/provider/sky_provider.dart';
import 'package:sky_scrapper_app/util/app_routes.dart';
import 'package:sky_scrapper_app/util/theme.dart';

void main(){
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: SkyProvider()),
        ],
        child: Consumer<SkyProvider>(builder: (context,value,child){
          value.changeTheme();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: value.isLight? lightTheme : darkTheme,
            routes: app_Routes,
          );
        }),
      )
  );
}
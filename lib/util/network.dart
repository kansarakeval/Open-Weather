import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper_app/screen/sky/provider/sky_provider.dart';

class NetworkConnection {
  Connectivity networkConnectivity = Connectivity();

  Future<void> checkConnection(BuildContext context) async {
    ConnectivityResult result = await networkConnectivity.checkConnectivity();

    checkStatus(result,context);
    networkConnectivity.onConnectivityChanged.listen((event) {
      checkStatus(event,context);
    });
  }

  void checkStatus(ConnectivityResult result,BuildContext context) {
    if (result.index==1 || result.index==3) {
      context.read<SkyProvider>().changeStatus(true);
      print("InterNet is on");
    } else {
      context.read<SkyProvider>().changeStatus(false);
      print("InterNet is off");
    }
  }
}
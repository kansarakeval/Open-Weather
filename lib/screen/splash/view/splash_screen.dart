import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
          () {
        Navigator.pushReplacementNamed(context, 'sky');
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/img/logo.jpg',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 5,),
              const Text(
                "Open Weather",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}

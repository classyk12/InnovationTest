// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      Get.offNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/logo.png',
                    height: 150.0, width: 150),
                const Text('Intelligent Innovations',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                    ))
              ]),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

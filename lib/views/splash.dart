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
    Future.delayed(const Duration(seconds: 5), () async {
      Get.offNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: const Text('I - I',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.none,
          )),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

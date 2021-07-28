// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:intelligent_innovation/views/detail.dart';
import 'package:intelligent_innovation/views/home.dart';
import 'package:intelligent_innovation/views/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Intelligent_Innovation',
        initialRoute: '/splash',
        theme: ThemeData(fontFamily: 'Poppins'),
        getPages: [
          GetPage(name: '/splash', page: () => const SplashScreen()),
          GetPage(name: '/home', page: () => const HomeScreen()),
          GetPage(name: '/details', page: () => const DetailScreen()),
        ]);
  }
}

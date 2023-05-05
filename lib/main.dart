import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planetproject/view/Home.dart';
import 'package:planetproject/view/home_screen2.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page:() => HomeScreen(),
        ),
        GetPage(name: '/PlanetScreen', page: () => PlanetScreen(),)
      ],
    )
  );
}
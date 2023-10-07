import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home/home_view.dart';
import 'splash_screen/splash_screen_view.dart';
import 'utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wartorn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      getPages: [
        GetPage(name: HOME, page: () => const HomeView(), transition: Transition.fadeIn),
      ]
    );
  }
}

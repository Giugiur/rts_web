import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
        builder: (controller) =>
        Container(
          color: Colors.black,
          child: Image.asset(
            'images/loading.gif',
            height: 50,
            width: 50,
          ),
        ),
    );
  }
}
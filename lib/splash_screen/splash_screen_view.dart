import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/utils/utils.dart';
import 'splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenController splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
        builder: (splashScreenController) =>
        Container(
          decoration: gradientDecoration,
          child: Image.asset(
            'images/loading.gif',
            height: 50,
            width: 50,
          ),
        ),
    );
  }
}
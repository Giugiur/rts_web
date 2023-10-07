import 'dart:async';
import 'package:get/get.dart';
import '../utils/constants.dart';

class SplashScreenController extends GetxController {

  void sendToHome() {
    Timer(Duration(seconds: 2), () {
      Get.toNamed(HOME);
    });

  }

  @override
  void onInit() {
    sendToHome();
    super.onInit();
  }
}
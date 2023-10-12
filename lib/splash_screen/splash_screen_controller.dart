import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../utils/constants.dart';

class SplashScreenController extends GetxController {

  void sendToHome() {
    Timer(const Duration(seconds: 2), () {
      Get.toNamed(HOME);
    });
  }


  @override
  void onReady() {
    if (Get.currentRoute == '/') {
      sendToHome();
    }
    super.onReady();
  }
}
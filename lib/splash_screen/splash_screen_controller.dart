import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rts_web/home/home_view.dart';
import '../utils/constants.dart';

class SplashScreenController extends GetxController {

  void sendToHome() {
    Timer(const Duration(milliseconds: 1500), () {
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
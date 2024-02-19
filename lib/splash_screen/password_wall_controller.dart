import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/constants.dart';

class PasswordWallController extends GetxController {
  String _password = '';

  @override
  void onInit() {
    print('asd');
    super.onInit();
  }
  void sendToHome() {
    Get.toNamed(HOME);
  }

  void updatePassword(String password) {
    if (password == 'balance') {
      sendToHome();
    }
  }
  
  void checkPassword() {
    if (_password == 'balance') {
      sendToHome();
    } else {
      Get.snackbar(
        'Error!',
        'Wrong Password',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
        icon: Icon(Icons.error, color: Colors.white),
        maxWidth: 350,
        margin: const EdgeInsets.all(20),
        colorText: Colors.white,
        borderRadius: 20,
        forwardAnimationCurve: Curves.easeOut,
      );
    }
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void createSnackbar(String type, String message) {
  Get.snackbar(
    type == 'success' ? 'Success!' : 'Error!',
    message,
    backgroundColor: type == 'success' ? Colors.green : Colors.red,
    snackPosition: SnackPosition.TOP,
    icon: Icon(type == 'success' ? Icons.check_circle : Icons.error, color: Colors.white),
    maxWidth: 350,
    margin: const EdgeInsets.all(20),
    colorText: Colors.white,
    borderRadius: 20,
    forwardAnimationCurve: Curves.easeOut,
  );
}
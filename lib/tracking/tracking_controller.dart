import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum COOKIES {
  ACCEPTED,
  REJECTED,
}

class TrackingController extends GetxController {

  void showTrackingBanner() {
    if (GetStorage().read('cookies') != 'accepted') {
      Get.snackbar(
        '',
        "We use cookies to enhance your experience and analyze our site usage. Please see our Privacy Policy for more information.",
        titleText: Container(),
        snackPosition: SnackPosition.TOP,
        maxWidth: 600,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 25),
        duration: const Duration(days: 365),
        mainButton: TextButton(
          child: const Text('Accept All'),
          onPressed: () => acceptAllCookies(),
        ),
      );
    }
  }

  void acceptAllCookies() {
    GetStorage().write('cookies', 'accepted');
    Get.closeCurrentSnackbar();
  }
}
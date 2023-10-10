import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class TrackingController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    if (isTrackingEnabled()) {
      initializeTracking();
    }
  }

  void trackEvent(String event) {
    if (isTrackingEnabled()) {
      FirebaseAnalytics.instance.logEvent(name: event);
    }
  }

  void showTrackingBanner() {
    if (!isTrackingEnabled()) {
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
    initializeTracking();
  }

  Future<void> initializeTracking() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  bool isTrackingEnabled() {
    return GetStorage().read('cookies') == 'accepted';
  }
}
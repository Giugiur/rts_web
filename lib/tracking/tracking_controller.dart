import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class TrackingController extends GetxController {

  bool _showTrackingBanner = true;
  get showTrackingBanner => _showTrackingBanner;

  void trackEvent(String event) {
    if (isTrackingEnabled()) {
      FirebaseAnalytics.instance.logEvent(name: event);
    }
  }

  void acceptAllCookies() {
    GetStorage().write('cookies', 'accepted');
  }

  void hideCookiesBanner() {
    _showTrackingBanner = false;
    update();
  }

  bool isTrackingEnabled() {
    return GetStorage().read('cookies') == 'accepted';
  }
}
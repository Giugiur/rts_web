import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:rts_web/tracking/tracking_controller.dart';

class HomeController extends GetxController {

  bool scaleEnabled = true;
  int scrolledDown = 0;
  int scrolledUp = 0;
  TrackingController trackingController = Get.put(TrackingController());

  void listenForScrolling(pointerSignal) {
    if (pointerSignal is PointerScrollEvent) {
      if (pointerSignal.scrollDelta.dx == 0 && pointerSignal.scrollDelta.dy == 100) {
        if (scrolledDown < 10) {
          scrolledDown++;
        }
        if (scrolledUp > 0) {
          scrolledUp--;

        }
        update();
      }
      if (pointerSignal.scrollDelta.dy == -100) {
        if (scrolledUp < 10) {
          scrolledUp++;
        }
        if (scrolledDown > 0) {
          scrolledDown--;
        }
        update();
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    executeAfterBuild();
  }

  Future<void> executeAfterBuild() async {
    await Future.delayed(Duration.zero);
    trackingController.showTrackingBanner();
  }

}
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:rts_web/tracking/tracking_controller.dart';

class HomeController extends GetxController {
  bool _scrolled = false;
  TrackingController trackingController = Get.put(TrackingController());

  get scrolled => _scrolled;

  void listenForScrolling(pointerSignal) {
    if (pointerSignal is PointerScrollEvent) {
      _scrolled = true;
    }
    update();
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
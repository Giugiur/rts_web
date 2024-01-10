import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:rts_web/tracking/tracking_controller.dart';
import 'package:anchor_scroll_controller/anchor_scroll_controller.dart';

class HomeController extends GetxController {
  bool _scrolled = false;
  TrackingController trackingController = Get.put(TrackingController());
  late AnchorScrollController _anchorScrollController;
  String _hoveringOver = '';

  get anchorScrollController => _anchorScrollController;
  get scrolled => _scrolled;
  get hoveringOver => _hoveringOver;

  void listenForScrolling(pointerSignal) {
    if (pointerSignal is PointerScrollEvent) {
      _scrolled = true;
    }
    update();
  }

  @override
  void onInit() {
    _anchorScrollController = AnchorScrollController();
    _hoveringOver = '';
    super.onInit();
    executeAfterBuild();
    update();
  }

  void onEntering(String region) {
    _hoveringOver = region;
    update();
  }

  Future<void> executeAfterBuild() async {
    await Future.delayed(Duration.zero);
    trackingController.showTrackingBanner();
  }

}
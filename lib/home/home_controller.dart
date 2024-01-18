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
  bool introSectionVisible = false;
  bool whitepaperSectionVisible = false;
  bool marketplaceSectionVisible = false;
  bool _isCookieBannerVisible = true;
  int _page = 0;

  get anchorScrollController => _anchorScrollController;
  get scrolled => _scrolled;
  get hoveringOver => _hoveringOver;
  get isCookieBannerVisible => _isCookieBannerVisible;
  get page => _page.toDouble();

  void listenForScrolling(pointerSignal) {
    if (pointerSignal is PointerScrollEvent) {
      _scrolled = true;
    }
    update();
  }

  @override
  void onInit() {
    if (trackingController.isTrackingEnabled()) {
      hideCookiesBanner();
    }
    _hoveringOver = '';
    switchIntroSectionVisibility(true);
    super.onInit();
    executeAfterBuild();
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void onEntering(String region) {
    _hoveringOver = region;
    update();
  }

  Future<void> executeAfterBuild() async {
    await Future.delayed(Duration.zero);
  }

  void acceptAllCookies() {
    trackingController.acceptAllCookies();
    hideCookiesBanner();
  }

  void hideCookiesBanner() {
    trackingController.hideCookiesBanner();
    _isCookieBannerVisible = false;
    update();
  }

  void setHomePage(int page) {
    _page = page;
    switchIntroSectionVisibility(false);
    switchWhitepaperSectionVisibility(false);
    switchMarketplaceSectionVisibility(false);
    switch(page) {
      case 0:
        switchIntroSectionVisibility(true);
        break;
      case 1:
        switchWhitepaperSectionVisibility(true);
        break;
      case 2:
        switchMarketplaceSectionVisibility(true);
        break;
      default:
        switchIntroSectionVisibility(true);
    }
    update();
  }

  void switchIntroSectionVisibility(bool value) {
    introSectionVisible = value;
    update();
  }

  void switchWhitepaperSectionVisibility(bool value) {
    whitepaperSectionVisible = value;
    update();
  }

  void switchMarketplaceSectionVisibility(bool value) {
    marketplaceSectionVisible = value;
    update();
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool isSmallScreen (context) {
  var screenSize = MediaQuery.of(context).size;
  return screenSize.width < 1250;
}

bool isMobile (context) {
  return GetPlatform.isMobile;
}

bool isDesktop (context) {
  return GetPlatform.isDesktop;
}
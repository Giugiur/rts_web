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

const BoxDecoration gradientDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(44, 42, 57, 1),
      Color.fromRGBO(42, 59, 79, 1)
    ]
  )
);
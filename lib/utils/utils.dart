import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../NFTs/NFTModel.dart';

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

const BoxDecoration circularGradientDecoration = BoxDecoration(
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15.0),
      topRight: Radius.circular(15.0)
  ),
  gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color.fromRGBO(44, 42, 57, 1),
        Color.fromRGBO(42, 59, 79, 1)
      ]
  ),
);

Color getRarityColor(Rarity rarity) {
  Color color = Colors.white;
  switch (rarity) {
    case Rarity.Common:
      color = Colors.white;
      break;
    case Rarity.Uncommon:
      color = Colors.greenAccent;
      break;
    case Rarity.Rare:
      color = Colors.lightBlue;
      break;
    case Rarity.Mythic:
      color = Colors.purpleAccent;
      break;
    case Rarity.Fabled:
      color = Colors.yellow;
      break;
    default:
      color = Colors.white;
  }
  return color;
}

String getRarityName(Rarity rarity) {
  String text = 'Common';
  switch (rarity) {
    case Rarity.Common:
      text = 'Common';
      break;
    case Rarity.Uncommon:
      text = 'Uncommon';
      break;
    case Rarity.Rare:
      text = 'Rare';
      break;
    case Rarity.Mythic:
      text = 'Mythic';
      break;
    case Rarity.Fabled:
      text = 'Fabled';
      break;
    default:
      text = 'Common';
  }
  return text;
}
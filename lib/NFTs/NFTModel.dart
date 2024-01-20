import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

enum Rarity {
  Common,
  Uncommon,
  Rare,
  Mythic,
  Fabled,
}

enum Race {
  Eldmen('Eldmen', RpgAwesome.sunbeams, 'eldmen', Color(0xFF706c12), 'Healing, Religious, Cavalry, Gold Income'),  //2e2e2a //RpgAwesome.angel_wings
  Keenfolk('Keenfolk', RpgAwesome.heavy_shield, 'keenfolk', Color(0xFF1f1d12), 'Defensive, Infantry, Industrious, Territorial'),
  Keldarin("Kel'Darin", RpgAwesome.trefoil_lily, 'keldarin', Color(0xFF183d0e), 'Magic, Ranged, Map Vision, Ambush'),
  Grolls('Grolls', RpgAwesome.monster_skull, 'grolls', Color(0xFF521405), 'Aggressive, Swift Movement, Invasive, Unit Income'),
  Travelers('Travelers', RpgAwesome.arcane_mask, 'travelers', Color(0xFF051c52), 'Dispensable Units, Swarm Tactics, Resurrection, Invocations'),
  Unknown('???', FontAwesome.question, 'unknown', Colors.black26, '');

  const Race(this.label, this.icon, this.name, this.color, this.characterization);
  final String label;
  final IconData icon;
  final String name;
  final Color color;
  final String characterization;
}

enum Classs {
  Unit('Unit'),
  Hero('Hero'),
  Doctrine('Doctrine'),
  Technology('Technology'),
  Artifact('Artifact'),
  Skin('Skin'),
  Pass('Pass'),
  Pack('Pack');

  const Classs(this.label);
  final String label;
}

class NFTModel {
  String id;
  String name;
  String imageUrl;
  Rarity rarity;
  Race race;
  Classs classs;
  String category;
  String description;
  String flavorText;
  int usdPrice;
  String totalSupply;
  int guardValue;
  String armorType;
  String attackType;
  List<dynamic> passives;
  List<String> passiveDescriptions;
  List<dynamic> bonuses;
  int amount;

  NFTModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rarity,
    required this.race,
    required this.classs,
    required this.category,
    required this.description,
    required this.flavorText,
    required this.usdPrice,
    required this.totalSupply,
    required this.guardValue,
    this.armorType = '',
    this.attackType = '',
    this.passives = const [],
    this.passiveDescriptions = const [],
    this.bonuses = const [],
    this.amount = 0,
  });

  String getRarity() {
    return rarity.toString();
  }

  String getRace() {
    return race.toString();
  }

}
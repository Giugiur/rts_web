import 'dart:ui';

enum Rarity {
  Common,
  Uncommon,
  Rare,
  Mythic,
  Fabled,
}

enum Race {
  Eldmen('Eldmen', Color(0xFF706c12)),  //2e2e2a
  Keenfolk('Keenfolk', Color(0xFF1f1d12)),
  Keldarin("Kel'Darin", Color(0xFF183d0e)),
  Grolls('Grolls', Color(0xFF521405)),
  Travelers('Travelers', Color(0xFF051c52));

  const Race(this.label, this.color);
  final String label;
  final Color color;
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
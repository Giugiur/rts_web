enum Rarity {
  Common,
  Uncommon,
  Rare,
  Mythic,
  Fabled,
}

enum Race {
  Eldmen('Eldmen'),
  Keenfolk('Keenfolk'),
  Keldarin("Kel'Darin"),
  Grolls('Grolls'),
  Dragonkin('Dragonkin');

  const Race(this.label);
  final String label;
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
  final String id;
  final String name;
  final String imageUrl;
  final Rarity rarity;
  final Race race;
  final Classs classs;
  final String category;
  final String description;
  final String flavorText;
  final int usdPrice;
  final String totalSupply;
  final int guardValue;
  String armorType;
  String attackType;
  List<dynamic> passives;
  List<String> passiveDescriptions;
  List<dynamic> bonuses;

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
  });

  String getRarity() {
    return rarity.toString();
  }

  String getRace() {
    return race.toString();
  }

}
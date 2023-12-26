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

  // NFTModel.from(NFTModel nft) {
  //   id = nft.id;
  //   name = nft.name;
  //   imageUrl = nft.imageUrl;
  //   rarity = nft.rarity;
  //   race = nft.race;
  //   classs = nft.classs;
  //   category = nft.category;
  //   description = nft.description;
  //   flavorText = nft.flavorText;
  //   usdPrice = nft.usdPrice;
  //   totalSupply = nft.totalSupply;
  //   guardValue = nft.guardValue;
  //   armorType = nft.armorType;
  //   attackType = nft.attackType;
  //   passives = nft.passives;
  //   passiveDescriptions = nft.passiveDescriptions;
  //   bonuses = nft.bonuses;
  //   amount = nft.amount;
  // }

  String getRarity() {
    return rarity.toString();
  }

  String getRace() {
    return race.toString();
  }

}
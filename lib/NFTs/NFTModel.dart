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
  Item('Item'),
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
  List<String> passives;
  String passiveName;
  String passiveDescription;

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
    this.passives = const [],
    this.passiveName = '',
    this.passiveDescription = '',
  });

  String displayPassives() {
    String ret = '';
    for (var passive in passives) {
      if (passives.length-1 == passives.indexOf(passive)) {
        ret += passive;
      } else {
        ret += '$passive, ';
      }
    }
    return ret;
  }

  String getRarity() {
    return rarity.toString();
  }

  String getRace() {
    return race.toString();
  }

}
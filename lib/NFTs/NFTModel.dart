enum Rarity {
  Common,
  Uncommon,
  Rare,
  Mythic,
  Fabled,
}

enum Race {
  Eldmen,
  Keenfolk,
  Velhan,
  Gorks,
  Shadowlings,
}

enum Type {
  Unit,
  Hero,
  Item,
  Skin,
  Pass,
  Pack,
}

class NFTModel {
  final String id;
  final String name;
  final String imageUrl;
  final Rarity rarity;
  final Race race;
  final Type type;

  NFTModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rarity,
    required this.race,
    required this.type,
  });

  String getRarity() {
    return rarity.toString();
  }

}
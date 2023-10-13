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

class MarketplaceListing {
  final String id;
  final String name;
  final String imageUrl;
  final Rarity rarity;
  final Race race;

  MarketplaceListing({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rarity,
    required this.race,
  });

  String getRarity() {
    return rarity.toString();
  }
}
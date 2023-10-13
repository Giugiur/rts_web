enum Rarity {
  Common,
  Uncommon,
  Rare,
  Mythic,
  Fabled,
}
class MarketplaceListing {
  final String id;
  final String name;
  final String imageUrl;
  final Rarity rarity;

  MarketplaceListing({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rarity,
  });

  String getRarity() {
    return rarity.toString();
  }
}
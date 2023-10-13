import 'package:flutter/material.dart';
import 'marketplace_listing_model.dart';

class MarketplaceRarityTag extends StatelessWidget {
  final Rarity rarity;
  const MarketplaceRarityTag(this.rarity, {super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    String text = 'Common';

    switch (rarity) {
      case Rarity.Common:
        color = Colors.white;
        text = 'Common';
        break;
      case Rarity.Uncommon:
        color = Colors.greenAccent;
        text = 'Uncommon';
        break;
      case Rarity.Rare:
        color = Colors.lightBlue;
        text = 'Rare';
        break;
      case Rarity.Mythic:
        color = Colors.purpleAccent;
        text = 'Mythic';
        break;
      case Rarity.Fabled:
        color = Colors.orangeAccent;
        text = 'Fabled';
        break;
      default:
        color = Colors.white;
        text = 'Common';
    }

    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: ShapeDecoration(
          shape: StadiumBorder(
            side: BorderSide(width: 1.5, color: color),
          ),
        ),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: 10,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

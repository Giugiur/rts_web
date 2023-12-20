import 'package:flutter/material.dart';
import 'package:rts_web/utils/utils.dart';
import 'marketplace_listing_model.dart';

class MarketplaceRarityTag extends StatelessWidget {
  final Rarity rarity;
  const MarketplaceRarityTag(this.rarity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: ShapeDecoration(
          shape: StadiumBorder(
            side: BorderSide(width: 1.5, color: getRarityColor(rarity)),
          ),
        ),
        child: Text(
          getRarityName(rarity).toUpperCase(),
          style: TextStyle(
            fontSize: 10,
            color: getRarityColor(rarity),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

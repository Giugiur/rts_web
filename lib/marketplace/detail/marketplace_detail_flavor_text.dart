import 'package:flutter/material.dart';

class MarketplaceDetailFlavorText extends StatelessWidget {
  final String flavorText;
  const MarketplaceDetailFlavorText(this.flavorText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
      child: Text(
        flavorText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 18,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

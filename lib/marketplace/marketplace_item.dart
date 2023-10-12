import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rts_web/marketplace/marketplace_listing_model.dart';
import '../utils/custom_box_shadow.dart';

class MarketplaceItem extends StatelessWidget {
  final MarketplaceListing marketplaceListing;

  const MarketplaceItem(this.marketplaceListing, {super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            CustomBoxShadow(
              color: Colors.black26,
              blurRadius: 1,
              blurStyle: BlurStyle.outer
              ),
            ],
          ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Column(
            children: [
              Expanded(
                flex: 80,
                child: Image.network(
                  marketplaceListing.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 40,
                child: Container(
                  child: Text(marketplaceListing.name),
                ),
              )
            ]
          )
        )
      )
    );
  }
}

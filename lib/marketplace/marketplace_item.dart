import 'package:flutter/material.dart';
import '../utils/i_card.dart';
import 'marketplace_listing_model.dart';
import '../utils/custom_box_shadow.dart';
import 'marketplace_rarity_tag.dart';

class MarketplaceItem extends StatelessWidget {
  final MarketplaceListing marketplaceListing;
  const MarketplaceItem(this.marketplaceListing, {super.key});

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: () {}, //TODO: Open item page
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              CustomBoxShadow(
                color: Colors.black26,
                blurRadius: 0,
                blurStyle: BlurStyle.outer
              ),
            ],
          ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 90,
                    child: SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: 600,
                          height: 800,
                          child: ICard(marketplaceListing)
                        ),
                      ),
                    )
                  ),
                  Expanded(
                    flex: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              marketplaceListing.name,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Align(
                          alignment: Alignment.centerRight,
                          child: MarketplaceRarityTag(marketplaceListing.rarity)
                        )
                      ]
                    ),
                  )
                ]
              )
            )
          )
        ),
      );
  }
}

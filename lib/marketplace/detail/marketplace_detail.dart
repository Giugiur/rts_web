import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/marketplace/detail/marketplace_detail_attribute.dart';
import 'package:rts_web/marketplace/detail/marketplace_detail_flavor_text.dart';
import 'package:rts_web/marketplace/detail/marketplace_detail_mint_buttons.dart';
import 'package:rts_web/marketplace/marketplace_rarity_tag.dart';
import '../../NFTs/NFTModel.dart';
import '../../home/home_scaffold.dart';
import 'marketplace_detail_controller.dart';

class MarketplaceDetail extends StatelessWidget {
  const MarketplaceDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return GetBuilder<MarketplaceDetailController>(
      init: MarketplaceDetailController(),
      builder: (marketplaceDetailController) => HomeScaffold(
        body: marketplaceDetailController.isReady ?
        Row(
          children: [
            Expanded(
              flex: 50,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                 child: Center(
                   child: Image.network(marketplaceDetailController.assetDetail.imageUrl),
                 ),
              ),
            ),
            Container(
              width: 2,
              color: Colors.blueGrey,
            ),
            Expanded(
              flex: 50,
              child: Padding(
                padding: const EdgeInsets.all(60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          marketplaceDetailController.assetDetail.name,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    MarketplaceRarityTag(marketplaceDetailController.assetDetail.rarity),
                    const SizedBox(height: 20,),
                    SizedBox(
                      child: Text(
                        marketplaceDetailController.assetDetail.description,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 25,
                          child: MarketplaceDetailAttribute('Race: ', marketplaceDetailController.assetDetail.race.label)
                        ),
                        Expanded(
                          flex: 25,
                          child: MarketplaceDetailAttribute('Class: ', marketplaceDetailController.assetDetail.classs.label)
                        ),
                        Expanded(
                          flex: 25,
                          child: MarketplaceDetailAttribute('Category: ', marketplaceDetailController.assetDetail.category)
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    MarketplaceDetailMintButtons(),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      child: Center(child: MarketplaceDetailFlavorText(marketplaceDetailController.assetDetail.flavorText))
                    ),
                  ],
                ),
              ),
            ),
          ],
        ) : Container()
      )
    );
  }
}

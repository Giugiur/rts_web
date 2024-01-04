import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/marketplace/detail/marketplace_detail_bonus_description.dart';
import 'package:video_player/video_player.dart';
import 'package:rts_web/marketplace/detail/marketplace_detail_attribute.dart';
import 'package:rts_web/marketplace/detail/marketplace_detail_flavor_text.dart';
import 'package:rts_web/marketplace/detail/marketplace_detail_mint_buttons.dart';
import 'package:rts_web/marketplace/detail/marketplace_detail_passive_popup.dart';
import 'package:rts_web/marketplace/marketplace_rarity_tag.dart';
import '../../NFTs/NFTModel.dart';
import '../../NFTs/NFTs_controller.dart';
import '../../home/home_scaffold.dart';
import '../../widgets/custom_loading_indicator.dart';
import 'marketplace_detail_controller.dart';

class MarketplaceDetail extends StatefulWidget {
  const MarketplaceDetail({super.key});

  @override
  State<MarketplaceDetail> createState() => _MarketplaceDetailState();
}

class _MarketplaceDetailState extends State<MarketplaceDetail> {
  //late VideoPlayerController _backgroundVideoController;

  @override
  void initState() {
    // NFTsController nftsController = Get.put(NFTsController());
    MarketplaceDetailController marketplaceDetailController = Get.put(MarketplaceDetailController());
    marketplaceDetailController.setReadyStatus(false);
    print('init State on widget');
    var id = Get.parameters['id'];
    marketplaceDetailController.setAssetDetail(id!).then((response) {
      marketplaceDetailController.setReadyStatus(true);
    });
    // if (marketplaceDetailController.assetDetail.rarity == Rarity.Rare ||
    //     marketplaceDetailController.assetDetail.rarity == Rarity.Mythic ||
    //     marketplaceDetailController.assetDetail.rarity == Rarity.Fabled) {
    //   nftsController.getNFTs().then((response) {
    //     var asset = response.firstWhere((nft) => nft.id == id);
    //     String videoDir = 'videos/${asset.name}.mp4';
    //
    //     _backgroundVideoController = VideoPlayerController.asset(
    //         videoDir
    //     )
    //       ..initialize().then((_) {
    //         setState(() {});
    //       });
    //     _backgroundVideoController.setLooping(true);
    //     _backgroundVideoController.setVolume(0);
    //     _backgroundVideoController.play();
    //   });
    // }
    super.initState();
  }

  // @override dispose() {
  //   _backgroundVideoController.dispose();
  //   super.dispose();
  // }

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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MarketplaceDetailAttribute('Race: ', marketplaceDetailController.assetDetail.race.label),
                        const SizedBox(width: 40,),
                        MarketplaceDetailAttribute('Class: ', marketplaceDetailController.assetDetail.classs.label),
                        const SizedBox(width: 40,),
                        MarketplaceDetailAttribute('Category: ', marketplaceDetailController.assetDetail.category),
                        const SizedBox(width: 40,),
                        MarketplaceDetailAttribute('Guard Value: ', marketplaceDetailController.assetDetail.guardValue.toString()),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    marketplaceDetailController.assetDetail.classs == Classs.Unit ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MarketplaceDetailAttribute('Armor Type: ', marketplaceDetailController.assetDetail.armorType),
                        const SizedBox(width: 40,),
                        MarketplaceDetailAttribute('Attack Type: ', marketplaceDetailController.assetDetail.attackType),
                      ],
                    ) : Container(),
                    marketplaceDetailController.assetDetail.classs == Classs.Doctrine ||  marketplaceDetailController.assetDetail.classs == Classs.Technology ?
                        MarketplaceDetailBonusDescription(marketplaceDetailController.assetDetail) : Container(),
                    const SizedBox(height: 20),
                    marketplaceDetailController.assetDetail.classs == Classs.Unit || marketplaceDetailController.assetDetail.classs == Classs.Hero ?
                      Container(width:double.infinity, child: Center(child: MarketplaceDetailPassivePopup(marketplaceDetailController.assetDetail))) : Container(),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        MarketplaceDetailAttribute('Origination price: USD', marketplaceDetailController.assetDetail.usdPrice.toString()),
                        const SizedBox(width: 20,),
                        MarketplaceDetailAttribute('Total Supply: ', marketplaceDetailController.assetDetail.totalSupply),
                      ]
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
        ) : const CustomLoadingIndicator()
      )
    );
  }
}

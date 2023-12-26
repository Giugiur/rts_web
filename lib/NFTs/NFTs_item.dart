import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/i_card.dart';
import 'NFTModel.dart';
import '../utils/custom_box_shadow.dart';
import '../utils/constants.dart';
import '../marketplace/marketplace_rarity_tag.dart';

class NftItem extends StatelessWidget {
  final NFTModel nftModel;
  const NftItem(this.nftModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return
      AspectRatio(
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
                        child: ICard(nftModel)
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
                            nftModel.name,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Get.currentRoute == INVENTORY ? Text('(${nftModel.amount})'): MarketplaceRarityTag(nftModel.rarity)
                      )
                    ]
                  ),
                )
              ]
            )
          )
        )
      );
  }
}

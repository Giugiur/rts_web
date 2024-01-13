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
        aspectRatio: 1 / 1.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: 700,
                height: 1000,
                child: ICard(nftModel)
              ),
            ),
          )
        )
      );
  }
}

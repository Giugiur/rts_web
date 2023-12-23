import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../NFTs/NFTModel.dart';

class InventoryItem extends StatelessWidget {
  final NFTModel nftModel;
  const InventoryItem(this.nftModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(nftModel.name),
          Text(nftModel.id),
          Text(nftModel.rarity.toString()),
          Text(nftModel.race.toString()),
          Text(nftModel.imageUrl),
          Text(nftModel.classs.toString()),
        ],
      ),
    );
  }
}

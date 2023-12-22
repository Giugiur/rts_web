import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rts_web/NFTs/NFTs_item.dart';
import 'package:rts_web/inventory/inventory_item.dart';
import 'package:rts_web/utils/constants.dart';

import '../utils/utils.dart';
import 'inventory_controller.dart';

class InventoryGrid extends StatelessWidget {
  InventoryGrid({super.key});
  final inventoryController = Get.put(InventoryController());
  @override
  Widget build(BuildContext context) {
    return inventoryController.displayList.isEmpty ?
    Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'It seems that your Inventory is empty. Lets start by',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          TextButton(
            onPressed: () => inventoryController.getUserAssets(), //Get.toNamed(MARKETPLACE)
            child: Text(
              'buying an asset.',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          )
        ],
      ),
    ) :
    GridView.builder(
        controller: ScrollController(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: isSmallScreen(context) ? 600 : 300,
          childAspectRatio: 1 / 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: inventoryController.displayList.length,
        itemBuilder: (ctx, index) => NftItem(inventoryController.displayList[index])
    );
  }
}

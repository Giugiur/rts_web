import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/utils.dart';
import 'marketplace_controller.dart';
import 'marketplace_item.dart';

class MarketplaceGrid extends StatelessWidget {
  const MarketplaceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    var marketplaceController = Get.put(MarketplaceController());

    return Obx(() =>  marketplaceController.displayList.isEmpty ?
      Center(
        child: Text(
          'No results match your search criteria.',
          style: Theme.of(context).textTheme.headline4,
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
          itemCount: marketplaceController.displayList.length,
          itemBuilder: (ctx, index) => MarketplaceItem(marketplaceController.displayList[index])
      ),
    );
  }
}

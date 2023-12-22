import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_scaffold.dart';
import 'marketplace_detail_controller.dart';

class MarketplaceDetail extends StatelessWidget {
  const MarketplaceDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MarketplaceDetailController>(
      init: MarketplaceDetailController(),
      builder: (marketplaceDetailController) => HomeScaffold(
        body: Row(
          children: [
            Expanded(
              flex: 50,
              child: Container(
                 color: Colors.red,
              ),
            ),
            Expanded(
              flex: 50,
              child: Container(
                color: Colors.black,
              ),
            ),
          ],
        )
      )
    );
  }
}

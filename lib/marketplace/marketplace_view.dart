import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_scaffold.dart';
import '../utils/utils.dart';
import 'marketplace_controller.dart';
import 'marketplace_filters.dart';
import 'marketplace_grid.dart';

class MarketplaceView extends StatelessWidget {
  const MarketplaceView({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<MarketplaceController>(
      init: MarketplaceController(),
      builder: (marketplaceController) => HomeScaffold(
        body: Padding(
          padding: const EdgeInsets.all(60),
          child: Row(
            children: [
              Expanded(
                flex: isSmallScreen(context) ? 0 : 25,
                child: isSmallScreen(context)
                  ? Container()
                  : const MarketplaceFilters(),
              ),
              const SizedBox(width: 20,),
              Expanded(
                flex: 75,
                child: marketplaceController.isReady ?
                  const MarketplaceGrid() :
                  const CircularProgressIndicator()
              ),
            ],
          ),
        ),
      ),
    );
  }
}

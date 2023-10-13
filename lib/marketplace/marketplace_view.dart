import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_scaffold.dart';
import '../utils/utils.dart';
import 'marketplace_controller.dart';
import 'marketplace_filters.dart';
import 'marketplace_grid.dart';

class MarketplaceView extends StatefulWidget {
  const MarketplaceView({super.key});

  @override
  State<MarketplaceView> createState() => _MarketplaceViewState();
}

class _MarketplaceViewState extends State<MarketplaceView> {
  @override
  Widget build(BuildContext context) {

    return HomeScaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Row(
          children: [
            Expanded(
              flex: isSmallScreen(context) ? 0 : 25,
              child: isSmallScreen(context)
                ? Container()
                : const MarketplaceFilters(),
            ),
            const SizedBox(width: 20,),
            const Expanded(
                flex: 75,
                child: MarketplaceGrid()
            ),
          ],
        ),
      ),
    );
  }
}

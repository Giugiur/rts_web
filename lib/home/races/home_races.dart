import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/home/races/home_race_page.dart';
import 'package:rts_web/home/races/race_tile.dart';
import '../../NFTs/NFTModel.dart';
import '../home_controller.dart';

class HomeRaces extends StatelessWidget {
  const HomeRaces({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
      builder: (homeController) => SizedBox(
      width: deviceSize.width,
      height: deviceSize.height,
      child: Center(
        child: Row(
          children: [
            Expanded(
              flex: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(child: RaceTile(homeController.isEldmenTileSelected, Race.Eldmen), onTap: () => homeController.selectNewTile(Race.Eldmen),),
                  InkWell(child: RaceTile(homeController.isGrollTileSelected, Race.Grolls), onTap: () => homeController.selectNewTile(Race.Grolls),),
                  InkWell(child: RaceTile(homeController.isKeldarinTileSelected, Race.Keldarin), onTap: () => homeController.selectNewTile(Race.Keldarin)),
                  const RaceTile(false, Race.Unknown),
                  const RaceTile(false, Race.Unknown),
                ],
              ),
            ),
          ],
        ),
      )
      )
    );
  }
}

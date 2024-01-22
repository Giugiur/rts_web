import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/home/races/home_race_page.dart';
import 'package:rts_web/home/races/race_tile.dart';
import 'package:rts_web/widgets/fade_in_container.dart';
import '../../NFTs/NFTModel.dart';
import '../home_controller.dart';

class HomeRaces extends StatelessWidget {
  const HomeRaces({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
      builder: (homeController) => FadeInContainer(
        visibility: homeController.racesSectionVisible,
        child: SizedBox(
        width: deviceSize.width*0.85,
        height: deviceSize.height,
        child: Center(
          child: Row(
            children: [
              Expanded(
                flex: 40,
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
              Expanded(
                flex: 60,
                child: Center(
                  child: switch (homeController.raceToShow) {
                    Race.Eldmen => HomeRacePage(Race.Eldmen, homeController.isEldmenTileSelected),
                    Race.Grolls => HomeRacePage(Race.Grolls, homeController.isGrollTileSelected),
                    Race.Keldarin => HomeRacePage(Race.Keldarin, homeController.isKeldarinTileSelected),
                    Object() => null,
                  },
                ),

              )
            ],
          ),
        )
        ),
      )
    );
  }
}

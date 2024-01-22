import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/home/home_controller.dart';
import 'package:rts_web/widgets/fade_in_container.dart';
import '../../NFTs/NFTModel.dart';

class HomeRacePage extends StatefulWidget {
  final Race race;
  bool opacity;

  HomeRacePage(this.race, this.opacity, {super.key});

  @override
  State<HomeRacePage> createState() => _HomeRacePageState();
}

class _HomeRacePageState extends State<HomeRacePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) => AnimatedOpacity(
        opacity: widget.opacity ? 1 : 0,
        duration: const Duration(milliseconds: 1000),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 50,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel egestas dolor, nec dignissim metus. Donec augue elit, rhoncus ac sodales id, porttitor vitae est. Donec laoreet rutrum libero sed pharetra. Duis a arcu convallis, gravida purus eget, mollis diam. \n"
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel egestas dolor, nec dignissim metus. Donec augue elit, rhoncus ac sodales id, porttitor vitae est. Donec laoreet rutrum libero sed pharetra. Duis a arcu convallis, gravida purus eget, mollis diam. \n",
                      textAlign: TextAlign.left,
                      style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge,
                    ),
                  ),
                  Expanded(
                    flex: 50,
                    child: Image.asset(
                      'images/${widget.race.name.toLowerCase()}_keyart.png',
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
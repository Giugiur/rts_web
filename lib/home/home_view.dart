import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/home/races/home_races.dart';
import 'package:rts_web/home/whitepaper/home_whitepaper.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'package:anchor_scroll_controller/anchor_scroll_controller.dart';
import 'home_controller.dart';
import 'home_intro_section.dart';
import 'home_scaffold.dart';
import 'locations/home_locations.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) =>
        HomeScaffold(
           body: Listener(
            onPointerSignal: (pointerSignal) => homeController.listenForScrolling(pointerSignal),
            child: WebSmoothScroll(
            controller: homeController.anchorScrollController,
            child: SingleChildScrollView(
                controller: homeController.anchorScrollController,
                physics: const NeverScrollableScrollPhysics(),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    AnchorItemWrapper(
                      controller: homeController.anchorScrollController,
                      index: 0,
                      child: const HomeIntroSection()
                    ),
                    AnchorItemWrapper(
                        controller: homeController.anchorScrollController,
                        index: 1,
                        child: const HomeWhitepaper()
                    ),
                    AnchorItemWrapper(
                        controller: homeController.anchorScrollController,
                        index: 2,
                        child: const HomeRaces()
                    ),
                    AnchorItemWrapper(
                        controller: homeController.anchorScrollController,
                        index: 3,
                        child: const HomeLocations()
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}

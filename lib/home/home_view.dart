import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/home/races/home_races.dart';
import 'package:rts_web/home/whitepaper/home_whitepaper.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'package:anchor_scroll_controller/anchor_scroll_controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'home_controller.dart';
import 'home_intro_section.dart';
import 'home_scaffold.dart';
import 'marketplace/home_marketplace.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) => HomeScaffold(
        body: Stack(
          children: [
            PageView(
              pageSnapping: false,
              controller: _pageController,
              scrollDirection: Axis.vertical,
              onPageChanged: (page) => homeController.setHomePage(page),
              children: const [
                HomeIntroSection(),
                HomeWhitepaper(),
                HomeMarketplace(),
              ],
            ),
            SizedBox(
              width: deviceSize.width,
              height: deviceSize.height,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: deviceSize.width*0.15,
                  height: deviceSize.height*0.5,
                  child: SfLinearGauge(
                      orientation: LinearGaugeOrientation.vertical,
                      showTicks: false,
                      isAxisInversed: true,
                      minimum: 0,
                      maximum: 4,
                      interval: 1,
                      markerPointers: [
                        LinearShapePointer(
                          value: homeController.page,
                          enableAnimation: true,
                          animationDuration: 600,
                          animationType: LinearAnimationType.easeInCirc,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                      barPointers: [
                        LinearBarPointer(
                          value: homeController.page,
                          enableAnimation: true,
                          animationDuration: 600,
                          animationType: LinearAnimationType.easeInCirc,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                      labelFormatterCallback: (label) {
                        if (label == '0') {
                          return 'Intro';
                        }
                        if (label == '1') {
                          return 'Whitepaper';
                        }
                        if (label == '2') {
                          return 'Marketplace';
                        }
                        if (label == '3') {
                          return 'The Known World';
                        }
                        if (label == '4') {
                          return 'Races';
                        }
                        return label;
                      }
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
        // HomeScaffold(
        //    body: Listener(
        //     onPointerSignal: (pointerSignal) => homeController.listenForScrolling(pointerSignal),
        //     child: WebSmoothScroll(
        //     controller: homeController.anchorScrollController,
        //     child: SingleChildScrollView(
        //         controller: homeController.anchorScrollController,
        //         physics: const NeverScrollableScrollPhysics(),
        //         child: ListView(
        //           shrinkWrap: true,
        //           children: [
        //             AnchorItemWrapper(
        //               controller: homeController.anchorScrollController,
        //               index: 0,
        //               child: const HomeIntroSection()
        //             ),
        //             AnchorItemWrapper(
        //                 controller: homeController.anchorScrollController,
        //                 index: 1,
        //                 child: const HomeWhitepaper()
        //             ),
        //             AnchorItemWrapper(
        //                 controller: homeController.anchorScrollController,
        //                 index: 2,
        //                 child:  HomeLocations()
        //             ),
        //             AnchorItemWrapper(
        //                 controller: homeController.anchorScrollController,
        //                 index: 3,
        //                 child: const HomeRaces()
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
    );
  }
}

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
  final PageController _pageController = PageController();
  double currentPageValue = 0.0;

  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page != null && _pageController.page! <= 1.0) {
        setState(() {
          currentPageValue = _pageController.page!;
        });
      }
    });
    super.initState();
  }

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
        body: PageView(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          children: [
            HomeIntroSection()
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

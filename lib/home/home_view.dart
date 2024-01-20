import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/home/intro/home_linear_gauge.dart';
import 'package:rts_web/home/races/home_races.dart';
import 'package:rts_web/home/whitepaper/home_whitepaper.dart';
import 'package:rts_web/tracking/tracking_controller.dart';
import '../tracking/cookie_banner.dart';
import 'home_controller.dart';
import 'intro/home_intro_section.dart';
import 'home_scaffold.dart';
import 'marketplace/home_marketplace.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final TrackingController trackingController = Get.put(TrackingController());

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) => HomeScaffold(
        body: Row(
          children: [
            Expanded(
              flex: 10,
              child: SizedBox(
                width: deviceSize.width,
                height: deviceSize.height,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: deviceSize.width*0.15,
                    height: deviceSize.height*0.5,
                    child: const HomeLinearGauge(),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 90,
              child: Stack(
                children: [
                  PageView(
                    pageSnapping: false,
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    onPageChanged: (page) => homeController.setHomePage(page),
                    children: const [
                      HomeRaces(),
                      HomeIntroSection(),
                      HomeWhitepaper(),
                    ],
                  ),
                  AnimatedOpacity(
                    opacity: homeController.isCookieBannerVisible ? 1 : 0,
                    duration: Duration(milliseconds: 500),
                    child: SizedBox(
                      width: deviceSize.width,
                      height: deviceSize.height,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: homeController.isCookieBannerDestroyed ? Container() : const CookieBanner(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}

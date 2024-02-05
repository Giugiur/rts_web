import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/home/intro/home_linear_gauge.dart';
import 'package:rts_web/home/races/home_races.dart';
import 'package:rts_web/home/whitepaper/home_whitepaper.dart';
import 'package:rts_web/tracking/tracking_controller.dart';
import 'package:rts_web/utils/utils.dart';
import 'package:video_player/video_player.dart';
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
  late VideoPlayerController _backgroundVideoController;

  @override
  void initState() {
    String videoDir = 'videos/home_intro.mp4';
    _backgroundVideoController = VideoPlayerController.asset(
        videoDir
    )
      ..initialize().then((_) {
        setState(() {});
      });
    _backgroundVideoController.setLooping(true);
    _backgroundVideoController.setVolume(0);
    _backgroundVideoController.play();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _backgroundVideoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) => Stack(
        children: [
          AnimatedOpacity(
            opacity: homeController.isFirstVisit ? 0 : 1,
            duration: const Duration(milliseconds: 750),
            child: HomeScaffold(
                body: Stack(
                  children: [
                    SizedBox(
                      height: deviceSize.height,
                      width: deviceSize.width,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _backgroundVideoController.value.size.width ?? 0,
                          height: _backgroundVideoController.value.size.height ?? 0,
                          child: VideoPlayer(_backgroundVideoController),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.8),
                      width: deviceSize.width,
                      height: deviceSize.height,
                    ),
                    Row(
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
                                  allowImplicitScrolling: true,
                                  controller: _pageController,
                                  scrollDirection: Axis.vertical,
                                  onPageChanged: (page) => homeController.setHomePage(page),
                                  children: const [
                                    HomeIntroSection(),
                                    HomeRaces(),
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
                  ],
                )
            ),
          ),
          AnimatedOpacity(
            opacity: homeController.isFirstVisit ? 1 : 0,
            duration: const Duration(milliseconds: 750),
            child: Container(
              width: homeController.isFirstVisit ? deviceSize.width : 0,
              height: homeController.isFirstVisit ? deviceSize.height : 0,
              decoration: gradientDecoration,
              child: Image.asset(
                'images/loading.gif',
                height: 50,
                width: 50,
              ),
            ),
          )
        ],
      ),
    );
  }
}

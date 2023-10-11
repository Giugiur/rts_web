import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'home_controller.dart';
import 'home_intro_section.dart';
import 'home_scaffold.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) =>
        HomeScaffold(
          body: Listener(
            onPointerSignal: (pointerSignal) => homeController.listenForScrolling(pointerSignal),
            child: WebSmoothScroll(
              controller: !homeController.scrolled ? ScrollController() : _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const NeverScrollableScrollPhysics(),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const HomeIntroSection(),
                    Container(
                      width: deviceSize.width,
                      height: deviceSize.height,
                      color: Colors.blue,
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

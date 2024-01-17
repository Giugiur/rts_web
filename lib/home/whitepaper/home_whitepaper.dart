import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/home/home_controller.dart';
import 'package:rts_web/widgets/fade_in_container.dart';

import '../../widgets/hero_button.dart';

class HomeWhitepaper extends StatefulWidget {
  const HomeWhitepaper({super.key});

  @override
  State<HomeWhitepaper> createState() => _HomeWhitepaperState();
}

class _HomeWhitepaperState extends State<HomeWhitepaper> {

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
        init: HomeController(),
    builder: (homeController) => FadeInContainer(
      visibility: homeController.whitepaperSectionVisible,
      child: Center(
        child: Container(
          width: deviceSize.width,
          height: deviceSize.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: deviceSize.width,
                child: Center(
                  child: Text(
                    'Want to know more?',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              HeroButton(
                label: 'Read our Whitepaper',
                onTap: () {},
              ),
            ],
          ),
        )
      ),)
    );
  }
}

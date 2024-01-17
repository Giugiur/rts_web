import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/home/home_controller.dart';
import 'package:rts_web/widgets/fade_in_container.dart';

import '../../utils/constants.dart';
import '../../widgets/hero_button.dart';

class HomeMarketplace extends StatefulWidget {
  const HomeMarketplace({super.key});

  @override
  State<HomeMarketplace> createState() => _HomeMarketplaceState();
}

class _HomeMarketplaceState extends State<HomeMarketplace> {

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
        init: HomeController(),
    builder: (homeController) => FadeInContainer(
      visibility: homeController.marketplaceSectionVisible,
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
                    'Visit the Marketplace',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              HeroButton(
                label: 'Marketplace',
                onTap: () => Get.toNamed(MARKETPLACE),
              ),
            ],
          ),
        )
      ),)
    );
  }
}

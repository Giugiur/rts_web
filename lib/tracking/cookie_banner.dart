import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:rts_web/home/home_controller.dart';
import 'package:rts_web/widgets/hero_button.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class CookieBanner extends StatelessWidget {
  const CookieBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) => Container(
        margin: const EdgeInsets.all(50),
        child: BlurryContainer(
          blur: 50,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          height: 170,
          width: 490,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Cookie Policy'.toUpperCase(),
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.start,
                  ),
                  IconButton(
                    icon: const Icon(
                      Octicons.x,
                      size: 18,
                    ),
                    onPressed: () => homeController.hideCookiesBanner(),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  Expanded(
                    flex: 75,
                    child: Text(
                      "We use cookies to enhance your experience and analyze our site usage. By pressing 'Accept' you agree to store cookies in your device. Please see our Cookie Policy for more information.",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    flex: 25,
                    child: HeroButton(
                      label: 'Accept',
                      onTap: () => homeController.acceptAllCookies(),
                    ),
                  ),
                ],
              ),
            ]

          ),
        ),
      )
    );
  }
}

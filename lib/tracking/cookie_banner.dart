import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/home/home_controller.dart';
import 'package:rts_web/widgets/hero_button.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:rts_web/widgets/primary_button.dart';

class CookieBanner extends StatelessWidget {
  const CookieBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) => Container(
        margin: const EdgeInsets.all(50),
        child: BlurryContainer(
          blur: 25,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          height: 170,
          width: 490,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Cookies Policy'.toUpperCase(),
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.start,
                    ),
                    IconButton(
                      icon: const Icon(
                        CupertinoIcons.xmark,
                        size: 18,
                      ),
                      onPressed: () => homeController.hideCookiesBanner(),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 80,
                child: Row(
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
                      child: PrimaryButton(
                        label: 'Accept'.toUpperCase(),
                        onTap: () => homeController.acceptAllCookies(),
                      )
                    ),
                  ],
                ),
              ),
            ]

          ),
        ),
      ),
    );
  }
}
